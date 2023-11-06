import 'package:kreki119/generated/json/base/json_convert_content.dart';
import 'package:kreki119/app/data/model/response/weather_entity.dart';

WeatherEntity $WeatherEntityFromJson(Map<String, dynamic> json) {
	final WeatherEntity weatherEntity = WeatherEntity();
	final WeatherData? data = jsonConvert.convert<WeatherData>(json['data']);
	if (data != null) {
		weatherEntity.data = data;
	}
	return weatherEntity;
}

Map<String, dynamic> $WeatherEntityToJson(WeatherEntity entity) {
	final Map<String, dynamic> data = <String, dynamic>{};
	data['data'] = entity.data?.toJson();
	return data;
}

WeatherData $WeatherDataFromJson(Map<String, dynamic> json) {
	final WeatherData weatherData = WeatherData();
	final String? xSource = jsonConvert.convert<String>(json['source']);
	if (xSource != null) {
		weatherData.xSource = xSource;
	}
	final String? productioncenter = jsonConvert.convert<String>(json['productioncenter']);
	if (productioncenter != null) {
		weatherData.productioncenter = productioncenter;
	}
	final WeatherDataForecast? forecast = jsonConvert.convert<WeatherDataForecast>(json['forecast']);
	if (forecast != null) {
		weatherData.forecast = forecast;
	}
	return weatherData;
}

Map<String, dynamic> $WeatherDataToJson(WeatherData entity) {
	final Map<String, dynamic> data = <String, dynamic>{};
	data['source'] = entity.xSource;
	data['productioncenter'] = entity.productioncenter;
	data['forecast'] = entity.forecast?.toJson();
	return data;
}

WeatherDataForecast $WeatherDataForecastFromJson(Map<String, dynamic> json) {
	final WeatherDataForecast weatherDataForecast = WeatherDataForecast();
	final String? domain = jsonConvert.convert<String>(json['domain']);
	if (domain != null) {
		weatherDataForecast.domain = domain;
	}
	final WeatherDataForecastIssue? issue = jsonConvert.convert<WeatherDataForecastIssue>(json['issue']);
	if (issue != null) {
		weatherDataForecast.issue = issue;
	}
	final List<WeatherDataForecastArea>? area = jsonConvert.convertListNotNull<WeatherDataForecastArea>(json['area']);
	if (area != null) {
		weatherDataForecast.area = area;
	}
	return weatherDataForecast;
}

Map<String, dynamic> $WeatherDataForecastToJson(WeatherDataForecast entity) {
	final Map<String, dynamic> data = <String, dynamic>{};
	data['domain'] = entity.domain;
	data['issue'] = entity.issue?.toJson();
	data['area'] =  entity.area?.map((v) => v.toJson()).toList();
	return data;
}

WeatherDataForecastIssue $WeatherDataForecastIssueFromJson(Map<String, dynamic> json) {
	final WeatherDataForecastIssue weatherDataForecastIssue = WeatherDataForecastIssue();
	final WeatherDataForecastIssueTimestamp? timestamp = jsonConvert.convert<WeatherDataForecastIssueTimestamp>(json['timestamp']);
	if (timestamp != null) {
		weatherDataForecastIssue.timestamp = timestamp;
	}
	final WeatherDataForecastIssueYear? year = jsonConvert.convert<WeatherDataForecastIssueYear>(json['year']);
	if (year != null) {
		weatherDataForecastIssue.year = year;
	}
	final WeatherDataForecastIssueMonth? month = jsonConvert.convert<WeatherDataForecastIssueMonth>(json['month']);
	if (month != null) {
		weatherDataForecastIssue.month = month;
	}
	final WeatherDataForecastIssueDay? day = jsonConvert.convert<WeatherDataForecastIssueDay>(json['day']);
	if (day != null) {
		weatherDataForecastIssue.day = day;
	}
	final WeatherDataForecastIssueHour? hour = jsonConvert.convert<WeatherDataForecastIssueHour>(json['hour']);
	if (hour != null) {
		weatherDataForecastIssue.hour = hour;
	}
	final WeatherDataForecastIssueMinute? minute = jsonConvert.convert<WeatherDataForecastIssueMinute>(json['minute']);
	if (minute != null) {
		weatherDataForecastIssue.minute = minute;
	}
	final WeatherDataForecastIssueSecond? second = jsonConvert.convert<WeatherDataForecastIssueSecond>(json['second']);
	if (second != null) {
		weatherDataForecastIssue.second = second;
	}
	return weatherDataForecastIssue;
}

