import 'package:kreki119/generated/json/base/json_convert_content.dart';
import 'package:kreki119/app/data/model/response/pagination_entity.dart';

PaginationEntity $PaginationEntityFromJson(Map<String, dynamic> json) {
	final PaginationEntity paginationEntity = PaginationEntity();
	final int? pageSize = jsonConvert.convert<int>(json['page_size']);
	if (pageSize != null) {
		paginationEntity.pageSize = pageSize;
	}
	final int? pageNumber = jsonConvert.convert<int>(json['page_number']);
	if (pageNumber != null) {
		paginationEntity.pageNumber = pageNumber;
	}
	final int? skip = jsonConvert.convert<int>(json['skip']);
	if (skip != null) {
		paginationEntity.skip = skip;
	}
	final int? totalItems = jsonConvert.convert<int>(json['total_items']);
	if (totalItems != null) {
		paginationEntity.totalItems = totalItems;
	}
	final int? totalPages = jsonConvert.convert<int>(json['total_pages']);
	if (totalPages != null) {
		paginationEntity.totalPages = totalPages;
	}
	return paginationEntity;
}

Map<String, dynamic> $PaginationEntityToJson(PaginationEntity entity) {
	final Map<String, dynamic> data = <String, dynamic>{};
	data['page_size'] = entity.pageSize;
	data['page_number'] = entity.pageNumber;
	data['skip'] = entity.skip;
	data['total_items'] = entity.totalItems;
	data['total_pages'] = entity.totalPages;
	return data;
}