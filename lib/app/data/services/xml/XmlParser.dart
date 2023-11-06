import 'package:logger/logger.dart';
import 'package:xml2json/xml2json.dart';

import '../../../../flavors/build_config.dart';

class XmlParser{

  XmlParser(this.xmlString);

  final Xml2Json myTransformer = Xml2Json();
  final String xmlString;
  final Logger logger = BuildConfig.instance.config.logger;


  String transformToBadgerFish({bool? useLocalNameForNode}){
    myTransformer.parse(xmlString);
    var data = myTransformer.toBadgerfish(useLocalNameForNodes: useLocalNameForNode = false);
    logger.d('aap, transformResult: $data');

    return data;
  }

  String transformToGData(){
    myTransformer.parse(xmlString);
    var data = myTransformer.toGData();
    logger.d('aap, transformResult: $data');

    return data;
  }

  String transformToParker({bool? withAttr = false, List<String>? array}){
    myTransformer.parse(xmlString);
    var data = withAttr == true ?
    myTransformer.toParkerWithAttrs(array: array)
        : myTransformer.toParker();
    logger.d('aap, transformResult: $data');

    return data;
  }



}