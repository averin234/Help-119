import 'package:kreki119/app/core/utils/date_util.dart';
import 'package:kreki119/flavors/build_config.dart';
import 'package:logger/logger.dart';
import 'package:nb_utils/nb_utils.dart';
import 'package:weather/weather.dart';

import '../../local/preference/preference_manager.dart';

class UtilWeather{

  static Logger logger = BuildConfig.instance.config.logger;
  static String baseImageWeatherUrl(String icon) => 'http://openweathermap.org/img/wn/$icon@4x.png';

  static Map<String, dynamic> baseEmptyWeather(){
    return
      {
        "coord": {
          "lon": 0.0,
          "lat": 0.0
        },
        "weather": [
          {
            "id": 501,
            "main": "Memuat",
            "description": "muat cuaca",
            "icon": "10d"
          }
        ],
        "base": "",
        "main": {
          "temp": 298.48,
          "feels_like": 298.74,
          "temp_min": 297.56,
          "temp_max": 300.05,
          "pressure": 1015,
          "humidity": 64,
          "sea_level": 1015,
          "grnd_level": 933
        },
        "visibility": 10000,
        "wind": {
          "speed": 0.0,
          "deg": 0.0,
          "gust": 0.0
        },
        "rain": {
          "1h": 0.0
        },
        "clouds": {
          "all": 0
        },
        "dt": 1661870592,
        "sys": {
          "type": 2,
          "id": 2075663,
          "country": "IT",
          "sunrise": 1661834187,
          "sunset": 1661882248
        },
        "timezone": 7200,
        "id": 3163858,
        "name": "",
        "cod": 200
      };
  }

  static Future<void> loadWeather(double lat, double lng) async{
    WeatherFactory weatherFactory = WeatherFactory(BuildConfig.instance.config.weatherApi, language: Language.INDONESIAN);
    var weather = await weatherFactory.currentWeatherByLocation(lat, lng);
    setWeatherLocation(weather.areaName);
    setValue(PreferenceManager.keyWeather, weather.toJson());
  }

  static Future<Weather> getWeather() async{
    var weatherData = getJSONAsync(PreferenceManager.keyWeather, defaultValue: baseEmptyWeather());

    return Weather(weatherData);
  }

  static Future<Weather> onLoadWeather(double lat, double lng) async{
    var weatherData = getJSONAsync(PreferenceManager.keyWeather,defaultValue: baseEmptyWeather());
    WeatherFactory weatherFactory = WeatherFactory(BuildConfig.instance.config.weatherApi, language: Language.INDONESIAN);
    var weather = Weather(weatherData);

    if(weatherData.isEmpty){
      weather = await weatherFactory.currentWeatherByLocation(lat, lng);
      logger.d('weather load');
      setValue(PreferenceManager.keyWeather, weather.toJson());
    } else {
      if(weather.weatherMain == null){
        Weather weather = await weatherFactory.currentWeatherByLocation(lat, lng);
        logger.d('weather load - main null');

        setWeatherLocation(weather.areaName);
        setValue(PreferenceManager.keyWeather, weather.toJson());
      }

      if(weather.date!=null){
        if(weather.date!.isAfterTomorrow()){
          weather = await weatherFactory.currentWeatherByLocation(lat, lng);
          logger.d('weather load');
          setValue(PreferenceManager.keyWeather, weather.toJson());
        }
      }

    }

    logger.d('aap, weatherData \nSaved: ${Weather(weatherData).toString()} \nCouldBeNew: ${weather.toString()}');

    return Weather(getJSONAsync(PreferenceManager.keyWeather));
  }

  static Future<Weather?> getWeatherByCity(String cityName)async{
    WeatherFactory weatherFactory = WeatherFactory(BuildConfig.instance.config.weatherApi);
    await weatherFactory.currentWeatherByCityName(cityName)
        .catchError((error){
          if(error is OpenWeatherAPIException){
            toast(error.toString());
          } else {
            toast(error);
          }
    }).then((val) {
      if(val.date == null){
        logger.d('aap, weatherDataNull: $val');

        return null;
      } else {
        setWeatherLocation(cityName);
        setValue(PreferenceManager.keyWeather, val.toJson());

        return val;
      }
    });

    return null;
  }

  static List<String> allWeatherLocation(){
    var dataList = List<String>.empty(growable: true);
    dataList = getStringListAsync(PreferenceManager.keyWeatherLocation,) ?? [];

    return dataList;
  }

