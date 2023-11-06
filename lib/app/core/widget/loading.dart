import 'package:flutter/material.dart';
import 'package:kreki119/app/core/values/app_colors.dart';
import 'package:kreki119/app/core/widget/asset_image_view.dart';

import '/app/core/values/app_values.dart';
import '/app/core/widget/elevated_container.dart';

class Loading extends StatelessWidget {
  const Loading({Key? key}) : super(key: key);

  @override
  Widget build(BuildContext context) {
    return Container(
      height: double.infinity,
      width: double.infinity,
      color: AppColors.neutral100,
      child: const Center(
        child: ElevatedContainer(
          padding: EdgeInsets.all(AppValues.margin),
          child: AssetImageView(fileName: 'logo_kreki.png',
            height: AppValues.iconSize_22,
            width: AppValues.iconSize_22,
          ),
        ),
      ),
    );
  }
}
