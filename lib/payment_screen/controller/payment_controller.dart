import 'package:flutter/material.dart';
import 'package:get/get.dart';
import '../../utils/size_config.dart';

class PaymentController extends GetxController {
  final oldPasswordController = TextEditingController();
  final newPasswordController = TextEditingController();
  final conformPasswordController = TextEditingController();
  final changePasswordFormKey = GlobalKey<FormState>();
  final isLoading = false.obs;
  final tabBarIndex = 0.obs;
  final hideShow = true.obs;
  final isVisible = true.obs;


  @override
  void onInit() {
    SizeConfig().init();
    super.onInit();
  }

  validation() async {
    if (changePasswordFormKey.currentState!.validate()) {
    }
  }
}
