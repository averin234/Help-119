import 'package:flutter/material.dart';
import 'package:get/get.dart';
import 'package:kreki119/app/core/utils/date_util.dart';
import 'package:kreki119/app/core/utils/string_util.dart';
import 'package:kreki119/app/core/values/text_styles.dart';
import 'package:kreki119/app/core/widget/asset_image_view.dart';
import 'package:kreki119/app/core/widget/elevated_container.dart';
import 'package:kreki119/app/core/widget/icon_text_widgets.dart';
import 'package:kreki119/app/data/services/weather/util_weather.dart';
import 'package:nb_utils/nb_utils.dart';
import 'package:weather/weather.dart';

import '../../routes/app_pages.dart';
import '../values/app_values.dart';

class ItemWeather extends StatelessWidget {
  const ItemWeather({Key? key, required this.item, this.onTap, this.tapWeather}) : super(key: key);

  final Weather item;
  final Function()? onTap;
  final Function()? tapWeather;

  @override
  Widget build(BuildContext context) {
    var date = item.date ?? DateTime.now();

    return Container(
      padding: const EdgeInsets.all(AppValues.smallPadding),
      child: Row(
        mainAxisAlignment: MainAxisAlignment.spaceAround,
        children: [
          SizedBox(
            width: AppValues.minLeadingWidth,
            child: Column(
              children: [
                AssetImageView(fileName: UtilWeather.baseImageWeatherUrl(item.weatherIcon ?? ''),
                  width: AppValues.iconHomeSize, isFromFile: true),

                Text('${item.temperature?.celsius?.toStringAsFixed(1)} C', textAlign: TextAlign.center,
                  maxLines: 1,
                )
              ],
            ),
          ),

          AppValues.padding.toInt().width,

          Column(
            crossAxisAlignment: CrossAxisAlignment.stretch,
            children: [
              Text('${item.weatherDescription?.toFirstLetterUpperCase()} di ${item.areaName}',
                style: settingsItemStyle, maxLines: 1, overflow: TextOverflow.ellipsis,
              ),

              IconTextWidget(icon: Icons.refresh, size: AppValues.iconSmallSize, alignment: MainAxisAlignment.start ,value: date.timeAgoID(),).onTap(tapWeather),

              // Text('${date.timeAgoID()} (muat ulang)', style: cardSubtitleStyle,).onTap(tapWeather),

              AppValues.smallPadding.toInt().height,

              Text('Terasa seperti ${item.tempFeelsLike?.celsius?.toStringAsFixed(1)} C')
            ],
          ).expand(),

          // IconButton(
          //     onPressed: (){
          //       Get.toNamed(Routes.WEATHER);
          //     },
          //     icon: const Icon(Icons.settings)
          // )
        ],
      ).onTap(onTap),
    );
  }
}
