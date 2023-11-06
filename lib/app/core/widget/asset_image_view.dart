import 'dart:io';

import 'package:flutter/material.dart';
import 'package:flutter_svg/flutter_svg.dart';

class AssetImageView extends StatelessWidget {
  const AssetImageView({
    Key? key,
    required this.fileName,
    this.height,
    this.width,
    this.color,
    this.scale,
    this.isFromFile = false,
    this.fit
  }) : super(key: key);

  final String fileName;
  final double? height;
  final double? width;
  final Color? color;
  final double? scale;
  final bool isFromFile;
  final BoxFit? fit;

  @override
  Widget build(BuildContext context) {
    return _getView();
  }

  Widget _getView() {
    String mimType = fileName.split(".").last;
    String path = isFromFile ? fileName : "assets/images/$fileName";

    if (mimType.isEmpty) {
      return Icon(
        Icons.image_not_supported_outlined,
        size: width,
        color: color,
      );
    }

    return _getImageBasedOnMime(mimType, path);

  }

  Widget _getImageBasedOnMime(String mimType, String path){
    switch (mimType) {
      case "svg":
        return SvgPicture.asset(
          path,
          height: height,
          width: width,
          color: color,
        );
      case "png":
      case "jpg":
      case "jpeg":
        return isFromFile ?
        path.contains('http') ?
        Image.network(path,
          height: height,
          width: width,
          color: color,
          scale: scale ?? 1.0,
          fit: fit ?? BoxFit.cover,) :
        Image.file(
          File(path),
          height: height,
          width: width,
          color: color,
          scale: scale ?? 1.0,
          fit: fit ?? BoxFit.cover,
        ):
        Image.asset(
          path,
          height: height,
          width: width,
          color: color,
          scale: scale,
          fit: fit ?? BoxFit.cover,
        );
      default:
        return Icon(
          Icons.image_not_supported_outlined,
          size: width,
          color: color,
        );
    };
  }
}
