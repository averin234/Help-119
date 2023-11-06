import 'dart:convert';

import 'package:kreki119/generated/json/base/json_field.dart';
import 'package:kreki119/generated/json/weather_entity.g.dart';

@JsonSerializable()
class WeatherEntity {

	WeatherData? data;
  
  WeatherEntity();

  factory WeatherEntity.fromJson(Map<String, dynamic> json) => $WeatherEntityFromJson(json);

  Map<String, dynamic> toJson() => $WeatherEntityToJson(this);

  @override
  String toString() {
    return jsonEncode(this);
  }
}

@JsonSerializable()
class WeatherData {

	@JSONField(name: "source")
	String? xSource;
	String? productioncenter;
	WeatherDataForecast? forecast;
  
  WeatherData();

  factory WeatherData.fromJson(Map<String, dynamic> json) => $WeatherDataFromJson(json);

  Map<String, dynamic> toJson() => $WeatherDataToJson(this);

  @override
  String toString() {
    return jsonEncode(this);
  }
}

@JsonSerializable()
class WeatherDataForecast {

	String? domain;
	WeatherDataForecastIssue? issue;
	List<WeatherDataForecastArea>? area;
  
  WeatherDataForecast();

  factory WeatherDataForecast.fromJson(Map<String, dynamic> json) => $WeatherDataForecastFromJson(json);

  Map<String, dynamic> toJson() => $WeatherDataForecastToJson(this);

  @override
  String toString() {
    return jsonEncode(this);
  }
}

@JsonSerializable()
class WeatherDataForecastIssue {

	WeatherDataForecastIssueTimestamp? timestamp;
	WeatherDataForecastIssueYear? year;
	WeatherDataForecastIssueMonth? month;
	WeatherDataForecastIssueDay? day;
	WeatherDataForecastIssueHour? hour;
	WeatherDataForecastIssueMinute? minute;
	WeatherDataForecastIssueSecond? second;
  
  WeatherDataForecastIssue();

  factory WeatherDataForecastIssue.fromJson(Map<String, dynamic> json) => $WeatherDataForecastIssueFromJson(json);

  Map<String, dynamic> toJson() => $WeatherDataForecastIssueToJson(this);

  @override
  String toString() {
    return jsonEncode(this);
  }
}

@JsonSerializable()
class WeatherDataForecastIssueTimestamp {

	// String? $t;
  
  WeatherDataForecastIssueTimestamp();

  factory WeatherDataForecastIssueTimestamp.fromJson(Map<String, dynamic> json) => $WeatherDataForecastIssueTimestampFromJson(json);

  Map<String, dynamic> toJson() => $WeatherDataForecastIssueTimestampToJson(this);

  @override
  String toString() {
    return jsonEncode(this);
  }
}

@JsonSerializable()
class WeatherDataForecastIssueYear {

	// String? $t;
  
  WeatherDataForecastIssueYear();

  factory WeatherDataForecastIssueYear.fromJson(Map<String, dynamic> json) => $WeatherDataForecastIssueYearFromJson(json);

  Map<String, dynamic> toJson() => $WeatherDataForecastIssueYearToJson(this);

  @override
  String toString() {
    return jsonEncode(this);
  }
}

@JsonSerializable()
class WeatherDataForecastIssueMonth {

	// String? $t;
  
  WeatherDataForecastIssueMonth();

  factory WeatherDataForecastIssueMonth.fromJson(Map<String, dynamic> json) => $WeatherDataForecastIssueMonthFromJson(json);

  Map<String, dynamic> toJson() => $WeatherDataForecastIssueMonthToJson(this);

  @override
  String toString() {
    return jsonEncode(this);
  }
}

@JsonSerializable()
class WeatherDataForecastIssueDay {

	// String? $t;
  
  WeatherDataForecastIssueDay();

  factory WeatherDataForecastIssueDay.fromJson(Map<String, dynamic> json) => $WeatherDataForecastIssueDayFromJson(json);

  Map<String, dynamic> toJson() => $WeatherDataForecastIssueDayToJson(this);

  @override
  String toString() {
    return jsonEncode(this);
  }
}

@JsonSerializable()
class WeatherDataForecastIssueHour {

	// String? $t;
  
