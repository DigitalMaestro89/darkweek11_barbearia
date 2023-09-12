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
    return switch (json['profile']) {
      'ADM' => UserModelADM.fromMap(json),
      'EMPLOYEE' => UserModelEmployee.fromMap(json),
      _ => throw FormatException('Invalid UserModel JSON: $json')
    };
  }
}

final class UserModelADM extends UserModel {
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
          // ignore: avoid_dynamic_calls
          workDays: json['work_days']?.cast<String>(),
          // ignore: avoid_dynamic_calls
          workHours: json['work_hours']?.cast<int>(),
        ),
      _ => throw ArgumentError('Invalid Json'),
    };
  }

  final List<String>? workDays;
  final List<int>? workHours;
}

final class UserModelEmployee extends UserModel {
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
        'work_days': final List workDays,
        'work_hours': final List workHours,
      } =>
        UserModelEmployee(
          id: id,
          name: name,
          email: email,
          workDays: workDays.cast<String>(),
          workHours: workHours.cast<int>(),
          avatar: json['avatar'],
          barbershopId: barbershopId,
        ),
      _ => throw ArgumentError('Invalid UserModelEmployee JSON: $json'),
    };
  }

  final int barbershopId;
  final List<String> workDays;
  final List<int> workHours;
}
