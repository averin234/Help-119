import 'package:kreki119/app/core/values/app_values.dart';

class FormSearch {
  FormSearch({
      this.filterBy, 
      this.value, 
      this.limit, 
      this.page,});

  FormSearch.fromJson(dynamic json) {
    filterBy = json['filterBy'];
    value = json['value'];
    limit = json['limit'];
    page = json['page'];
  }
  String? filterBy;
  String? value;
  int? limit;
  int? page;

  Map<String, dynamic> toJson() {
    final map = <String, dynamic>{};
    map['filterBy'] = filterBy;
    map['value'] = value;
    map['limit'] = limit ?? AppValues.defaultPageSize;
    map['page'] = page ?? AppValues.defaultPageNumber;

    return map;
  }

}