Map<String, dynamic> $WeatherDataForecastIssueToJson(WeatherDataForecastIssue entity) {
	final Map<String, dynamic> data = <String, dynamic>{};
	data['timestamp'] = entity.timestamp?.toJson();
	data['year'] = entity.year?.toJson();
	data['month'] = entity.month?.toJson();
	data['day'] = entity.day?.toJson();
	data['hour'] = entity.hour?.toJson();
	data['minute'] = entity.minute?.toJson();
	data['second'] = entity.second?.toJson();
	return data;
}

WeatherDataForecastIssueTimestamp $WeatherDataForecastIssueTimestampFromJson(Map<String, dynamic> json) {
	final WeatherDataForecastIssueTimestamp weatherDataForecastIssueTimestamp = WeatherDataForecastIssueTimestamp();
	return weatherDataForecastIssueTimestamp;
}

Map<String, dynamic> $WeatherDataForecastIssueTimestampToJson(WeatherDataForecastIssueTimestamp entity) {
	final Map<String, dynamic> data = <String, dynamic>{};
	return data;
}

WeatherDataForecastIssueYear $WeatherDataForecastIssueYearFromJson(Map<String, dynamic> json) {
	final WeatherDataForecastIssueYear weatherDataForecastIssueYear = WeatherDataForecastIssueYear();
	return weatherDataForecastIssueYear;
}

Map<String, dynamic> $WeatherDataForecastIssueYearToJson(WeatherDataForecastIssueYear entity) {
	final Map<String, dynamic> data = <String, dynamic>{};
	return data;
}

WeatherDataForecastIssueMonth $WeatherDataForecastIssueMonthFromJson(Map<String, dynamic> json) {
	final WeatherDataForecastIssueMonth weatherDataForecastIssueMonth = WeatherDataForecastIssueMonth();
	return weatherDataForecastIssueMonth;
}

Map<String, dynamic> $WeatherDataForecastIssueMonthToJson(WeatherDataForecastIssueMonth entity) {
	final Map<String, dynamic> data = <String, dynamic>{};
	return data;
}

WeatherDataForecastIssueDay $WeatherDataForecastIssueDayFromJson(Map<String, dynamic> json) {
	final WeatherDataForecastIssueDay weatherDataForecastIssueDay = WeatherDataForecastIssueDay();
	return weatherDataForecastIssueDay;
}

Map<String, dynamic> $WeatherDataForecastIssueDayToJson(WeatherDataForecastIssueDay entity) {
	final Map<String, dynamic> data = <String, dynamic>{};
	return data;
}

WeatherDataForecastIssueHour $WeatherDataForecastIssueHourFromJson(Map<String, dynamic> json) {
	final WeatherDataForecastIssueHour weatherDataForecastIssueHour = WeatherDataForecastIssueHour();
	return weatherDataForecastIssueHour;
}

Map<String, dynamic> $WeatherDataForecastIssueHourToJson(WeatherDataForecastIssueHour entity) {
	final Map<String, dynamic> data = <String, dynamic>{};
	return data;
}

WeatherDataForecastIssueMinute $WeatherDataForecastIssueMinuteFromJson(Map<String, dynamic> json) {
	final WeatherDataForecastIssueMinute weatherDataForecastIssueMinute = WeatherDataForecastIssueMinute();
	return weatherDataForecastIssueMinute;
}

Map<String, dynamic> $WeatherDataForecastIssueMinuteToJson(WeatherDataForecastIssueMinute entity) {
	final Map<String, dynamic> data = <String, dynamic>{};
	return data;
}

