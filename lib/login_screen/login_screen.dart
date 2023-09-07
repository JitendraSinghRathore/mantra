import 'package:flutter/services.dart';
import 'package:get/get.dart';
import 'package:flutter/material.dart';
import 'package:new_mantra/helper/custombtn_new.dart';
import 'package:new_mantra/helper/customtextfield.dart';
import 'package:new_mantra/login_screen/controller/login_controller.dart';
import 'package:new_mantra/utils/constants.dart';
import 'package:new_mantra/utils/validation.dart';
import '../config/routes.dart';
import '../helper/appbar.dart';
import '../helper/custombtn.dart';
import '../helper/getText.dart';
import '../utils/color_constant.dart';
import '../utils/screensize.dart';
import '../utils/size_config.dart';

class LoginScreen extends GetView<LoginController> {
  const LoginScreen({key});

  @override
  Widget build(BuildContext context) {
    SystemChrome.setSystemUIOverlayStyle(const SystemUiOverlayStyle(
        statusBarColor: Colors.black45,
        statusBarIconBrightness: Brightness.light
        //color set to transperent or set your own color
        ));
    return Scaffold(
      appBar: appBar(context, "", () {
        Get.back();
      }),
      body: SingleChildScrollView(

        child: Column(
          mainAxisAlignment: MainAxisAlignment.start,
          children: [
            Form(
              key: controller.formKey,
              child: Padding(
                padding: const EdgeInsets.only(left: 28, right: 28, top: 48),
                child: Column(
                  mainAxisAlignment: MainAxisAlignment.center,
                  crossAxisAlignment: CrossAxisAlignment.center,
                  children: [
                    const Column(
                      children: [
                        getText(
                            title: loginTitle,
                            size: 30,
                            fontFamily: poppinsExtraBold,
                            color: ColorConstant.naviBlue,
                            fontWeight: FontWeight.w800),
                       /* getText(
                            title: loginTitle1,
                            size: 30,
                            fontFamily: poppinsExtraBold,
                            color: ColorConstant.naviBlue,
                            fontWeight: FontWeight.w800),*/
                      ],
                    ),

                    ScreenSize.height(24),
                    getText(
                        title: loginSubTitle,
                        textAlign: TextAlign.start,
                        size: 18,
                        fontFamily: celiaRegular,
                        color: ColorConstant.blackColor,
                        fontWeight: FontWeight.w500),
                    ScreenSize.height(31),
                    Card(
                      elevation: 3,
                      shadowColor: Colors.black87,
                      child: Padding(
                        padding: const EdgeInsets.only(top: 10),
                        child: Column(
                          children: [
                            Padding(
                              padding: const EdgeInsets.all(3.0),
                              child: CustomTextfield(
                                hintText: loginEmail,
                                auto: AutovalidateMode.onUserInteraction,
                                controller: controller.emailController,
                                validator: (value) {
                                  if (value == null || (!isValidEmail(value, isRequired: true))) {
                                    return "Please enter valid email";
                                  }
                                  return null;
                                },
                              ),
                            ),

                            const Divider(
                              color: Colors.grey,
                            ),
                            Obx(()=>
                                Padding(
                                  padding: const EdgeInsets.all(3.0),
                                  child: CustomTextfield(
                                    hintText: loginPassword,
                                    controller: controller.passwordController,
                                    auto: AutovalidateMode.onUserInteraction,
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
                                ),),
                          ],
                        ),
                      ),
                    ),

                    ScreenSize.height(20),
                    Row(
                      mainAxisAlignment: MainAxisAlignment.end,
                      children: [
                        GestureDetector(
                          behavior: HitTestBehavior.opaque,
                          onTap: () {
                            Get.toNamed(AppRoutes.forgotPasswordScreen);
                          },
                          child: getText(
                              textAlign: TextAlign.end,
                              title: loginForgotPass,
                              size: 12,
                              fontFamily: celiaRegular,
                              color: ColorConstant.naviBlue,
                              fontWeight: FontWeight.w700),
                        ),
                      ],
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
                            Get.toNamed(AppRoutes.homeScreen);
                           /* controller.isLoading.value
                                ? null
                                : controller.validation();*/
                          }),
                    ),
                    ScreenSize.height(21),
                   /* GestureDetector(
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
                    ),*/
                    Obx(
                          () => CustomBtnNew(
                          title: loginCreateAccountButton,
                          height: 50,
                          width: double.infinity,
                          color: ColorConstant.whiteColor,
                          isLoading: controller.isLoading.value,
                          onTap: () {
                            Get.toNamed(AppRoutes.registerAccountScreen);
                          }),
                    ),
                  ],
                ),
              ),
            ),
          ],
        ),
      ),
    );
  }
}
