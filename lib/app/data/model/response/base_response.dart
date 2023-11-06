

import 'package:kreki119/app/data/model/response/error_entity.dart';
import 'package:kreki119/app/data/model/response/pagination_entity.dart';
import 'package:kreki119/generated/json/base/json_convert_content.dart';

import '../../../../generated/json/pagination_entity.g.dart';

class BaseResponse<T>{
  BaseResponse({
      this.data,
    this.pagination,
    this.code
  });

  BaseResponse.fromJson(dynamic json) {
    data = json['data']!=null ? JsonConvert.fromJsonAsT<T>(json['data']) : null;
    pagination = json['pagination'] != null? JsonConvert.fromJsonAsT<PaginationEntity>(json['pagination']) : null;
    code = json['code'];
    statusCode = json['statusCode'];
    message = json['message'];
    error = json['error'];
  }

  T? data;
  PaginationEntity? pagination;
  int? code;
  int? statusCode;
  String? message;
  String? error;


  Map<String, dynamic> toJson() {
    final map = <String, dynamic>{};
    map['data'] = data;
    map['pagination'] =  pagination != null ? $PaginationEntityToJson(pagination!) : null;
    map['code'] = code;
    map['statusCode'] = statusCode;
    map['message'] = message;
    map['error'] = error;

    return map;
  }

}