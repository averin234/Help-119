class FormEmergency {
  FormEmergency({
      this.latitude, 
      this.longitude, 
      this.photos, 
      this.victimName, 
      this.emergencyDescription, 
      this.emergencyType,});

  FormEmergency.fromJson(dynamic json) {
    latitude = json['latitude'];
    longitude = json['longitude'];
    photos = json['photos'] != null ? json['photos'].cast<String>() : [];
    victimName = json['victim_name'];
    emergencyDescription = json['emergency_description'];
    emergencyType = json['emergency_type'];
  }

  double? latitude;
  double? longitude;
  ///upload photos first and use list of string objectId
  List<String?>? photos;
  String? victimName;
  String? emergencyDescription;
  ///now emergencyType not required
  String? emergencyType;

  Map<String, dynamic> toJson() {
    final map = <String, dynamic>{};
    map['latitude'] = latitude;
    map['longitude'] = longitude;
    map['photos'] = photos;
    map['victim_name'] = victimName;
    map['emergency_description'] = emergencyDescription;
    map['emergency_type'] = emergencyType;

    return map;
  }

}