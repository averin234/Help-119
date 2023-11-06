import 'package:kreki119/app/data/model/response/city_entity.dart';
import 'package:kreki119/app/data/model/response/province_entity.dart';


abstract class LocationRepository{

  Future<List<ProvinceEntity>> getProvinces({String? search});
  Future<ProvinceEntity> getProvince(String id);
  Future<List<CityEntity>> getCities(String parentNid, {String? search});
  Future<CityEntity> getCity(String provinceId, String id);
}