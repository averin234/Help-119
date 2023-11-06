import 'package:flutter/material.dart';
import 'package:get/get.dart';
import 'package:kreki119/app/core/values/app_colors.dart';
import 'package:kreki119/app/core/widget/elevated_container.dart';
import 'package:kreki119/app/data/model/response/contact_entity.dart';
import 'package:kreki119/app/data/model/response/firebase_user_entity.dart';
import 'package:nb_utils/nb_utils.dart';

import '../values/app_values.dart';
import '../values/text_styles.dart';

class ViewContact extends StatelessWidget {
  const ViewContact({Key? key,
    required this.item,
    required this.onTapCall}) : super(key: key);

  final ContactEntity item;
  final Function(String phone) onTapCall;

  @override
  Widget build(BuildContext context) {
    return ElevatedContainer(
        child: Column(
          mainAxisSize: MainAxisSize.min,
          crossAxisAlignment: CrossAxisAlignment.stretch,
          children: [
            Row(
              children: [
                const CircleAvatar(
                  backgroundColor: AppColors.primary400,
                  radius: AppValues.largeRadius,
                  child: Icon(Icons.person, size: AppValues.iconLargeSize, color: AppColors.neutral50,),
                ),

                AppValues.padding.toInt().width,

                Column(
                  crossAxisAlignment: CrossAxisAlignment.stretch,
                  children: [
                    Text(item.phoneNumber == null ? 'PSC' : item.fullName ?? '', style: cardTagStyle, overflow: TextOverflow.ellipsis,),
                    Text(item.phoneNumber ?? '119', style: cardSubtitleStyle,),
                    item.email!=null ? Text(item.email ?? '', style: cardSubtitleStyle,) : Container()
                  ],
                ).expand()
              ],
            ).paddingSymmetric(horizontal: AppValues.padding, vertical: AppValues.smallPadding),

            AppValues.smallPadding.toInt().height,

            AppButton(
              color: AppColors.secondary400,
              textColor: Colors.white,
              shapeBorder: const BeveledRectangleBorder(),
              onTap: (){
                onTapCall(item.phoneNumber??'');
              },
              text: 'Panggil Nomor',
            )
          ],
        )
    );
  }





}
