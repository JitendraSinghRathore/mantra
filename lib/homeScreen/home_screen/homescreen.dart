import 'package:flutter/services.dart';
import 'package:get/get.dart';
import 'package:flutter/material.dart';
import 'package:new_mantra/config/routes.dart';
import 'package:new_mantra/helper/appimage.dart';
import 'package:new_mantra/utils/color_constant.dart';
import 'package:new_mantra/utils/constants.dart';
import '../../helper/getText.dart';
import '../../utils/screensize.dart';
import 'controller/home_controller.dart';

class HomeScreen extends GetView<HomeController> {
  const HomeScreen({key});

  @override
  Widget build(BuildContext context) {
    SystemChrome.setSystemUIOverlayStyle(const SystemUiOverlayStyle(
        statusBarColor: Colors.black54,
        statusBarBrightness: Brightness.dark));
    return Scaffold(

      backgroundColor: ColorConstant.homeBackground,
      key: controller.scaffoldKey,
     // drawer: drawer(context, controller),
      body:
      SingleChildScrollView(
        child: Column(
          mainAxisAlignment: MainAxisAlignment.start,
          crossAxisAlignment: CrossAxisAlignment.center,
          children: [
            Form(
              key: controller.formKey,
              child: Column(
                mainAxisAlignment: MainAxisAlignment.start,
                crossAxisAlignment: CrossAxisAlignment.start,
                children: [
                  ///heading Screen
                  SizedBox(
                    width: MediaQuery.of(context).size.width,
                    height: MediaQuery.of(context).size.height / 2.7,
                    child: Stack(
                      fit: StackFit.loose,
                      children: [
                        Container(
                          height: 200,
                          width: MediaQuery.of(context).size.width,
                          decoration: BoxDecoration(
                              color: ColorConstant.commonColor.withOpacity(0.99),
                              borderRadius: const BorderRadius.only(
                                  bottomLeft: Radius.circular(30),
                                  bottomRight: Radius.circular(30))),
                          child: Column(
                            mainAxisAlignment: MainAxisAlignment.start,
                            crossAxisAlignment: CrossAxisAlignment.start,
                            children: [
                              Padding(
                                padding: const EdgeInsets.only(
                                    top: 10, left: 25, right: 10),
                                child: Column(
                                  mainAxisAlignment: MainAxisAlignment.start,
                                  crossAxisAlignment: CrossAxisAlignment.start,
                                  children: [
                                    getText(
                                        title: homeTitle,
                                        size: 20,
                                        fontFamily: celiaRegular,
                                        color: ColorConstant.white
                                            .withOpacity(0.5),
                                        fontWeight: FontWeight.w400),
                                    const SizedBox(
                                      height: 5,
                                    ),
                                    getText(
                                        title: userName,
                                        size: 20,
                                        fontFamily: celiaRegular,
                                        color: ColorConstant.white,
                                        fontWeight: FontWeight.w400),
                                    const SizedBox(
                                      height: 15,
                                    ),
                                    getText(
                                        title: onlineUser,
                                        size: 16,
                                        fontFamily: celiaRegular,
                                        color: ColorConstant.white,
                                        fontWeight: FontWeight.w400),
                                  ],
                                ),
                              ),
                            ],
                          ),
                        ),
                        Positioned(
                          top: 110,
                          child: Padding(
                            padding: const EdgeInsets.only(left: 10),
                            child: SizedBox(
                              height: 165,
                              width: MediaQuery.of(context).size.width,
                              child: ListView.builder(
                                  shrinkWrap: true,
                                  scrollDirection: Axis.horizontal,
                                  itemCount: 5,
                                  itemBuilder: (BuildContext context, int index) {

                                    return GestureDetector(
                                      onTap: ()
                                      {
                                        controller.selectedAddressType.value = index;

                                      },
                                      child: onlineCardData(context,index),
                                    );
                                  }),
                            ),
                          ),
                        ),
                      ],
                    ),
                  ),
                  ///Popular Category Screen
                  Padding(
                    padding: const EdgeInsets.only(left: 30,top: 10),
                    child: getText(
                        title: popularCategory,
                        size: 16,
                        fontFamily: celiaRegular,
                        color: ColorConstant.blackColor,
                        fontWeight: FontWeight.w500),
                  ),
                  Padding(
                    padding: const EdgeInsets.only(left: 10, top: 10),
                    child: SizedBox(
                      height: MediaQuery.of(context).size.height / 5.2,
                      width: MediaQuery.of(context).size.width,
                      child: ListView.builder(
                          shrinkWrap: true,
                          scrollDirection: Axis.horizontal,
                          itemCount: 5,
                          itemBuilder: (BuildContext context, int index) {
                            return GestureDetector(
                              behavior: HitTestBehavior.opaque,
                              onTap: ()
                                {
                                  controller.selectedAddressType.value = index;
                                //  Get.toNamed(AppRoutes.categoryListScreen);
                                  },
                                child: popularCategoryData(context,index));
                          }),
                    ),
                  ),
                  ///Astrologers Screen
                  Padding(
                    padding: const EdgeInsets.only(left: 30, top: 15,right: 10,),
                    child: SizedBox(
                      width: MediaQuery.of(context).size.width,
                      child: Row(
                        mainAxisAlignment: MainAxisAlignment.start,
                        children: [
                          getText(
                              title: astrologers,
                              size: 16,
                              fontFamily: celiaRegular,
                              color: ColorConstant.blackColor,
                              fontWeight: FontWeight.w500),
                          const Spacer(),
                          const Padding(
                            padding: EdgeInsets.only(right: 5),
                            child: getText(
                                title: viewAll,
                                size: 14,
                                fontFamily: celiaMedium,
                                color: ColorConstant.commonColor,
                                fontWeight: FontWeight.w600),
                          ),
                        ],
                      ),
                    ),
                  ),
                  Padding(
                    padding: const EdgeInsets.only(left: 10, top: 5),
                    child: ListView.builder(
                        shrinkWrap: true,
                        itemCount: 14,
                        physics: NeverScrollableScrollPhysics(),
                        itemBuilder: (BuildContext context, int index) {
                          return astrologersCardData(context);
                        }),
                  ),
                ],
              ),
            ),
          ],
        ),
      ),
    );
  }

