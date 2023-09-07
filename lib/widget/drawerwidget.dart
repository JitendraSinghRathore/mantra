import 'package:flutter/material.dart';
import 'package:get/get.dart';

import '../helper/appimage.dart';
import '../helper/getText.dart';
import '../home_screen/controller/home_controller.dart';
import '../utils/color_constant.dart';
import '../utils/constants.dart';
import '../utils/screensize.dart';

drawer(BuildContext context, HomeController homeController) {
  return Container(
    width: MediaQuery.of(context).size.width - 70,
    height: double.infinity,
    color: ColorConstant.drawerColour.withOpacity(0.99),
    child: Column(
      children: [

        ScreenSize.height(50),
        Padding(
          padding: const EdgeInsets.only(left: 21),
          child: Row(
            children: [
              Column(
                crossAxisAlignment: CrossAxisAlignment.start,
                children: [
                  Container(
                    height: 70,
                    width: 70,
                    alignment: Alignment.center,
                    decoration: BoxDecoration(
                        shape: BoxShape.circle, color: ColorConstant.white),
                    child:
                      const CircleAvatar(
                        radius: 48, // Image radius
                        backgroundImage: AssetImage(AppImages.drawerUser,),
                      )
                  ),
                  SizedBox(height: 10,),
                  getText(
                      title: drawerUserName,
                      size: 20,
                      fontFamily: celiaMedium ,
                      color: ColorConstant.white,
                      fontWeight: FontWeight.w400),
                  SizedBox(height: 5,),
                  getText(
                      title: drawerUserEmail,
                      size: 14,
                      fontFamily: celiaRegular ,
                      color: ColorConstant.drawerEmail,
                      fontWeight: FontWeight.w400),
                ],
              ),

            ],
          ),
        ),
        ScreenSize.height(20),
        Container(
          height: 1,
          color: ColorConstant.c0Color,
        ),
        Expanded(
            child: SingleChildScrollView(
          physics: const ScrollPhysics(),
          child: Column(
            children: [
              ScreenSize.height(20),
              drawerItemWidget(drawerHome, AppImages.drawerHome, () {}),
              ScreenSize.height(10),
              drawerItemWidget(drawerWallet, AppImages.drawerWallet, () {}),
              ScreenSize.height(10),
              drawerItemWidget(drawerPayment, AppImages.drawerPayment, () {}),
              ScreenSize.height(10),
              drawerItemWidget(drawerProfile, AppImages.drawerUsers, () {}),
              ScreenSize.height(10),
              drawerItemWidget(drawerSupport, AppImages.drawerSupport, () {}),
              ScreenSize.height(10),
              drawerItemWidget(drawerTerms, AppImages.drawerTerms, () {}),
              /*ScreenSize.height(5),
              drawerItemWidget('Share', AppImages.backIcon, () {}),
              ScreenSize.height(5),
              drawerItemWidget('Log Out', AppImages.backIcon, () {
                Get.back();
               // logoutDialogBox(context, homeController);
              }),*/
            ],
          ),
        ))
      ],
    ),
  );
}

drawerItemWidget(String title, String img, Function() onTap) {
  return GestureDetector(
    behavior: HitTestBehavior.opaque,
    onTap: onTap,
    child: Container(
      alignment: Alignment.center,
      padding: const EdgeInsets.only(left: 21),
      height: 50,
      child: Row(
        children: [
          Container(
            height: 30,
            width: 30,
            alignment: Alignment.center,
            child: Image.asset(
              img,
              height: 25,
              width: 25,
            ),
          ),
          ScreenSize.width(25),
          getText(
              title: title,
              size: 14,
              fontFamily: celiaMedium,
              color: ColorConstant.white,
              fontWeight: FontWeight.w400)
        ],
      ),
    ),
  );
}
