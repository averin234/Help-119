import 'package:flutter/material.dart';
import 'package:kreki119/app/data/model/response/contact_entity.dart';
import 'package:kreki119/app/data/model/response/firebase_user_entity.dart';
import 'package:nb_utils/nb_utils.dart';

import '../values/app_values.dart';
import '../values/text_styles.dart';
import '../widget/asset_image_view.dart';

class ItemContact extends StatelessWidget {
  const ItemContact({Key? key, required this.item}) : super(key: key);

  final ContactEntity item;

  @override
  Widget build(BuildContext context) {
    return Container(
      decoration: boxDecorationRoundedWithShadow(AppValues.radius_6.toInt()),
      child: Row(
        children: [
          const AssetImageView(fileName: 'ic_contact_blue.svg', width: AppValues.iconLargeSize,),
          AppValues.padding.toInt().width,
          Column(
            mainAxisAlignment: MainAxisAlignment.center,
            crossAxisAlignment: CrossAxisAlignment.start,
            children: [
              Text(item.phoneNumber == null ? 'PSC' : item.fullName ?? '', style: cardTagStyle, overflow: TextOverflow.ellipsis,),
              Text(item.phoneNumber ?? '119', style: cardSubtitleStyle,)
            ],
          )
        ],
      ),
    );
  }
}
