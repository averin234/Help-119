import 'dart:convert';
FormUpdateLocation formUpdateLocationFromJson(String str) => FormUpdateLocation.fromJson(json.decode(str));
String formUpdateLocationToJson(FormUpdateLocation data) => json.encode(data.toJson());
class FormUpdateLocation {
  FormUpdateLocation({
      this.latitude, 
      this.longitude,
    this.id
  });

  FormUpdateLocation.fromJson(dynamic json) {
    latitude = json['latitude'];
    longitude = json['longitude'];
    id = json['id'];
  }
  String? latitude;
  String? longitude;
  String? id;

  Map<String, dynamic> toJson() {
    final map = <String, dynamic>{};
    map['latitude'] = latitude;
    map['longitude'] = longitude;

    return map;
  }

}