
import 'package:flutter/material.dart';

import '../utils/color_constant.dart';
import '../utils/constants.dart';
import 'appimage.dart';
import 'getText.dart';

AppBar appBar(BuildContext context, String title, Function() onTap) {
  return AppBar(
    backgroundColor: ColorConstant.white,
    elevation: 0,
    leadingWidth: 30,
    leading: Container(
        height: 28,
        width: 28,
        alignment: Alignment.centerRight,
        child: GestureDetector(
            onTap: onTap,
            child: Image.asset(
              AppImages.leftImage,
              height: 28,
              width: 28,
            ))),
    title: getText(
        title: title,
        size: 17,
        fontFamily: celiaBold,
        color: ColorConstant.blackColor,
        fontWeight: FontWeight.w400),
    centerTitle: true,
  );
}
