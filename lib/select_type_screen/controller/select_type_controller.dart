
import 'package:flutter/material.dart';
import 'package:get/get.dart';

import '../../walkthrough_screen/walkthrough_screen.dart';

class SelectTypeController extends GetxController {
  final isSelected=false.obs;
  @override
  void onInit() {
    super.onInit();
    callToNavigate();
  }

  callToNavigate() async {
    Future.delayed(const Duration(seconds: 2), () async {
      Get.to( OnboardingScreen());
    });
  }
}
