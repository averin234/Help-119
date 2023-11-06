import 'package:logger/logger.dart';

import '/app/core/values/app_values.dart';

class EnvConfig {
  final String appName;
  final String baseUrl;
  final bool shouldCollectCrashLog;
  final String initialPage;

  late final Logger logger;
  final String weatherApi = "6c03c4e446b1815d1ec2a6a142d880b6";
  static String baseImageWeatherUrl(String icon) => 'http://openweathermap.org/img/wn/$icon@2x.png';

  EnvConfig({
    required this.appName,
    required this.baseUrl,
    required this.initialPage,
    this.shouldCollectCrashLog = false,
  }) {
    logger = Logger(
      printer: PrettyPrinter(
          methodCount: AppValues.loggerMethodCount,
          // number of method calls to be displayed
          errorMethodCount: AppValues.loggerErrorMethodCount,
          // number of method calls if stacktrace is provided
          lineLength: AppValues.loggerLineLength,
          // width of the output
          colors: true,
          // Colorful log messages
          printEmojis: true,
          // Print an emoji for each log message
          printTime: false // Should each log print contain a timestamp
          ),
    );
  }
}
