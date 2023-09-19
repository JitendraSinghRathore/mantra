import 'package:flutter/services.dart';
import 'package:get/get.dart';
import 'package:flutter/material.dart';
import 'package:new_mantra/config/routes.dart';
import 'package:new_mantra/helper/appimage.dart';
import 'package:new_mantra/utils/color_constant.dart';
import 'package:new_mantra/utils/constants.dart';

import '../helper/custombtn.dart';
import '../helper/customtextfield.dart';
import '../helper/getText.dart';
import '../utils/screensize.dart';
import '../widget/drawerwidget.dart';
import 'controller/category_details_controller.dart';

class CategoryDetailScreen extends GetView<CategoryDetailController> {
  const CategoryDetailScreen({key});

  @override
  Widget build(BuildContext context) {
    SystemChrome.setSystemUIOverlayStyle(const SystemUiOverlayStyle(
        statusBarColor: Colors.transparent,
        statusBarBrightness: Brightness.light));
    return Scaffold(
      backgroundColor: ColorConstant.homeBackground,
      key: controller.scaffoldKey,
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

      ),
      body: SingleChildScrollView(
        child: Column(
          mainAxisAlignment: MainAxisAlignment.start,
          crossAxisAlignment: CrossAxisAlignment.center,
          children: [
            Column(
              mainAxisAlignment: MainAxisAlignment.start,
              crossAxisAlignment: CrossAxisAlignment.start,
              children: [
                ///heading Screen
                SizedBox(
                  height: MediaQuery.of(context).size.height/2.9,
                  child: Padding(
                    padding: const EdgeInsets.only(left: 15,right: 15),
                    child: SizedBox(
                      width: MediaQuery.of(context).size.width,
                      height: MediaQuery.of(context).size.height,
                      child: Stack(
                        fit: StackFit.loose,
                        children: [
                          ClipRRect(
                            borderRadius: BorderRadius.only(
                                topRight: Radius.circular(10.0),
                                topLeft: Radius.circular(10.0)),
                            child: SizedBox(
                                height: 200,
                                width: MediaQuery.of(context).size.width,
                                child: Image.asset(
                                  fit: BoxFit.fill,
                                  AppImages.categoryDetailsBack,
                                )),
                          ),

                          Positioned(
                            top: 170,
                            left: 10,
                            child: Stack(
                              children: [
                                Container(
                                    height: 70,
                                    width: 70,
                                    alignment: Alignment.center,
                                    decoration: BoxDecoration(
                                        shape: BoxShape.circle, color: ColorConstant.white),
                                    child: const CircleAvatar(
                                      radius: 48, // Image radius
                                      backgroundImage: AssetImage(
                                        AppImages.detailImg,
                                      ),
                                    )),

                                Positioned(
                                  right: 0,
                                  bottom: 0,
                                  child: Row(
                                    children: [
                                      Container(
                                        height: 20,
                                        width: 20,
                                        alignment: Alignment.center,
                                        decoration: BoxDecoration(
                                            shape: BoxShape.circle, color: ColorConstant.greenColor),
                                      ),
                                    ],
                                  ),
                                ),
                              ],
                            ),
                          ),
                          Positioned(
                            top: 210,
                            left: 100,
                            child: Stack(
                              children: [
                                Column(
                                  mainAxisAlignment: MainAxisAlignment.start,
                                  crossAxisAlignment: CrossAxisAlignment.start,
                                  children: [
                                    getText(
                                        title: "Sanjay B Jumaani.",
                                        size: 20,
                                        fontFamily: celiaMedium,
                                        color: ColorConstant.blackColor,
                                        fontWeight: FontWeight.w500),
                                    getText(
                                        title: "Astrologer",
                                        size: 15  ,
                                        fontFamily: celiaMedium,
                                        color: ColorConstant.homeExp  ,
                                        fontWeight: FontWeight.w500),
                                  ],
                                )

                              ],
                            ),
                          ),

                        ],
                      ),
                    ),
                  ),
                ),

                Padding(
                  padding: const EdgeInsets.only(left: 20,top: 0),
                  child: Row(
                    children: [
                      Container(
                        decoration: BoxDecoration(
                            borderRadius: BorderRadius.circular(50),
                            color:  ColorConstant.detailsBackCard,
                        ),
                        margin: const EdgeInsets.only(right: 14),
                        padding: const EdgeInsets.symmetric(
                            horizontal: 20, vertical: 12),
                        child: Row(
                          children: [
                            SizedBox(
                                height: 30,
                                width: 30,
                                child: Image.asset(
                                  AppImages.homeExp,
                                  color: ColorConstant.blackColor,
                                )),
                            const SizedBox(
                              width: 10,
                            ),
                             getText(
                                title: "Exp. 5+ Years",
                                size: 13,
                                fontFamily: celiaRegular,
                                color: ColorConstant.blackColor,
                                fontWeight: FontWeight.w600),
                          ],
                        ),
                      ),
                      Container(
                        decoration: BoxDecoration(
                          borderRadius: BorderRadius.circular(50),
                          color:  ColorConstant.detailsBackCard,
                        ),
                        margin: const EdgeInsets.only(right: 14),
                        padding: const EdgeInsets.symmetric(
                            horizontal: 30, vertical: 16),
                        child:  Row(
                          children: [
                            SizedBox(
                                height: 15,
                                width: 15,
                                child: Image.asset(
                                  AppImages.ruppesExp,
                                  color: ColorConstant.blackColor,
                                )),
                            const SizedBox(
                              width: 5,
                            ),
                            getText(
                                title: "1 / min",
                                size: 15,
                                fontFamily: celiaMedium,
                                color: ColorConstant.blackColor,
                                fontWeight: FontWeight.w600),

                          ],
                        )
                      ),
                    ],
                  ),
                ),
                Padding(
                  padding: const EdgeInsets.only(left: 15,right: 15,top: 20,bottom: 10),
                  child: Card(
                    elevation: 3,
                    shadowColor: Colors.black87,
                      shape: RoundedRectangleBorder(
                        borderRadius: BorderRadius.circular(10),
                        //set border radius more than 50% of height and width to make circle
                      ),
                    child: Padding(
                      padding: const EdgeInsets.only(left: 15,right: 15,top: 10,bottom: 20),
                      child: Column(
                        mainAxisAlignment: MainAxisAlignment.start,
                        crossAxisAlignment: CrossAxisAlignment.start,
                        children: [

                          Row(
                            mainAxisAlignment: MainAxisAlignment.start,
                            crossAxisAlignment: CrossAxisAlignment.start,
                            children: [
                              SizedBox(
                                  height: 30,
                                  width: 30,
                                  child: Icon(Icons.location_on_outlined)),
                              const SizedBox(
                                width: 20,
                              ),

                              Container(
                                width: MediaQuery.of(context).size.width/1.5,
                                child: Column(
                                  mainAxisAlignment: MainAxisAlignment.start,
                                  crossAxisAlignment: CrossAxisAlignment.start,
                                  children: [
                                    getText(
                                        title: "Location",
                                        size: 13,
                                        fontFamily: celiaRegular,
                                        color: ColorConstant.blackColor,
                                        fontWeight: FontWeight.w600),
                                    SizedBox(height: 5,),
                                    getText(
                                        title: "Goverdhan Colony, New Sanganer Road Sodala, Jaipur",
                                        size: 13,
                                        fontFamily: celiaRegular,
                                        color: Color(0xff6D6D6D),
                                        fontWeight: FontWeight.w500),
                                  ],
                                ),
                              )

                            ],
                          ),
                          SizedBox(height: 5,),
                          const Divider(
                            color: Colors.grey,
                          ),
                          SizedBox(height: 5,),

                          Row(
                            mainAxisAlignment: MainAxisAlignment.start,
                            crossAxisAlignment: CrossAxisAlignment.start,
                            children: [
                              SizedBox(
                                  height: 30,
                                  width: 30,
                                  child: Icon(Icons.language)),
                              const SizedBox(
                                width: 20,
                              ),

                              Container(
                                width: MediaQuery.of(context).size.width/1.5,
                                child: Column(
                                  mainAxisAlignment: MainAxisAlignment.start,
                                  crossAxisAlignment: CrossAxisAlignment.start,
                                  children: [
                                    getText(
                                        title: "Language Spoken",
                                        size: 13,
                                        fontFamily: celiaRegular,
                                        color: ColorConstant.blackColor,
                                        fontWeight: FontWeight.w600),
                                    SizedBox(height: 5,),
                                    getText(
                                        title: "Hindi English",
                                        size: 13,
                                        fontFamily: celiaRegular,
                                        color: Color(0xff6D6D6D),
                                        fontWeight: FontWeight.w500),
                                  ],
                                ),
                              )

                            ],
                          ),
                          SizedBox(height: 5,),
                          const Divider(
                            color: Colors.grey,
                          ),
                          SizedBox(height: 5,),


                          Row(
                            mainAxisAlignment: MainAxisAlignment.start,
                            crossAxisAlignment: CrossAxisAlignment.start,
                            children: [
                              SizedBox(
                                  height: 30,
                                  width: 30,
                                  child: Image.asset(AppImages.homeExp,color: Colors.black,)),
                              const SizedBox(
                                width: 20,
                              ),

                              Container(
                                width: MediaQuery.of(context).size.width/1.5,
                                child: Column(
                                  mainAxisAlignment: MainAxisAlignment.start,
                                  crossAxisAlignment: CrossAxisAlignment.start,
                                  children: [
                                    getText(
                                        title: "Experties",
                                        size: 13,
                                        fontFamily: celiaRegular,
                                        color: ColorConstant.blackColor,
                                        fontWeight: FontWeight.w600),
                                    SizedBox(height: 5,),
                                    getText(
                                        title: "Test",
                                        size: 13,
                                        fontFamily: celiaRegular,
                                        color: Color(0xff6D6D6D),
                                        fontWeight: FontWeight.w500),
                                  ],
                                ),
                              )

                            ],
                          ),
                          SizedBox(height: 5,),
                          const Divider(
                            color: Colors.grey,
                          ),
                          SizedBox(height: 5,),

                          Row(
                            mainAxisAlignment: MainAxisAlignment.start,
                            crossAxisAlignment: CrossAxisAlignment.start,
                            children: [
                              SizedBox(
                                  height: 30,
                                  width: 30,
                                  child: Icon(Icons.person_rounded)),
                              const SizedBox(
                                width: 20,
                              ),

                              Container(
                                width: MediaQuery.of(context).size.width/1.5,
                                child: Column(
                                  mainAxisAlignment: MainAxisAlignment.start,
                                  crossAxisAlignment: CrossAxisAlignment.start,
                                  children: [
                                    getText(
                                        title: "Language Spoken",
                                        size: 13,
                                        fontFamily: celiaRegular,
                                        color: ColorConstant.blackColor,
                                        fontWeight: FontWeight.w600),
                                    SizedBox(height: 5,),
                                    getText(
                                        title: "Hindi English",
                                        size: 13,
                                        fontFamily: celiaRegular,
                                        color: Color(0xff6D6D6D),
                                        fontWeight: FontWeight.w500),
                                  ],
                                ),
                              )

                            ],
                          ),
                          SizedBox(height: 5,),






                        ],
                      ),
                    ),
                  ),
                ),

                Padding(
                  padding: const EdgeInsets.only(left: 15,right: 15,top: 20,bottom: 10),
                  child: CustomBtn(
                      title: "Call",
                      height: 50,
                      width: double.infinity,
                      color: ColorConstant.commonColor,
                      onTap: () {

                      }),
                )


              ],
            ),
          ],
        ),
      ),
    );
  }
}