  static void setWeatherLocation(String? loc){
    if(loc==null) return;

    if(!allWeatherLocation().contains(loc)){
      var value = allWeatherLocation();
      value.add(loc);
      setValue(PreferenceManager.keyWeatherLocation, value);
    }
  }

  static String getWeatherCity(){
    String data = '';

    return data;
  }


  //this is link from bmkg data
  //https://data.bmkg.go.id/prakiraan-cuaca/
  static List<String> urlBMKGWeatherLinks = [
    'https://data.bmkg.go.id/DataMKG/MEWS/DigitalForecast/DigitalForecast-Aceh.xml',
    'https://data.bmkg.go.id/DataMKG/MEWS/DigitalForecast/DigitalForecast-Bali.xml',
    'https://data.bmkg.go.id/DataMKG/MEWS/DigitalForecast/DigitalForecast-BangkaBelitung.xml',
    'https://data.bmkg.go.id/DataMKG/MEWS/DigitalForecast/DigitalForecast-Banten.xml',
    'https://data.bmkg.go.id/DataMKG/MEWS/DigitalForecast/DigitalForecast-Bengkulu.xml',
    'https://data.bmkg.go.id/DataMKG/MEWS/DigitalForecast/DigitalForecast-DIYogyakarta.xml',
    'https://data.bmkg.go.id/DataMKG/MEWS/DigitalForecast/DigitalForecast-DKIJakarta.xml',
    'https://data.bmkg.go.id/DataMKG/MEWS/DigitalForecast/DigitalForecast-Gorontalo.xml',
    'https://data.bmkg.go.id/DataMKG/MEWS/DigitalForecast/DigitalForecast-Jambi.xml',
    'https://data.bmkg.go.id/DataMKG/MEWS/DigitalForecast/DigitalForecast-JawaBarat.xml',
    'https://data.bmkg.go.id/DataMKG/MEWS/DigitalForecast/DigitalForecast-JawaTengah.xml',
    'https://data.bmkg.go.id/DataMKG/MEWS/DigitalForecast/DigitalForecast-JawaTimur.xml',
    'https://data.bmkg.go.id/DataMKG/MEWS/DigitalForecast/DigitalForecast-KalimantanBarat.xml',
    'https://data.bmkg.go.id/DataMKG/MEWS/DigitalForecast/DigitalForecast-KalimantanSelatan.xml',
    'https://data.bmkg.go.id/DataMKG/MEWS/DigitalForecast/DigitalForecast-KalimantanTengah.xml',
    'https://data.bmkg.go.id/DataMKG/MEWS/DigitalForecast/DigitalForecast-KalimantanTimur.xml',
    'https://data.bmkg.go.id/DataMKG/MEWS/DigitalForecast/DigitalForecast-KalimantanUtara.xml',
    'https://data.bmkg.go.id/DataMKG/MEWS/DigitalForecast/DigitalForecast-KepulauanRiau.xml',
    'https://data.bmkg.go.id/DataMKG/MEWS/DigitalForecast/DigitalForecast-Lampung.xml',
    'https://data.bmkg.go.id/DataMKG/MEWS/DigitalForecast/DigitalForecast-Maluku.xml',
    'https://data.bmkg.go.id/DataMKG/MEWS/DigitalForecast/DigitalForecast-MalukuUtara.xml',
    'https://data.bmkg.go.id/DataMKG/MEWS/DigitalForecast/DigitalForecast-NusaTenggaraBarat.xml',
    'https://data.bmkg.go.id/DataMKG/MEWS/DigitalForecast/DigitalForecast-NusaTenggaraTimur.xml',
    'https://data.bmkg.go.id/DataMKG/MEWS/DigitalForecast/DigitalForecast-Papua.xml',
    'https://data.bmkg.go.id/DataMKG/MEWS/DigitalForecast/DigitalForecast-PapuaBarat.xml',
    'https://data.bmkg.go.id/DataMKG/MEWS/DigitalForecast/DigitalForecast-Riau.xml',
    'https://data.bmkg.go.id/DataMKG/MEWS/DigitalForecast/DigitalForecast-SulawesiBarat.xml',
    'https://data.bmkg.go.id/DataMKG/MEWS/DigitalForecast/DigitalForecast-SulawesiSelatan.xml',
    'https://data.bmkg.go.id/DataMKG/MEWS/DigitalForecast/DigitalForecast-SulawesiTengah.xml',
    'https://data.bmkg.go.id/DataMKG/MEWS/DigitalForecast/DigitalForecast-SulawesiTenggara.xml',
    'https://data.bmkg.go.id/DataMKG/MEWS/DigitalForecast/DigitalForecast-SulawesiUtara.xml',
    'https://data.bmkg.go.id/DataMKG/MEWS/DigitalForecast/DigitalForecast-SumateraBarat.xml',
    'https://data.bmkg.go.id/DataMKG/MEWS/DigitalForecast/DigitalForecast-SumateraSelatan.xml',
    'https://data.bmkg.go.id/DataMKG/MEWS/DigitalForecast/DigitalForecast-SumateraUtara.xml',
  ];

