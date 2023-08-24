sealed class UserModel {
  final int id;
  final String name;
  final String email;
  final String? avatar;

  UserModel({
    required this.id,
    required this.name,
    required this.email,
    this.avatar,
  });

  factory UserModel.fromMap(Map<String, dynamic> json) {
    return switch(json['profile']) {
      'ADM' => UserModelADM.fromMap(json),
      'EMPLOYEE' => UserModelEmployee.fromMap(json),
      _ => throw FormatException('Invalid UserModel JSON: $json')
    };
  }

}

class UserModelADM extends UserModel {
  final List<String>? workDays;
  final List<int>? workHours;

  UserModelADM({
    required super.id,
    required super.name,
    required super.email,
    super.avatar,
    this.workDays,
    this.workHours,
  });

  factory UserModelADM.fromMap(Map<String, dynamic> json) {
    return switch (json) {
      {
        'id': final int id,
        'name': final String name,
        'email': final String email,
      } =>
        UserModelADM(
          id: id,
          name: name,
          email: email,
          avatar: json['avatar'],
          workDays: (json['workDays'] as List<Object?>?)?.cast<String>(),
          workHours: (json['workHours'] as List<Object?>?)?.cast<int>(),
        ),
      _ => throw FormatException('Invalid UserModelAdm JSON: $json'),
    };
  }
}

class UserModelEmployee extends UserModel {
  final int barbershopId;
  final List<String> workDays;
  final List<int> workHours;

  UserModelEmployee({
    required super.id,
    required super.name,
    required super.email,
    required this.barbershopId,
    required this.workDays,
    required this.workHours,
    super.avatar,
  });

  factory UserModelEmployee.fromMap(Map<String, dynamic> json) {
    return switch (json) {
      {
        'id': final int id,
        'name': final String name,
        'email': final String email,
        'barbershop_id': final int barbershopId,
        'work_days': final List<Object?> workDays,
        'work_hours': final List<Object?> workHours,
      } =>
        UserModelEmployee(
          id: id,
          name: name,
          email: email,
          barbershopId: barbershopId,
          avatar: json['avatar'] as String?,
          workDays: workDays.cast<String>(),
          workHours: workHours.cast<int>(), 
        ),
      _ => throw FormatException('Invalid UserModelEmployee JSON: $json'),
    };
  }
}
