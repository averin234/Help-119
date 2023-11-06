import 'dart:convert';
import 'dart:io';

import "package:http/http.dart" as http;
import 'package:logger/logger.dart';
import 'package:xml/xml_events.dart';

import '../../../../flavors/build_config.dart';

///this class is for getting data from xml
class XmlService{

  final Logger logger = BuildConfig.instance.config.logger;

  Future<String> getDataXmlFromUrl(String link) async{
    String data = '';

    final url = Uri.parse(link);
    final request = await HttpClient().getUrl(url);
    final response = await request.close();
    await response
        .transform(utf8.decoder)
        .toXmlEvents()
        .normalizeEvents()
        .forEachEvent(onText: (event) => data = event.text);

    logger.d('aap, dataXmlService: $data');

    return data;
  }

  Future<String> getHttpXmlFromUrl(String link)async{
    String data = '';
    var response = await http.get(Uri.parse(link));
    data = response.body;
    logger.d('aap, dataFromXMLService: $data');

    return data;
  }
}