  static String weatherCodeTitle(int code){
    var data = '';
    var codeWeather = WeatherCode.values.firstWhere((element) => element.code() == code, orElse:()=> WeatherCode.CLEAR_SKIES);
    data = codeWeather.data();

    return data;
  }

  static String weatherLink(String place){
    String defaultLink = 'https://data.bmkg.go.id/DataMKG/MEWS/DigitalForecast/DigitalForecast-DKIJakarta.xml';

    var splitPlace = place.split(' ');
    var trimPlace = place.replaceAll(' ', '');
    bool hasData = false;

    for(var item in UtilWeather.urlBMKGWeatherLinks){
      if(item.contains(trimPlace)){
        logger.d('gotTrimmed: $item');
        defaultLink = item;
        hasData = true;
        break;
      }
    }

    if(!hasData){
      for(var place in splitPlace){
        for(var item in UtilWeather.urlBMKGWeatherLinks){
          if(item.contains(place)){
            logger.d('gotSplitted: $item');
            defaultLink = item;
            hasData = true;
            break;
          }
        }
      }
    }


    return defaultLink;
  }

}

enum WeatherCode {
  CLEAR_SKIES,
  PARTLY_CLOUDY,
  PARTLY_CLOUDY_2,
  MOSTLY_CLOUDY,
  OVERCAST,
  HAZE,
  SMOKE,
  FOG,
  LIGHT_RAIN,
  RAIN,
  HEAVY_RAIN,
  ISOLATED_SHOWER,
  SEVERE_THUNDERSTORM,
  SEVERE_THUNDERSTORM_2,
}

extension WeatherCodeExt on WeatherCode{
  int code(){
    switch(this){
      case WeatherCode.CLEAR_SKIES:
        return 0;
      case WeatherCode.PARTLY_CLOUDY:
        return 1;
      case WeatherCode.PARTLY_CLOUDY_2:
        return 2;
      case WeatherCode.MOSTLY_CLOUDY:
        return 3;
      case WeatherCode.OVERCAST:
        return 4;
      case WeatherCode.HAZE:
        return 5;
      case WeatherCode.SMOKE:
        return 10;
      case WeatherCode.FOG:
        return 45;
      case WeatherCode.LIGHT_RAIN:
        return 60;
      case WeatherCode.RAIN:
        return 61;
      case WeatherCode.HEAVY_RAIN:
        return 63;
      case WeatherCode.ISOLATED_SHOWER:
        return 80;
      case WeatherCode.SEVERE_THUNDERSTORM:
        return 95;
      case WeatherCode.SEVERE_THUNDERSTORM_2:
        return 97;
    }
  }

  String data(){
    switch (this){
      case WeatherCode.CLEAR_SKIES:
        return 'Cerah';
      case WeatherCode.PARTLY_CLOUDY:
        return 'Cerah Berawan';
      case WeatherCode.PARTLY_CLOUDY_2:
        return 'Cerah Berawan';
      case WeatherCode.MOSTLY_CLOUDY:
        return 'Berawan';
      case WeatherCode.OVERCAST:
        return 'Berawan Tebal';
      case WeatherCode.HAZE:
        return 'Udara Kabur';
      case WeatherCode.SMOKE:
        return 'Asap';
      case WeatherCode.FOG:
        return 'Kabut';
      case WeatherCode.LIGHT_RAIN:
        return 'Hujan Ringan';
      case WeatherCode.RAIN:
        return 'Hujan Sedang';
      case WeatherCode.HEAVY_RAIN:
        return 'Hujan Lebat';
      case WeatherCode.ISOLATED_SHOWER:
        return 'Hujan Lokal';
      case WeatherCode.SEVERE_THUNDERSTORM:
        return 'Hujan Petir';
      case WeatherCode.SEVERE_THUNDERSTORM_2:
        return 'Hujan Petir';
    }
  }
}