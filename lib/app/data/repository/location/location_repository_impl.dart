import 'package:kreki119/app/data/model/response/city_entity.dart';
import 'package:kreki119/app/data/model/response/province_entity.dart';

import '../../local/local_data_helper.dart';
import 'location_repository.dart';

class LocationRepositoryImpl extends LocationRepository{

  static List<ProvinceEntity> provinces = [];
  static String provinceId = '';
  static List<CityEntity> cities = [];

  @override
  Future<List<CityEntity>> getCities(String parentNid, {String? search}) async{
    if(cities.isEmpty){
      var data = await LocalDataHelper.readJson<List>('city.json');
      var dataList = data.map((e)=> CityEntity.fromJson(e)).toList();
      cities = dataList.where((element) => element.provinceId == parentNid).toList();

      return cities;
    }

    if(provinceId == parentNid){
      return cities;
    } else {
      var data = await LocalDataHelper.readJson<List>('city.json');
      var dataList = data.map((e)=> CityEntity.fromJson(e)).toList();
      cities = dataList.where((element) => element.provinceId == parentNid).toList();
    }

    return cities;
  }


  @override
  Future<List<ProvinceEntity>> getProvinces({String? search}) async{
    if(provinces.isNotEmpty){
      return provinces;
    }

    var data = await LocalDataHelper.readJson<List>('province.json');
    provinces = data.map((e) => ProvinceEntity.fromJson(e)).toList();

    return provinces;
  }

  @override
  Future<CityEntity> getCity(String provinceId, String id) async{
    if(cities.isEmpty){
      await getCities(provinceId);
    }

    return cities.firstWhere((element) => element.id == id);
  }

  @override
  Future<ProvinceEntity> getProvince(String id) async{
    if(provinces.isEmpty){
      await getProvinces();
    }

    return provinces.firstWhere((element) => element.id == id);
  }

}