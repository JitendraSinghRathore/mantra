
import 'package:flutter/services.dart';
import 'package:get/get.dart';
import 'package:flutter/material.dart';
import 'package:new_mantra/helper/customtextfield.dart';
import 'package:new_mantra/login_screen/controller/login_controller.dart';
import 'package:new_mantra/utils/constants.dart';

import '../helper/appimage.dart';
import '../helper/custombtn.dart';
import '../helper/getText.dart';
import '../utils/color_constant.dart';
import '../utils/screensize.dart';
import '../utils/size_config.dart';

class ForgotPasswordScreen extends GetView<LoginController> {
  const ForgotPasswordScreen({key});

  @override
  Widget build(BuildContext context) {
    SystemChrome.setSystemUIOverlayStyle(const SystemUiOverlayStyle(
        statusBarColor: Colors.black45,
        statusBarIconBrightness: Brightness.light
        //color set to transperent or set your own color
        ));
    return Scaffold(
      body: Column(
        mainAxisAlignment: MainAxisAlignment.center,
        children: [
          Form(
            key: controller.formKey,
            child: Padding(
              padding: const EdgeInsets.only(left: 28, right: 28, top: 0),
              child: Column(
                mainAxisAlignment: MainAxisAlignment.center,
                crossAxisAlignment: CrossAxisAlignment.start,
                children: [
                  const getText(
                      title: loginTitle,
                      size: 30,
                      fontFamily: poppinsExtraBold,
                      color: ColorConstant.naviBlue,
                      fontWeight: FontWeight.w800),
                  ScreenSize.height(4),
                  getText(
                      title: loginSubTitle,
                      textAlign: TextAlign.start,
                      size: 18,
                      fontFamily: celiaRegular,
                      color: ColorConstant.blackColor,
                      fontWeight: FontWeight.w600),
                  ScreenSize.height(21),
                  CustomTextfield(
                    hintText: loginEmail,
                    controller: controller.numberController,
                    textInputType: const TextInputType.numberWithOptions(
                        signed: true, decimal: true),
                    inputFormatters: [
                      FilteringTextInputFormatter.digitsOnly,
                      LengthLimitingTextInputFormatter(10)
                    ],
                    validator: (val) {
                      if (val!.isEmpty) {
                        return loginEnterEmailValidation;
                      } else if (val.length < 10) {
                        return loginEnterValidEmailValidation;
                      }
                    },
                  ),
                  ScreenSize.height(31),
                  Obx(()=>
                   CustomTextfield(
                      hintText: loginPassword,
                      controller: controller.passwordController,
                      isObscureText: controller.passwordVisible.value,
                      suffix: IconButton(
                        icon: Icon(
                          controller.passwordVisible.value
                              ? Icons.visibility
                              : Icons.visibility_off,
                          size: 25,
                          color: ColorConstant.buttonBorder,
                        ),
                        onPressed: () {
                          controller.passwordVisible.value =
                          !controller.passwordVisible.value;
                        },
                      ),
                      validator: (val) {
                        if (val!.isEmpty) {
                          return loginEnterPassword;
                        }
                      },
                    ),
                  ),
                  ScreenSize.height(10),
                  GestureDetector(
                    onTap: () {
                     // Get.toNamed(AppRoutes.forgotPassword);
                    },
                    child: Row(
                      mainAxisAlignment: MainAxisAlignment.end,
                      children: [
                        getText(
                            textAlign: TextAlign.end,
                            title: loginForgotPass,
                            size: AppFontSize.s14,
                            fontFamily: celiaRegular,
                            color: ColorConstant.naviBlue,
                            fontWeight: FontWeight.w700),
                      ],
                    ),
                  ),
                  ScreenSize.height(31),
                  Obx(
                    () => CustomBtn(
                        title: loginSignInButton,
                        height: 50,
                        width: double.infinity,
                        color: ColorConstant.naviBlue,
                        isLoading: controller.isLoading.value,
                        onTap: () {
                          controller.isLoading.value
                              ? null
                              : controller.validation();
                        }),
                  ),
                  ScreenSize.height(21),
                  GestureDetector(
                    onTap: () {
                      //Get.toNamed(AppRoutes.createAccount);
                    },
                    child: Row(
                      mainAxisAlignment: MainAxisAlignment.center,
                      children: [
                        getText(
                            textAlign: TextAlign.end,
                            title: loginCreateAccountButton,
                            size: AppFontSize.s14,
                            fontFamily: celiaRegular,
                            color: ColorConstant.blackColor,
                            fontWeight: FontWeight.w700),
                      ],
                    ),
                  ),
                ],
              ),
            ),
          ),
        ],
      ),
    );
  }
}
