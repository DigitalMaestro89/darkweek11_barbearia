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
          workDays: json['workDays']?.cast<String>(),
          workHours: json['workHours']?.cast<int>(),
        ),
      _ => throw ArgumentError('Invalid Json'),
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
        'work_days': final workDays,
        'work_hours': final workHours,
      } =>
        UserModelEmployee(
          id: id,
          name: name,
          email: email,
          barbershopId: barbershopId,
          avatar: json['avatar'],
          workDays: workDays?.cast<String>(),
          workHours: workHours?.cast<int>(), 
        ),
      _ => throw ArgumentError('Invalid Json'),
    };
  }
}


// {
//     "id": 5,
//     "name": "Rodrigo Rahman 1",
//     "email": "rodrigorahman1@gmail.com",
//     "profile": "ADM",
//     "work_days": [
//         "Seg",
//         "Qua"
//     ],
//     "work_hours": [
//         6,
//         7,
//         8
//     ]
// }