WeatherDataForecastIssueSecond $WeatherDataForecastIssueSecondFromJson(Map<String, dynamic> json) {
	final WeatherDataForecastIssueSecond weatherDataForecastIssueSecond = WeatherDataForecastIssueSecond();
	return weatherDataForecastIssueSecond;
}

Map<String, dynamic> $WeatherDataForecastIssueSecondToJson(WeatherDataForecastIssueSecond entity) {
	final Map<String, dynamic> data = <String, dynamic>{};
	return data;
}

WeatherDataForecastArea $WeatherDataForecastAreaFromJson(Map<String, dynamic> json) {
	final WeatherDataForecastArea weatherDataForecastArea = WeatherDataForecastArea();
	final String? id = jsonConvert.convert<String>(json['id']);
	if (id != null) {
		weatherDataForecastArea.id = id;
	}
	final String? latitude = jsonConvert.convert<String>(json['latitude']);
	if (latitude != null) {
		weatherDataForecastArea.latitude = latitude;
	}
	final String? longitude = jsonConvert.convert<String>(json['longitude']);
	if (longitude != null) {
		weatherDataForecastArea.longitude = longitude;
	}
	final String? coordinate = jsonConvert.convert<String>(json['coordinate']);
	if (coordinate != null) {
		weatherDataForecastArea.coordinate = coordinate;
	}
	final String? type = jsonConvert.convert<String>(json['type']);
	if (type != null) {
		weatherDataForecastArea.type = type;
	}
	final String? region = jsonConvert.convert<String>(json['region']);
	if (region != null) {
		weatherDataForecastArea.region = region;
	}
	final String? level = jsonConvert.convert<String>(json['level']);
	if (level != null) {
		weatherDataForecastArea.level = level;
	}
	final String? description = jsonConvert.convert<String>(json['description']);
	if (description != null) {
		weatherDataForecastArea.description = description;
	}
	final String? domain = jsonConvert.convert<String>(json['domain']);
	if (domain != null) {
		weatherDataForecastArea.domain = domain;
	}
	final String? tags = jsonConvert.convert<String>(json['tags']);
	if (tags != null) {
		weatherDataForecastArea.tags = tags;
	}
	final List<WeatherDataForecastAreaName>? name = jsonConvert.convertListNotNull<WeatherDataForecastAreaName>(json['name']);
	if (name != null) {
		weatherDataForecastArea.name = name;
	}
	final List<WeatherDataForecastAreaParameter>? parameter = jsonConvert.convertListNotNull<WeatherDataForecastAreaParameter>(json['parameter']);
	if (parameter != null) {
		weatherDataForecastArea.parameter = parameter;
	}
	return weatherDataForecastArea;
}

Map<String, dynamic> $WeatherDataForecastAreaToJson(WeatherDataForecastArea entity) {
	final Map<String, dynamic> data = <String, dynamic>{};
	data['id'] = entity.id;
	data['latitude'] = entity.latitude;
	data['longitude'] = entity.longitude;
	data['coordinate'] = entity.coordinate;
	data['type'] = entity.type;
	data['region'] = entity.region;
	data['level'] = entity.level;
	data['description'] = entity.description;
	data['domain'] = entity.domain;
	data['tags'] = entity.tags;
	data['name'] =  entity.name?.map((v) => v.toJson()).toList();
	data['parameter'] =  entity.parameter?.map((v) => v.toJson()).toList();
	return data;
}

WeatherDataForecastAreaName $WeatherDataForecastAreaNameFromJson(Map<String, dynamic> json) {
	final WeatherDataForecastAreaName weatherDataForecastAreaName = WeatherDataForecastAreaName();
	final String? xmlLang = jsonConvert.convert<String>(json['xml:lang']);
	if (xmlLang != null) {
		weatherDataForecastAreaName.xmlLang = xmlLang;
	}
	return weatherDataForecastAreaName;
}

