import 'package:flutter/material.dart';
import 'package:get/get.dart';
import 'package:kreki119/app/core/base/base_controller.dart';
import 'package:kreki119/app/data/services/weather/util_weather.dart';
import 'package:nb_utils/nb_utils.dart';

class WeatherController extends BaseController {


  final searchController = TextEditingController();

  final _cityLoc = RxList<String>();
  List<String> get cityLocation => _cityLoc.toList();

  @override
  void onInit() {
    super.onInit();

    _cityLoc(UtilWeather.allWeatherLocation());
  }

  @override
  void onReady() {
    super.onReady();
  }

  @override
  void onClose() {
    super.onClose();
  }

  onSearchCity(String text) async{

    if(text.isEmpty) return;

    var data = await UtilWeather.getWeatherByCity(searchController.text);

    _cityLoc(UtilWeather.allWeatherLocation());

  }

  onClickCity(){
    //TODO
  }

}