  onlineCardData(BuildContext context, int index) {
    return Padding(
      padding: const EdgeInsets.only(top: 0, left: 10, right: 10),
      child: SizedBox(
        width: MediaQuery.of(context).size.width - 80,
        child:
          GestureDetector(
            onTap: ()
            {
             // controller.selectedAddressType.value = index;
              Get.toNamed(AppRoutes.categoryDetailsScreen);
            },
            child: Card(
              shape: RoundedRectangleBorder(
                borderRadius: BorderRadius.circular(20),
                //set border radius more than 50% of height and width to make circle
              ),
              child: Padding(
                padding: const EdgeInsets.only(left: 8,right: 8,top: 8),
                child: Column(
                  crossAxisAlignment: CrossAxisAlignment.start,
                  children: [
                    Row(
                      children: [
                        Container(
                            height: 50,
                            width: 50,
                            alignment: Alignment.center,
                            decoration: BoxDecoration(
                                shape: BoxShape.circle, color: ColorConstant.white),
                            child: const CircleAvatar(
                              radius: 48, // Image radius
                              backgroundImage: AssetImage(
                                AppImages.onlineUser,
                              ),
                            )),
                        Spacer(),
                        Align(
                          alignment: Alignment.center,
                          child: Container(
                            decoration: BoxDecoration(
                                borderRadius: BorderRadius.circular(50),
                                color: const Color(0xffE9FCF0)),
                            height: 55,
                            width: 55,
                            child: Padding(
                              padding: const EdgeInsets.all(16.0),
                              child: Image.asset(
                                AppImages.homePhone,
                                color: ColorConstant.greenColor,
                              ),
                            ),
                          ),
                        ),
                      ],
                    ),
                    const SizedBox(
                      height: 5,
                    ),
                    Padding(
                      padding:
                          const EdgeInsets.only(left: 5, right: 10, bottom: 15),
                      child: Column(
                        crossAxisAlignment: CrossAxisAlignment.start,
                        children: [
                          getText(
                              title: "Jon Dav",
                              size: 16,
                              fontFamily: celiaBold,
                              color: ColorConstant.blackColor,
                              fontWeight: FontWeight.w400),
                          const SizedBox(
                            height: 5,
                          ),
                          Row(
                            children: [
                              SizedBox(
                                  height: 25,
                                  width: 25,
                                  child: Image.asset(
                                    AppImages.homeExp,
                                    color: ColorConstant.homeExp,
                                  )),
                              const SizedBox(
                                width: 10,
                              ),
                              const getText(
                                  title: "Exp. 5+ Years",
                                  size: 13,
                                  fontFamily: celiaRegular,
                                  color: ColorConstant.homeExp,
                                  fontWeight: FontWeight.w400),
                            ],
                          ),
                          const SizedBox(
                            height: 5,
                          ),
                          Row(
                            children: [
                              SizedBox(
                                  height: 12,
                                  width: 12,
                                  child: Image.asset(
                                    AppImages.ruppesExp,
                                    color: ColorConstant.blackColor,
                                  )),
                              const SizedBox(
                                width: 5,
                              ),
                              getText(
                                  title: "1 / min",
                                  size: 13,
                                  fontFamily: celiaMedium,
                                  color: ColorConstant.blackColor,
                                  fontWeight: FontWeight.w400),
                              const Spacer(),
                              const getText(
                                  title: "Astrologer",
                                  size: 13,
                                  fontFamily: celiaMedium,
                                  color: ColorConstant.commonColor,
                                  fontWeight: FontWeight.w400),
                            ],
                          )
                        ],
                      ),
                    )
                  ],
                ),
              ),
            ),
          ),
        ),
    );
  }