Map<String, dynamic> $WeatherDataForecastAreaNameToJson(WeatherDataForecastAreaName entity) {
	final Map<String, dynamic> data = <String, dynamic>{};
	data['xml:lang'] = entity.xmlLang;
	return data;
}

WeatherDataForecastAreaParameter $WeatherDataForecastAreaParameterFromJson(Map<String, dynamic> json) {
	final WeatherDataForecastAreaParameter weatherDataForecastAreaParameter = WeatherDataForecastAreaParameter();
	final String? id = jsonConvert.convert<String>(json['id']);
	if (id != null) {
		weatherDataForecastAreaParameter.id = id;
	}
	final String? description = jsonConvert.convert<String>(json['description']);
	if (description != null) {
		weatherDataForecastAreaParameter.description = description;
	}
	final String? type = jsonConvert.convert<String>(json['type']);
	if (type != null) {
		weatherDataForecastAreaParameter.type = type;
	}
	final List<WeatherDataForecastAreaParameterTimerange>? timerange = jsonConvert.convertListNotNull<WeatherDataForecastAreaParameterTimerange>(json['timerange']);
	if (timerange != null) {
		weatherDataForecastAreaParameter.timerange = timerange;
	}
	return weatherDataForecastAreaParameter;
}

Map<String, dynamic> $WeatherDataForecastAreaParameterToJson(WeatherDataForecastAreaParameter entity) {
	final Map<String, dynamic> data = <String, dynamic>{};
	data['id'] = entity.id;
	data['description'] = entity.description;
	data['type'] = entity.type;
	data['timerange'] =  entity.timerange?.map((v) => v.toJson()).toList();
	return data;
}

WeatherDataForecastAreaParameterTimerange $WeatherDataForecastAreaParameterTimerangeFromJson(Map<String, dynamic> json) {
	final WeatherDataForecastAreaParameterTimerange weatherDataForecastAreaParameterTimerange = WeatherDataForecastAreaParameterTimerange();
	final String? type = jsonConvert.convert<String>(json['type']);
	if (type != null) {
		weatherDataForecastAreaParameterTimerange.type = type;
	}
	final String? h = jsonConvert.convert<String>(json['h']);
	if (h != null) {
		weatherDataForecastAreaParameterTimerange.h = h;
	}
	final String? datetime = jsonConvert.convert<String>(json['datetime']);
	if (datetime != null) {
		weatherDataForecastAreaParameterTimerange.datetime = datetime;
	}
	final WeatherDataForecastAreaParameterTimerangeValue? value = jsonConvert.convert<WeatherDataForecastAreaParameterTimerangeValue>(json['value']);
	if (value != null) {
		weatherDataForecastAreaParameterTimerange.value = value;
	}
	return weatherDataForecastAreaParameterTimerange;
}

Map<String, dynamic> $WeatherDataForecastAreaParameterTimerangeToJson(WeatherDataForecastAreaParameterTimerange entity) {
	final Map<String, dynamic> data = <String, dynamic>{};
	data['type'] = entity.type;
	data['h'] = entity.h;
	data['datetime'] = entity.datetime;
	data['value'] = entity.value?.toJson();
	return data;
}

WeatherDataForecastAreaParameterTimerangeValue $WeatherDataForecastAreaParameterTimerangeValueFromJson(Map<String, dynamic> json) {
	final WeatherDataForecastAreaParameterTimerangeValue weatherDataForecastAreaParameterTimerangeValue = WeatherDataForecastAreaParameterTimerangeValue();
	final String? unit = jsonConvert.convert<String>(json['unit']);
	if (unit != null) {
		weatherDataForecastAreaParameterTimerangeValue.unit = unit;
	}
	return weatherDataForecastAreaParameterTimerangeValue;
}

Map<String, dynamic> $WeatherDataForecastAreaParameterTimerangeValueToJson(WeatherDataForecastAreaParameterTimerangeValue entity) {
	final Map<String, dynamic> data = <String, dynamic>{};
	data['unit'] = entity.unit;
	return data;
}