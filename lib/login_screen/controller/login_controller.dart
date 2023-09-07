import 'dart:convert';
import 'package:flutter/material.dart';
import 'package:flutter_easyloading/flutter_easyloading.dart';
import 'package:get/get.dart';

import '../../config/routes.dart';
import '../../utils/size_config.dart';
class LoginController extends GetxController {
  final emailController = TextEditingController();
  final passwordController = TextEditingController();
  final formKey = GlobalKey<FormState>();
  final checkBoxValue = false.obs;
  final passwordVisible = true.obs;
  final isLoading = false.obs;

  @override
  void onInit() {
    SizeConfig().init();
    super.onInit();
  }

  validation() async {
    if (formKey.currentState!.validate()) {

      //loginApiFunction();
    }
  }

 /* void loginApiFunction() async {
    isLoading.value = true;
    var body = json.encode({
      "mobile": '+91${numberController.text}',
      "password": passwordController.text.toString(),
    });
    final response = await ApiConfig.post(
        body: body, url: ApiConfig.loginUrl, useAuthToken: false);
    isLoading.value = false;
    if (response != null && response['success'] == true) {
      EasyLoading.showToast(response['message'].toString(),
          toastPosition: EasyLoadingToastPosition.bottom);
      setAuthToken(response['user']['token']);
      Get.offAllNamed(AppRoutes.dashboard);
    } else {
      EasyLoading.showToast(response['message'].toString(),
          toastPosition: EasyLoadingToastPosition.bottom);
    }
  }*/
}
