import 'dart:convert';

FormLocation formLocationFromJson(String str) => FormLocation.fromJson(json.decode(str));
String formLocationToJson(FormLocation data) => json.encode(data.toJson());

class FormLocation {
  FormLocation({
      this.parentNid, 
      this.q,});

  FormLocation.fromJson(dynamic json) {
    parentNid = json['parent_nid'];
    q = json['q'];
  }
  String? parentNid;
  String? q;

  Map<String, dynamic> toJson() {
    final map = <String, dynamic>{};
    map['parent_nid'] = parentNid;
    map['q'] = q;
    return map;
  }

}