  popularCategoryData(BuildContext context,int index) {
    return Obx(()=>
      GestureDetector(
        onTap: ()
        {
          controller.selectedAddressType.value = index;
          Get.toNamed(AppRoutes.categoryListScreen);
        },
        child: Padding(
          padding: const EdgeInsets.only(top: 0, left: 10, right: 10),
          child: SizedBox(
            width: MediaQuery.of(context).size.width / 3.2,
            child: Card(
              color: controller.selectedAddressType.value == index
                  ? ColorConstant.commonColor
                  : ColorConstant.white,
              shape: const RoundedRectangleBorder(
                  borderRadius: BorderRadius.only(
                topLeft: Radius.circular(5),
                topRight: Radius.circular(40),
                bottomLeft: Radius.circular(40),
                bottomRight: Radius.circular(5),
              )
                  //set border radius more than 50% of height and width to make circle
                  ),
              child: Padding(
                padding: const EdgeInsets.only(top: 15),
                child: Column(
                  crossAxisAlignment: CrossAxisAlignment.center,
                  children: [
                    Image.asset(
                      height: 40,
                      width: 40,
                      AppImages.astrology,
                      color:  controller.selectedAddressType.value == index
                          ? ColorConstant.white
                          : ColorConstant.blackColor,
                    ),
                    /*Container(
                        height: 35,
                        width: 35,
                        alignment: Alignment.center,
                        child: const CircleAvatar(
                          radius: 35, // Image radius\
                          backgroundImage: AssetImage(
                            AppImages.astrology,
                          ),
                        )),*/
                    const SizedBox(
                      height: 12,
                    ),
                    Center(
                      child: getText(
                          title: "Reiki",
                          size: 16,
                          fontFamily: celiaMedium,
                          color:  controller.selectedAddressType.value == index
                              ? ColorConstant.white
                              : ColorConstant.blackColor,
                          fontWeight: FontWeight.w400),
                    ),
                    getText(
                        title: "Healing",
                        size: 14,
                        fontFamily: celiaMedium,
                        color:  controller.selectedAddressType.value == index
                            ? ColorConstant.white
                            : ColorConstant.blackColor,
                        fontWeight: FontWeight.w400),
                  ],
                ),
              ),
            ),
          ),
        ),
      ),
    );
  }

