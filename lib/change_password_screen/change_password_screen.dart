
import 'package:flutter/gestures.dart';
import 'package:flutter/services.dart';
import 'package:get/get.dart';
import 'package:flutter/material.dart';
import 'package:new_mantra/helper/appbar.dart';
import 'package:new_mantra/helper/customtextfield.dart';
import 'package:new_mantra/utils/constants.dart';

import '../helper/appimage.dart';
import '../helper/custombtn.dart';
import '../helper/getText.dart';
import '../utils/color_constant.dart';
import '../utils/screensize.dart';
import '../utils/validation.dart';
import 'controller/changePassword_controller.dart';

class ChangePasswordScreen extends GetView<ChangePasswordController> {
  const ChangePasswordScreen({key});

  @override
  Widget build(BuildContext context) {
    SystemChrome.setSystemUIOverlayStyle(const SystemUiOverlayStyle(
        statusBarColor: Colors.black45,
        statusBarIconBrightness: Brightness.light
        //color set to transperent or set your own color
        ));
    return Scaffold(
      appBar: AppBar(
        backgroundColor: ColorConstant.white,
        elevation: 0,
        leadingWidth: 30,
        leading: Padding(
          padding: const EdgeInsets.only(left: 10),
          child: Container(
              height: 28,
              width: 28,
              alignment: Alignment.center,
              child: GestureDetector(
                  onTap: ()
                  {
                    Get.back();
                  },
                  child: Image.asset(
                    AppImages.backIcon,
                    height: 28,
                    width: 28,
                  ))),
        ),
        title: getText(
            title: "Change Password",
            size: 17,
            fontFamily: celiaMedium,
            color: ColorConstant.blackColor,
            fontWeight: FontWeight.w400),
        centerTitle: false,
      ),
      body: SingleChildScrollView(
        child: Column(
          mainAxisAlignment: MainAxisAlignment.start,
          crossAxisAlignment: CrossAxisAlignment.center,

          children: [
            Form(
              key: controller.changePasswordFormKey,
              child: Padding(
                padding: const EdgeInsets.only(left: 28, right: 28, top: 0),
                child: Column(
                  mainAxisAlignment: MainAxisAlignment.start,
                  crossAxisAlignment: CrossAxisAlignment.start,
                  children: [
                    ScreenSize.height(10),

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
                                hintText: changePasswordOld,
                                auto: AutovalidateMode.onUserInteraction,
                                controller: controller.oldPasswordController,
                                validator: (value) {
                                  if (value == null || value == "") {
                                    return "Please enter OldPassword";
                                  }
                                  return null;
                                },
                              ),
                            ),

                            const Divider(
                              color: Colors.grey,
                            ),
                            Padding(
                              padding: const EdgeInsets.all(3.0),
                              child: CustomTextfield(
                                hintText: changePasswordNew,
                                auto: AutovalidateMode.onUserInteraction,
                                controller: controller.newPasswordController,
                                validator: (value) {
                                  if (value == null  ) {
                                    return "Enter new Password";
                                  }
                                  return null;
                                },
                              ),
                            ),
                            const Divider(
                              color: Colors.grey,
                            ),
                            Padding(
                              padding: const EdgeInsets.all(3.0),
                              child: CustomTextfield(
                                hintText: changePasswordConform,
                                auto: AutovalidateMode.onUserInteraction,
                                controller: controller.conformPasswordController,
                                validator: (value) {
                                  if (value == null) {
                                    return "Please confirm Password";
                                  }
                                  return null;
                                },
                              ),
                            ),


                          ],
                        ),
                      ),
                    ),
                    ScreenSize.height(50),
                    Obx(
                      () => CustomBtn(
                          title: profileUpdateBtn,
                          height: 50,
                          width: double.infinity,
                          color: ColorConstant.commonColor,
                          isLoading: controller.isLoading.value,
                          onTap: () {
                            controller.isLoading.value
                                ? null
                                : controller.validation();
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
