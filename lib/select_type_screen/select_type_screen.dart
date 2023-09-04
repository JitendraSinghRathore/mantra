import 'package:flutter/material.dart';
import 'package:get/get.dart';
import 'package:new_mantra/helper/appimage.dart';
import 'package:new_mantra/helper/custombtn2.dart';
import '../config/routes.dart';
import '../helper/custombtn.dart';
import '../helper/getText.dart';
import '../utils/color_constant.dart';
import '../utils/constants.dart';
import 'controller/select_type_controller.dart';

class SelectTypeScreen extends GetView<SelectTypeController> {
  const SelectTypeScreen({key});
  @override
  Widget build(BuildContext context) {
    return Scaffold(
        backgroundColor: ColorConstant.backgrounType,
        body: Center(
            child: Padding(
          padding: const EdgeInsets.only(left: 40,right: 40,),
          child: Column(
            mainAxisAlignment: MainAxisAlignment.center,
            crossAxisAlignment: CrossAxisAlignment.center,
            children: [
              Row(
                mainAxisAlignment: MainAxisAlignment.center,
                crossAxisAlignment: CrossAxisAlignment.center,
                children: [
              cards(userTitle, AppImages.userIcon),
                  const SizedBox(width: 60,),
            cards(expertTitle, AppImages.expertIcon),
                ],
              ),
              const SizedBox(height: 100,),
              button(signInTitle),
              const SizedBox(height: 20,),
              button2(createAccountTitle),

            ],
          ),
        )));
  }

  Widget cards(String title, String image,) {
    return Flexible(
        child: Card(
          color: Colors.white,
          shape: RoundedRectangleBorder(
            borderRadius: BorderRadius.circular(10),
            //set border radius more than 50% of height and width to make circle
          ),
          elevation: 0,
          child: SizedBox(
      width: double.infinity,
      child: Padding(
        padding: const EdgeInsets.symmetric(vertical: 25,),
        child: Column(
            mainAxisAlignment: MainAxisAlignment.center,
            crossAxisAlignment: CrossAxisAlignment.center,
            children: [
              Image.asset(
                image,
                height: 45,
                width: 45,
              ),
              const SizedBox(height: 5),
              getText(
                  title: title,
                  size: 15,
                  textAlign: TextAlign.center,
                  fontFamily: celiaMedium,
                  color: ColorConstant.blackColor,
                  fontWeight: FontWeight.w500),
            ],

        ),
      ),
    ),
        ));
  }

  Widget button(String title, ) {
    return Flexible(
        child: CustomBtn(
            title: title,
            height: 50,
            width: double.infinity,
            color: ColorConstant.naviBlue,
            onTap: () {
              Get.toNamed(AppRoutes.loginScreen);
             // Get.toNamed(AppRoutes.);
            }));
  }

  Widget button2(String title, ) {
    return Flexible(
        child: CustomBtn2(
            title: title,
            height: 45,
            width: double.infinity,
            color: ColorConstant.white,
            onTap: () {

            }));
  }


}
