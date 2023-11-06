class FormEmergencies {
  FormEmergencies({
      this.filterBy, 
      this.value,});

  FormEmergencies.fromJson(dynamic json) {
    filterBy = json['filterBy'];
    value = json['value'];
  }
  String? filterBy;
  String? value;

  Map<String, dynamic> toJson() {
    final map = <String, dynamic>{};
    map['filterBy'] = filterBy;
    map['value'] = value;

    return map;
  }

}