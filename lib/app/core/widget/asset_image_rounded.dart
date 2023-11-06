import 'dart:io';

import 'package:cached_network_image/cached_network_image.dart';
import 'package:flutter/material.dart';
import 'package:nb_utils/nb_utils.dart';

import '../values/app_colors.dart';
import '../values/app_values.dart';

class AssetImageRounded extends StatelessWidget {
  const AssetImageRounded({Key? key,
    required this.pathImage,
    this.isAddedImage = false,
    this.onTapAddImage, this.width,
    this.isFromNetwork = false}) : super(key: key);

  final String pathImage;
  final bool? isAddedImage;
  final Function()? onTapAddImage;
  final double? width;
  final bool? isFromNetwork;

  @override
  Widget build(BuildContext context) {
    bool pictureFromNetwork = isFromNetwork ?? false;
    DecorationImage decorationImage = pictureFromNetwork ?
        DecorationImage(image: CachedNetworkImageProvider(pathImage), fit: BoxFit.cover) :
        DecorationImage(image: FileImage(File(pathImage)), fit: BoxFit.cover);

    return Container(
      width: width,
        padding: pathImage.isEmpty ? const EdgeInsets
            .all(AppValues.smallPadding) : EdgeInsets.zero,
        decoration: BoxDecoration(
            color: Colors.white,
            boxShadow: defaultBoxShadow(),
            borderRadius: BorderRadius.circular(AppValues.radius_12),
            image: pathImage.isEmpty ? null :
            decorationImage
        ),
        child: pathImage.isEmpty
            ? isAddedImage??false ?
        const Icon(
          Icons.add_a_photo, color: AppColors.neutral100,size: AppValues.iconLargeSize,) :
        const Icon(
          Icons.broken_image_rounded, color: AppColors.neutral100,size: AppValues.iconLargeSize,
        ) :

        Container()
    ).onTap(onTapAddImage);
  }
}
