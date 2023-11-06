import 'package:flutter/material.dart';
import 'package:nb_utils/nb_utils.dart';

import '../values/text_styles.dart';
import '/app/core/values/app_values.dart';
import '/app/core/widget/asset_image_view.dart';

class IconTextWidget extends StatelessWidget {
  const IconTextWidget({
    Key? key,
    this.fileName,
    this.icon,
    this.value,
    this.height,
    this.width,
    this.size,
    this.color,
    this.alignment,
  }) : super(key: key);

  final String? fileName;
  final IconData? icon;
  final String? value;
  final double? height;
  final double? width;
  final double? size;
  final Color? color;
  final MainAxisAlignment? alignment;

  @override
  Widget build(BuildContext context) {
    if (fileName != null) {
      return _getImage(fileName!);
    } else if (icon != null) {
      return _getIcon(icon!);
    } else {
      return _getIcon(Icons.image_not_supported_outlined);
    }
  }

  Widget _getIcon(IconData iconData) {
    return Row(
      mainAxisAlignment: alignment ?? MainAxisAlignment.center,
      mainAxisSize: MainAxisSize.min,
      children: [
        Icon(icon, size: size, color: color),
        8.width,
        if (value != null) Text(value!, style: TextStyle(color: color)),
      ],
    );
  }

  Widget _getImage(String fileName) {
    return Row(
      mainAxisAlignment: MainAxisAlignment.center,
      mainAxisSize: MainAxisSize.min,
      children: [
        AssetImageView(
          fileName: fileName,
          height: height,
          width: width,
          color: color,
        ),
        const SizedBox(width: AppValues.margin_2),
        if (value != null)   SizedBox( width: 180,child: Text(value!, style: boldTitleNeutralColorStyle), ),

      ],
    );
  }
}
