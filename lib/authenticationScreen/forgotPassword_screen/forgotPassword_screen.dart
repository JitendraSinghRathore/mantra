
import 'package:flutter/services.dart';
import 'package:get/get.dart';
import 'package:flutter/material.dart';
import 'package:new_mantra/helper/appbar.dart';
import 'package:new_mantra/helper/customtextfield.dart';
import 'package:new_mantra/utils/constants.dart';
import '../../helper/appimage.dart';
import '../../helper/custombtn.dart';
import '../../helper/getText.dart';
import '../../utils/color_constant.dart';
import '../../utils/screensize.dart';
import 'controller/forgotPassword_controller.dart';

class ForgotPasswordScreen extends GetView<ForgotPasswordController> {
  const ForgotPasswordScreen({key});

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
          crossAxisAlignment: CrossAxisAlignment.center,

          children: [
            Form(
              key: controller.forgotPasswordFormKey,
              child: Padding(
                padding: const EdgeInsets.only(left: 28, right: 28, top: 0),
                child: Column(
                  mainAxisAlignment: MainAxisAlignment.center,
                  crossAxisAlignment: CrossAxisAlignment.center,
                  children: [
                    const SizedBox(height: 55,),
                    Image.asset(
                      AppImages.lockIcon,
                      height: 90,
                      fit: BoxFit.fill,
                      width: 90,
                    ),
                    ScreenSize.height(50),
                    getText(
                        title: forgotPasswordTitle,
                        size: 20,
                        fontFamily: celiaRegular,
                        color: ColorConstant.blackColor,
                        fontWeight: FontWeight.w800),
                    ScreenSize.height(14),
                    const Center(
                      child: getText(
                          title: forgotPasswordSubTitle,
                          textAlign: TextAlign.center,
                          size: 14,
                          fontFamily: celiaRegular,
                          color: ColorConstant.black2,
                          fontWeight: FontWeight.w500),
                    ),
                    const Center(
                      child: getText(
                          title: forgotPasswordSubTitle1,
                          textAlign: TextAlign.center,
                          size: 14,
                          fontFamily: celiaRegular,
                          color: ColorConstant.black2,
                          fontWeight: FontWeight.w500),
                    ),
                    ScreenSize.height(43),
                    Card(
                      child: Padding(
                        padding: const EdgeInsets.only(left: 0,top: 8,bottom: 8),
                        child: CustomTextfield(
                          hintText: forgotPasswordEmail,
                          controller: controller.numberController,
                          auto: AutovalidateMode.onUserInteraction,
                          validator: (val) {
                            if (val!.isEmpty) {
                              return loginEnterEmailValidation;
                            } else if (val.length < 10) {
                              return loginEnterValidEmailValidation;
                            }
                          },
                        ),
                      ),
                    ),
                    ScreenSize.height(31),
                    Obx(
                      () => CustomBtn(
                          title: forgotPasswordButton,
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
