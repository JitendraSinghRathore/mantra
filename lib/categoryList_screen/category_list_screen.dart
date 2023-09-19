import 'package:flutter/services.dart';
import 'package:get/get.dart';
import 'package:flutter/material.dart';
import 'package:new_mantra/helper/custombtn_new.dart';
import 'package:new_mantra/helper/customtextfield.dart';
import 'package:new_mantra/utils/constants.dart';
import 'package:new_mantra/utils/validation.dart';
import '../config/routes.dart';
import '../helper/appbar.dart';
import '../helper/appimage.dart';
import '../helper/custombtn.dart';
import '../helper/getText.dart';
import '../utils/color_constant.dart';
import '../utils/screensize.dart';
import '../utils/size_config.dart';
import 'controller/category_list_controller.dart';

class CategoryList extends GetView<CategoryListController> {
  const CategoryList({key});

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
              alignment: Alignment.centerRight,
              child: GestureDetector(
                  onTap: () {
                    Get.back();
                  },
                  child: Image.asset(
                    AppImages.backIcon,
                    height: 28,
                    width: 28,
                  ))),
        ),
        title: getText(
            title: "Category List",
            size: 17,
            fontFamily: celiaMedium,
            color: ColorConstant.blackColor,
            fontWeight: FontWeight.w400),
        centerTitle: false,
      ),
      body: Column(
        children: [
          Padding(
            padding: const EdgeInsets.all(8.0),
            child: SizedBox(
              height: 42,
              child: ListView.builder(
                  shrinkWrap: true,
                  scrollDirection: Axis.horizontal,
                  itemCount: 10,
                  itemBuilder: (BuildContext context, int index) {
                    return  GestureDetector(
                      onTap: () {
                        controller.selectedAddressType.value = index;
                      },
                      child: tabBarCategory(index),
                    );
                  }),
            ),
          ),
          Expanded(child: Container(
            color: ColorConstant.homeBackground,
              child: categoryList())),

        ],
      ),
    );
  }

  Widget tabBarCategory(int index) {
    return Obx(()=>
      Container(
        padding: const EdgeInsets.symmetric(
          horizontal: 25,
        ),
        decoration: BoxDecoration(
            borderRadius: BorderRadius.circular(50),
            color: controller.selectedAddressType.value == index
                ? ColorConstant.commonColor
                : ColorConstant.cardBack),
        margin: const EdgeInsets.only(right: 14),
        child: Center(
          child: Text(
            "Category 1",
            style: TextStyle(
                color: controller.selectedAddressType.value == index
                    ? ColorConstant.white
                    : Colors.black,
                fontSize: 13,
                fontWeight: FontWeight.w500),
          ),
        ),
      ),
    );
  }

  Widget noData(BuildContext context) {
    return SizedBox(
      height:MediaQuery.of(context).size.height/1.5,
      child: Column(
        mainAxisAlignment: MainAxisAlignment.center,
        crossAxisAlignment: CrossAxisAlignment.center,
        children: [
          GestureDetector(
              onTap: () {
                Get.back();
              },
              child: Image.asset(
                AppImages.noDataCategory,
                height: 180,
                width: 162,
              )),
          const SizedBox(height: 30),
          getText(
              title: "No Result Found",
              size: 24,
              fontFamily: celiaRegular,
              color: ColorConstant.blackColor,
              fontWeight: FontWeight.w400),
          const SizedBox(height: 10),
          SizedBox(
            width: MediaQuery.of(context).size.width - 30,
            child:  const Expanded(
              child: Text(
                "Lorem Ipsum is simply dummy text of the printing and typesetting industry.",
                style: TextStyle(fontSize: 14.0,
                    color: ColorConstant.noData,
                    fontWeight: FontWeight.w300,
                  fontFamily: celiaRegular,
                ),

                textAlign: TextAlign.center,
              ),
            ),
          ),
          const SizedBox(height: 30),
          CustomBtn(
              title: "Back",
              height: 50,
              width: MediaQuery.of(context).size.width/3,
              color: ColorConstant.c3Color,
              onTap: () {

              }),
        ],
      ),
    );
  }

  Widget categoryList()
  {
    return Padding(
      padding: const EdgeInsets.only(left: 10, top: 5),
      child: ListView.builder(
          shrinkWrap: true,
          itemCount: 15,

          itemBuilder: (BuildContext context, int index) {
            return astrologersCardData(context);
          }),
    );
  }
  astrologersCardData(BuildContext context) {
    return GestureDetector(
      onTap: ()
      {
        Get.toNamed(AppRoutes.categoryDetailsScreen);
      },
      child: Padding(
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
      ),
    );
  }

}
