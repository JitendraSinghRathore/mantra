
import 'package:flutter/gestures.dart';
import 'package:flutter/services.dart';
import 'package:get/get.dart';
import 'package:flutter/material.dart';
import 'package:new_mantra/helper/appbar.dart';
import 'package:new_mantra/helper/customtextfield.dart';
import 'package:new_mantra/utils/constants.dart';
import '../../helper/custombtn.dart';
import '../../helper/getText.dart';
import '../../utils/color_constant.dart';
import '../../utils/screensize.dart';
import '../../utils/validation.dart';
import 'controller/createAccount_controller.dart';

class RegisterAccountScreen extends GetView<RegisterAccountController> {
  const RegisterAccountScreen({key});

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
                  mainAxisAlignment: MainAxisAlignment.start,
                  crossAxisAlignment: CrossAxisAlignment.start,
                  children: [
                    ScreenSize.height(50),
                    getText(
                        title: registerAccountTitle,
                        size: 20,
                        fontFamily: celiaRegular,
                        color: ColorConstant.blackColor,
                        fontWeight: FontWeight.w800),
                    ScreenSize.height(10),
                    const getText(
                        title: registerAccountSubTitle,
                        textAlign: TextAlign.center,
                        size: 14,
                        fontFamily: celiaRegular,
                        color: ColorConstant.black2,
                        fontWeight: FontWeight.w500),
                    ScreenSize.height(35),
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
                                hintText: registerFullName,
                                auto: AutovalidateMode.onUserInteraction,
                                controller: controller.fullNameController,
                                validator: (value) {
                                  if (value == null || value == "") {
                                    return "Please enter FullName";
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
                                hintText: registerMobileNumber,
                                auto: AutovalidateMode.onUserInteraction,
                                controller: controller.numberController,
                                validator: (value) {
                                  if (value == null ||
                                      value.length != 10 ||
                                      (!isValidPhone(value, isRequired: true))) {
                                    return "Mobile Number must be of 10 digit";
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
                                hintText: registerEmailAddress,
                                auto: AutovalidateMode.onUserInteraction,
                                controller: controller.emailController,
                                validator: (value) {
                                  if (value == null ||
                                      (!isValidEmail(value, isRequired: true))) {
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
                                  padding: const EdgeInsets.only(left: 3,right: 3),                                  child: CustomTextfield(
                                  hintText: registerPassword,
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
                                  validator: (value) {
                                    if (value == null ||(!isValidPassword(value, isRequired: true)))
                                    {
                                      return "Your password must be at least 8 characters long, \ncontain at least one number and have a mixture of\nuppercase and lowercase letters";

                                    }
                                    return null;
                                  },
                                ),
                                ),),
                            const Divider(
                              color: Colors.grey,
                            ),
                            Obx(()=>
                                Padding(
                                  padding: const EdgeInsets.only(left: 3,right: 3),                                  child: CustomTextfield(
                                  hintText: registerConfirmPassword,
                                  controller: controller.conformPasswordController,
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
                    Container(
                      padding: const EdgeInsets.all(0),
                      child: Row(
                        children: [
                          Obx(() => Padding(
                            padding:const EdgeInsets.only(bottom: 0),
                            child: Checkbox(
                              value:controller.checkBoxValue.value,
                              onChanged: (bool? value) {
                                controller.checkBoxValue.value = value!;
                              },
                            ),
                          ),
                          ),
                          const SizedBox(width: 2),
                          Padding(
                            padding:  const EdgeInsets.only(top: 0),
                            child: RichText(
                              maxLines: 2,
                              overflow: TextOverflow.ellipsis,
                              text: TextSpan(
                                text: loginAgree,
                                style: const TextStyle(
                                  color: Colors.black,
                                  fontSize: 13,
                                  fontFamily: celiaRegular,
                                ),
                                children: [
                                  TextSpan(
                                    text: loginTerms,
                                    style: const TextStyle(
                                      color: Colors.black87,
                                      fontSize: 18,
                                      decoration: TextDecoration.underline,
                                    ),
                                    recognizer: TapGestureRecognizer()
                                      ..onTap = () {
                                     ///   launchURL('https://www.kodago.com/page/terms');
                                      },

                                  ),

                                ],
                              ),
                            ),
                          ),
                        ],
                      ),
                    ),
                    ScreenSize.height(15),
                    Obx(
                      () => CustomBtn(
                          title: createBtn,
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
                    ScreenSize.height(15),
                    Center(
                      child: Padding(
                        padding:  const EdgeInsets.only(top: 0),
                        child: Row(
                          mainAxisAlignment: MainAxisAlignment.center,
                          children: [

                            getText(
                                title: registerAlreadyAccount,
                                size: 14,
                                fontFamily: celiaRegular,
                                color: ColorConstant.black2,
                                fontWeight: FontWeight.w800),
                            const SizedBox(width: 5,),
                            GestureDetector(
                              behavior: HitTestBehavior.opaque,
                              onTap: ()
                              {
                                Get.back();
                              },
                              child: getText(
                                  title: registerLogin,
                                  size: 15,
                                  fontFamily: celiaRegular,
                                  color: ColorConstant.blackColor,
                                  fontWeight: FontWeight.w800),
                            ),
                          ],
                        ),
                      ),
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