  astrologersCardData(BuildContext context) {
    return Padding(
      padding: const EdgeInsets.only(top: 0, left: 10, right: 10,),
      child: SizedBox(
        width: MediaQuery.of(context).size.width,
        child: Card(
          shape: RoundedRectangleBorder(
            borderRadius: BorderRadius.circular(20),
            //set border radius more than 50% of height and width to make circle
          ),
          child: Padding(
            padding: const EdgeInsets.only(left: 8,right: 15,top: 15,bottom: 15),
            child: Row(
              crossAxisAlignment: CrossAxisAlignment.center,
              children: [
                Container(
                    alignment: Alignment.center,
                    decoration: BoxDecoration(
                        shape: BoxShape.circle, color: ColorConstant.white),
                    child: const CircleAvatar(
                      radius: 25, // Image radius
                      backgroundImage: AssetImage(
                        AppImages.onlineUser,
                      ),
                    )),
                const SizedBox(
                  width: 10,
                ),
                Expanded(
                  child: Column(
                    crossAxisAlignment: CrossAxisAlignment.start,
                    children: [

                      Row(
                        mainAxisAlignment: MainAxisAlignment.start,
                        crossAxisAlignment: CrossAxisAlignment.center,
                        children: [
                          Column(
                            mainAxisAlignment: MainAxisAlignment.start,
                            crossAxisAlignment: CrossAxisAlignment.start,
                            children: [
                              getText(
                                  title: "Jon Dav",
                                  size: 15,
                                  fontFamily: celiaMedium,
                                  color: ColorConstant.blackColor,
                                  fontWeight: FontWeight.w500),
                              SizedBox(height: 2,),
                              Row(
                                children: [
                                  SizedBox(
                                      height: 23,
                                      width: 23,
                                      child: Image.asset(
                                        AppImages.homeExp,
                                        color: ColorConstant.homeExp,
                                      )),
                                  const SizedBox(
                                    width: 10,
                                  ),
                                  const getText(
                                      title: "Exp. 5+ Years",
                                      size: 13,
                                      fontFamily: celiaRegular,
                                      color: ColorConstant.homeExp,
                                      fontWeight: FontWeight.w400),
                                ],
                              ),
                            ],
                          ),
                          Spacer(),
                          Align(
                            alignment: Alignment.center,
                            child: Container(
                              decoration: BoxDecoration(
                                  borderRadius: BorderRadius.circular(50),
                                  color: const Color(0xffE9FCF0)),
                              height: 40,
                              width: 40,
                              child: Padding(
                                padding: const EdgeInsets.all(12.0),
                                child: Image.asset(
                                  AppImages.homePhone,
                                  color: ColorConstant.greenColor,
                                ),
                              ),
                            ),
                          ),
                        ],
                      ),
                      const SizedBox(height: 6,),
                      Row(
                        children: [
                          SizedBox(
                              height: 12,
                              width: 12,
                              child: Image.asset(
                                AppImages.ruppesExp,
                                color: ColorConstant.blackColor,
                              )),
                          const SizedBox(
                            width: 5,
                          ),
                          getText(
                              title: "1 / min",
                              size: 13,
                              fontFamily: celiaMedium,
                              color: ColorConstant.blackColor,
                              fontWeight: FontWeight.w400),
                          const Spacer(),
                          const getText(
                              title: "Astrologer",
                              size: 13  ,
                              fontFamily: celiaMedium,
                              color: ColorConstant.drawerColour,
                              fontWeight: FontWeight.w400),
                        ],
                      )
                    ],
                  ),
                )
              ],
            ),
          ),
        ),
      ),
    );
  }

  AppBar appBar(BuildContext context, Function() onTap) {
    return AppBar(
      backgroundColor: ColorConstant.commonColor,
      elevation: 0,
      leadingWidth: 30,
      automaticallyImplyLeading: false,
      actions: [
        Padding(
          padding: const EdgeInsets.only(left: 25),
          child: GestureDetector(
            behavior: HitTestBehavior.opaque,
            onTap: () {
              controller.scaffoldKey.currentState!.openDrawer();
            },
            child: Container(
              height: 25,
              width: 25,
              alignment: Alignment.center,
              child: Image.asset(
                AppImages.drawerIcon,
                color: Colors.white,
                height: 20,
                width: 20,
              ),
            ),
          ),
        ),
        Spacer(),
        Padding(
          padding: EdgeInsets.only(right: 15),
          child: Container(
            decoration: BoxDecoration(
                color: Colors.transparent,
                border: Border.all(
                  color: Colors.white,
                ),
                borderRadius: BorderRadius.circular(7)),
            padding: const EdgeInsets.only(left: 10, right: 10),
            margin: const EdgeInsets.only(top: 12, bottom: 12),
            child: Row(
              children: [
                Image.asset(
                  AppImages.walletIcon,
                  width: 20,
                  height: 16,
                ),
                ScreenSize.width(7.13),
                getText(
                    title: '₹565',
                    size: 14,
                    fontFamily: celiaRegular,
                    color: ColorConstant.white,
                    fontWeight: FontWeight.w400)
              ],
            ),
          ),
        ),
      ],
      centerTitle: true,
    );
  }
}
