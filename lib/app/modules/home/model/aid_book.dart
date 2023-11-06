class AidBook {
  AidBook({
      this.id, 
      this.name, 
      this.data, 
      this.type, 
      this.icon,});

  AidBook.fromJson(dynamic json) {
    id = json['id'];
    name = json['name'];
    data = json['data'];
    type = json['type'];
    icon = json['icon'];
  }
  String? id;
  String? name;
  String? data;
  String? type;
  String? icon;

  Map<String, dynamic> toJson() {
    final map = <String, dynamic>{};
    map['id'] = id;
    map['name'] = name;
    map['data'] = data;
    map['type'] = type;
    map['icon'] = icon;

    return map;
  }

}