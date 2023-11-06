import 'dart:convert';

import 'package:kreki119/generated/json/base/json_field.dart';
import 'package:kreki119/generated/json/pagination_entity.g.dart';

@JsonSerializable()
class PaginationEntity {

	@JSONField(name: "page_size")
	int? pageSize;
	@JSONField(name: "page_number")
	int? pageNumber;
	int? skip;
	@JSONField(name: "total_items")
	int? totalItems;
	@JSONField(name: "total_pages")
	int? totalPages;
  
  PaginationEntity();

  factory PaginationEntity.fromJson(Map<String, dynamic> json) => $PaginationEntityFromJson(json);

  Map<String, dynamic> toJson() => $PaginationEntityToJson(this);

  @override
  String toString() {
    return jsonEncode(this);
  }
}