  WeatherDataForecastIssueHour();

  factory WeatherDataForecastIssueHour.fromJson(Map<String, dynamic> json) => $WeatherDataForecastIssueHourFromJson(json);

  Map<String, dynamic> toJson() => $WeatherDataForecastIssueHourToJson(this);

  @override
  String toString() {
    return jsonEncode(this);
  }
}

@JsonSerializable()
class WeatherDataForecastIssueMinute {

	// String? $t;
  
  WeatherDataForecastIssueMinute();

  factory WeatherDataForecastIssueMinute.fromJson(Map<String, dynamic> json) => $WeatherDataForecastIssueMinuteFromJson(json);

  Map<String, dynamic> toJson() => $WeatherDataForecastIssueMinuteToJson(this);

  @override
  String toString() {
    return jsonEncode(this);
  }
}

@JsonSerializable()
class WeatherDataForecastIssueSecond {

	// String? $t;
  
  WeatherDataForecastIssueSecond();

  factory WeatherDataForecastIssueSecond.fromJson(Map<String, dynamic> json) => $WeatherDataForecastIssueSecondFromJson(json);

  Map<String, dynamic> toJson() => $WeatherDataForecastIssueSecondToJson(this);

  @override
  String toString() {
    return jsonEncode(this);
  }
}

@JsonSerializable()
class WeatherDataForecastArea {

	String? id;
	String? latitude;
	String? longitude;
	String? coordinate;
	String? type;
	String? region;
	String? level;
	String? description;
	String? domain;
	String? tags;
	List<WeatherDataForecastAreaName>? name;
	List<WeatherDataForecastAreaParameter>? parameter;
  
  WeatherDataForecastArea();

  factory WeatherDataForecastArea.fromJson(Map<String, dynamic> json) => $WeatherDataForecastAreaFromJson(json);

  Map<String, dynamic> toJson() => $WeatherDataForecastAreaToJson(this);

  @override
  String toString() {
    return jsonEncode(this);
  }
}

@JsonSerializable()
class WeatherDataForecastAreaName {

  @JSONField(name: "xml:lang")
	String? xmlLang;
	// String? $t;
  
  WeatherDataForecastAreaName();

  factory WeatherDataForecastAreaName.fromJson(Map<String, dynamic> json) => $WeatherDataForecastAreaNameFromJson(json);

  Map<String, dynamic> toJson() => $WeatherDataForecastAreaNameToJson(this);

  @override
  String toString() {
    return jsonEncode(this);
  }
}

@JsonSerializable()
class WeatherDataForecastAreaParameter {

	String? id;
	String? description;
	String? type;
	List<WeatherDataForecastAreaParameterTimerange>? timerange;
  
  WeatherDataForecastAreaParameter();

  factory WeatherDataForecastAreaParameter.fromJson(Map<String, dynamic> json) => $WeatherDataForecastAreaParameterFromJson(json);

  Map<String, dynamic> toJson() => $WeatherDataForecastAreaParameterToJson(this);

  @override
  String toString() {
    return jsonEncode(this);
  }
}

@JsonSerializable()
class WeatherDataForecastAreaParameterTimerange {

	String? type;
	String? h;
	String? datetime;
	WeatherDataForecastAreaParameterTimerangeValue? value;
  
  WeatherDataForecastAreaParameterTimerange();

  factory WeatherDataForecastAreaParameterTimerange.fromJson(Map<String, dynamic> json) => $WeatherDataForecastAreaParameterTimerangeFromJson(json);

  Map<String, dynamic> toJson() => $WeatherDataForecastAreaParameterTimerangeToJson(this);

  @override
  String toString() {
    return jsonEncode(this);
  }
}

@JsonSerializable()
class WeatherDataForecastAreaParameterTimerangeValue {

	String? unit;
	// String? $t;
  
  WeatherDataForecastAreaParameterTimerangeValue();

  factory WeatherDataForecastAreaParameterTimerangeValue.fromJson(Map<String, dynamic> json) => $WeatherDataForecastAreaParameterTimerangeValueFromJson(json);

  Map<String, dynamic> toJson() => $WeatherDataForecastAreaParameterTimerangeValueToJson(this);

  @override
  String toString() {
    return jsonEncode(this);
  }
}