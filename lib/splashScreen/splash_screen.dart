import 'package:flutter/material.dart';
import 'package:get/get.dart';

import '../helper/getText.dart';
import '../utils/color_constant.dart';
import '../utils/constants.dart';
import 'controller/splash_controller.dart';

class SplashScreen extends GetView<SplashController> {
  const SplashScreen({key});
  @override
  Widget build(BuildContext context) {
    return Scaffold(
        backgroundColor: Colors.black,
        body: Center(
            child: getText(
                title: splashTitle,
                size: 64,
                fontFamily: celiaBold,
                color: ColorConstant.white,
                fontWeight: FontWeight.w400)));
  }
}
