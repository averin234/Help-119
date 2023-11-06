class FormPickEmergency {
  FormPickEmergency({
      required this.emergencyId,
      required this.userId,});

  FormPickEmergency.fromJson(dynamic json) {
    emergencyId = json['emergencyId'];
    userId = json['userId'];
  }
  late String emergencyId;
  late String userId;

  Map<String, dynamic> toJson() {
    final map = <String, dynamic>{};
    map['emergencyId'] = emergencyId;
    map['userId'] = userId;

    return map;
  }

}