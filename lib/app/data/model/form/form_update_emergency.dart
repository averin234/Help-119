import 'package:kreki119/app/core/model/emergency_status.dart';

class FormUpdateEmergency {
  FormUpdateEmergency({
    required this.emergencyId,
    required this.userId,
    this.status,
    this.description
  });

  FormUpdateEmergency.fromJson(dynamic json) {
    emergencyId = json['emergencyId'];
    userId = json['userId'];
    status = json['status'];
    description = json['description'];
  }
  late String emergencyId;
  late String userId;
  EmergencyStatus? status;
  String? description;

  Map<String, dynamic> toJson() {
    final map = <String, dynamic>{};
    map['emergencyId'] = emergencyId;
    map['userId'] = userId;
    map['status'] = status?.description;
    map['description'] = description;

    return map;
  }

}