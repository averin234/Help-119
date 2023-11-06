import 'dart:convert';

FormLocationPlace formLocationFromJson(String str) => FormLocationPlace.fromJson(json.decode(str));
String formLocationToJson(FormLocationPlace data) => json.encode(data.toJson());

class FormLocationPlace {
  FormLocationPlace({
      this.latitude, 
      this.longitude,});

  FormLocationPlace.fromJson(dynamic json) {
    latitude = json['latitude'];
    longitude = json['longitude'];
  }
  num? latitude;
  num? longitude;

  Map<String, dynamic> toJson() {
    final map = <String, dynamic>{};
    map['latitude'] = latitude;
    map['longitude'] = longitude;

    return map;
  }

}