import 'package:flutter/services.dart';
import 'package:get/get.dart';
import 'package:flutter/material.dart';
import 'package:new_mantra/utils/constants.dart';
import '../helper/appimage.dart';
import '../helper/getText.dart';
import '../utils/color_constant.dart';
import '../utils/screensize.dart';
import 'controller/payment_controller.dart';

class PaymentScreen extends GetView<PaymentController> {
  const PaymentScreen({key});

  @override
  Widget build(BuildContext context) {
    SystemChrome.setSystemUIOverlayStyle(const SystemUiOverlayStyle(
        statusBarColor: Colors.black45,
        statusBarIconBrightness: Brightness.light
        //color set to transperent or set your own color
        ));
    return Scaffold(
      backgroundColor: Color(0xffF6F6F6),
      body: SingleChildScrollView(
        child: Column(
          mainAxisAlignment: MainAxisAlignment.start,
          crossAxisAlignment: CrossAxisAlignment.center,
          children: [
            viewResult(context)
          ],
        ),
      ),
    );
  }

  viewResult(BuildContext context) {
    return Container(
      child: Obx(()=>
     Column(
          children: [
            tabBar(),
            ScreenSize.height(5),
            controller.tabBarIndex.value == 0
                ?  Padding(
              padding: const EdgeInsets.only(left: 10, top: 5),
              child: ListView.builder(
                  shrinkWrap: true,
                  itemCount: 15,
                  physics: NeverScrollableScrollPhysics(),
                  itemBuilder: (BuildContext context, int index) {
                    return Padding(
                      padding: const EdgeInsets.only(
                        top: 10   ,
                        left: 10,
                        right: 10,
                      ),
                      child: SizedBox(
                        width: MediaQuery.of(context).size.width,
                        child: Card(
                          shape: RoundedRectangleBorder(
                            borderRadius: BorderRadius.circular(10),
                            //set border radius more than 50% of height and width to make circle
                          ),
                          child: Column(
                            crossAxisAlignment: CrossAxisAlignment.start,
                            children: [
                              Padding(
                                padding: const EdgeInsets.only(left: 15, right: 15, top: 0, bottom: 5),
                                child: Column(
                                  children: [
                                    Row(
                                      children: [
                                        getText(
                                            title: "Sanjay B Jumanji.",
                                            size: 16,
                                            fontFamily: celiaMedium,
                                            color: ColorConstant.blackColor,
                                            fontWeight: FontWeight.w500),
                                      ],
                                    ),
                                    const SizedBox(height: 10,),
                                    Row(
                                      children: [
                                        SizedBox(
                                            height: 15,
                                            width: 15,
                                            child: Image.asset(
                                              AppImages.cal,
                                              color: ColorConstant.homeExp,
                                            )),
                                        const SizedBox(
                                          width: 10,
                                        ),
                                        const getText(
                                            title: "Fri. 30, Sep 2021 06:08 pm",
                                            size: 13,
                                            fontFamily: celiaRegular,
                                            color: ColorConstant.homeExp,
                                            fontWeight: FontWeight.w400),
                                        Spacer(),

                                        GestureDetector(
                                            behavior: HitTestBehavior.opaque,
                                            onTap: ()
                                            {

                                            },
                                            child: SizedBox(
                                              height: 15,
                                              width: 15,
                                              child: Image.asset(
                                                AppImages.dropdown,
                                                color: ColorConstant.homeExp,
                                              ),)
                                        ),
                                      ],
                                    ),
                                    const SizedBox(height: 10,),
                                    Row(
                                      children: [
                                        SizedBox(
                                            height: 12,
                                            width: 12,
                                            child: Image.asset(
                                              AppImages.ruppesExp,
                                              color: ColorConstant.blackColor ,
                                            )),

                                        GestureDetector(
                                          onTap: ()
                                          {

                                          },
                                          child: getText(
                                              title: "25",
                                              size: 13,
                                              fontFamily: celiaMedium,
                                              color: ColorConstant.blackColor,
                                              fontWeight: FontWeight.w400),
                                        ),
                                      ],
                                    ),
                                    const SizedBox(height: 10,),


                                  ],
                                ),
                              ),

                              Container(
                                decoration: const BoxDecoration(
                                    color: ColorConstant.cardBack,
                                    borderRadius: BorderRadius.only(
                                        bottomLeft: Radius.circular(10),
                                        bottomRight: Radius.circular(10)
                                    )
                                ),

                                child: Padding(
                                  padding: const EdgeInsets.only(left: 15, right: 10, bottom: 5,top: 5),
                                  child: Row(
                                    children: [
                                      Expanded(child:  Column(
                                        crossAxisAlignment: CrossAxisAlignment.start,
                                        children: [
                                          const getText(
                                              title: "Call Duraction",
                                              size: 14,
                                              fontFamily: celiaRegular,
                                              color: ColorConstant.buttonBorder,
                                              fontWeight: FontWeight.w500),
                                          SizedBox(height: 3,),
                                          getText(
                                              title: "2 Mins",
                                              size: 15,
                                              fontFamily: celiaMedium,
                                              color: ColorConstant.blackColor,
                                              fontWeight: FontWeight.w600),
                                        ],
                                      )),
                                      Expanded(child:  Column(
                                        crossAxisAlignment: CrossAxisAlignment.start,
                                        children: [
                                          const getText(
                                              title: "Rate Expeart",
                                              size: 14,
                                              fontFamily: celiaRegular,
                                              color: ColorConstant.buttonBorder,
                                              fontWeight: FontWeight.w500),
                                          const SizedBox(height: 3,),
                                          getText(
                                              title: "Rate Expeart",
                                              size: 15,
                                              fontFamily: celiaMedium,
                                              color: ColorConstant.blackColor,
                                              fontWeight: FontWeight.w600),
                                        ],
                                      )),


                                    ],
                                  ),
                                ),
                              )
                            ],
                          ),
                        ),
                      ),
                    );
                  }),
            )
                : payment()
          ],
        ),
      ),
    );
  }

  tabBar() {
    return SizedBox(
      height: 55,
      child: Padding(
        padding: const EdgeInsets.only(top: 8,bottom: 8),
        child: Row(
          children: [
            Expanded(
              child: Obx(
                () => GestureDetector(
                  behavior: HitTestBehavior.opaque,
                  onTap: () {
                    controller.tabBarIndex.value = 0;
                  },
                  child: Column(
                    children: [
                      getText(
                          title: 'Consultaion',
                          size: 16,
                          fontFamily: celiaRegular,
                          color: ColorConstant.blackColor,
                          fontWeight: FontWeight.w700),
                      ScreenSize.height(11),
                      Container(
                        height: 3,
                        width: double.infinity,
                        decoration: BoxDecoration(
                            color: controller.tabBarIndex.value == 0
                                ? ColorConstant.lightBlueColor
                                : ColorConstant.white,
                            borderRadius: BorderRadius.circular(6)),
                      )
                    ],
                  ),
                ),
              ),
            ),
            Expanded(
              child: Obx(
                () => GestureDetector(
                  behavior: HitTestBehavior.opaque,
                  onTap: () {
                    controller.tabBarIndex.value = 1;
                  },
                  child: Column(
                    children: [
                      getText(
                          title: 'Payment',
                          size: 16,
                          fontFamily: celiaRegular,
                          color: ColorConstant.blackColor,
                          fontWeight: FontWeight.w700),
                      ScreenSize.height(11),
                      Container(
                        height: 3,
                        width: double.infinity,
                        decoration: BoxDecoration(
                            color: controller.tabBarIndex.value == 1
                                ? ColorConstant.lightBlueColor
                                : ColorConstant.white,
                            borderRadius: BorderRadius.circular(6)),
                      )
                    ],
                  ),
                ),
              ),
            )
          ],
        ),
      ),
    );
  }
  payment() {
    return Padding(
      padding: const EdgeInsets.only(left: 10, top: 0),
      child: Container(
        child: ListView.builder(
            shrinkWrap: true,
            itemCount: 15,
            physics: NeverScrollableScrollPhysics(),
            itemBuilder: (BuildContext context, int index) {
              return paymentCardData(context);
            }),
      ),
    );
  }
}
paymentCardData(BuildContext context) {
  return Padding(
    padding: const EdgeInsets.only(
      top: 10   ,
      left: 10,
      right: 10,
    ),
    child: SizedBox(
      width: MediaQuery.of(context).size.width,
      child: Card(
        shape: RoundedRectangleBorder(
          borderRadius: BorderRadius.circular(10),
          //set border radius more than 50% of height and width to make circle
        ),
        child: Column(
          crossAxisAlignment: CrossAxisAlignment.start,
          children: [
            Padding(
              padding: const EdgeInsets.only(left: 15, right: 15, top: 5, bottom: 5),
              child: Column(
                children: [
                  Row(
                    children: [
                      getText(
                          title: "Sanjay B Jumaani.",
                          size: 16,
                          fontFamily: celiaMedium,
                          color: ColorConstant.blackColor,
                          fontWeight: FontWeight.w500),
                      Spacer(),
                      Row(
                        children: [
                          SizedBox(
                              height: 12,
                              width: 12,
                              child: Image.asset(
                                AppImages.ruppesExp,
                                color: ColorConstant.greenColor ,
                              )),
                          const SizedBox(
                            width: 2,
                          ),
                          getText(
                              title: "250",
                              size: 13,
                              fontFamily: celiaRegular,
                              color: ColorConstant.greenColor,
                              fontWeight: FontWeight.w400),
                        ],
                      ),
                    ],
                  ),
                  const SizedBox(height: 10,),
                  Row(
                    children: [
                      SizedBox(
                          height: 15,
                          width: 15,
                          child: Image.asset(
                            AppImages.cal,
                            color: ColorConstant.homeExp,
                          )),
                      const SizedBox(
                        width: 10,
                      ),
                      const getText(
                          title: "Fri. 30, Sep 2021 06:08 pm",
                          size: 13,
                          fontFamily: celiaRegular,
                          color: ColorConstant.homeExp,
                          fontWeight: FontWeight.w400),
                      Spacer(),
                      SizedBox(
                          height: 15,
                          width: 15,
                          child: Image.asset(
                            AppImages.dropdown,
                            color: ColorConstant.homeExp,
                          )),
                    ],
                  ),

                  const SizedBox(height: 10,),


                ],
              ),
            ),

            Container(
              decoration: const BoxDecoration(
                   color: ColorConstant.cardBack,
                  borderRadius: BorderRadius.only(
                    bottomLeft: Radius.circular(10),
                    bottomRight: Radius.circular(10)
                  )
              ),

              child: Padding(
                padding: const EdgeInsets.only(left: 15, right: 10, bottom: 5,top: 5),
                child: Row(
                  children: [
                    Expanded(child:  Column(
                      crossAxisAlignment: CrossAxisAlignment.start,
                      children: [
                        const getText(
                            title: "Order ID",
                            size: 14,
                            fontFamily: celiaRegular,
                            color: ColorConstant.buttonBorder,
                            fontWeight: FontWeight.w500),
                        SizedBox(height: 3,),
                        getText(
                            title: "#251",
                            size: 15,
                            fontFamily: celiaMedium,
                            color: ColorConstant.blackColor,
                            fontWeight: FontWeight.w600),
                      ],
                    )),
                    Expanded(child:  Column(
                      crossAxisAlignment: CrossAxisAlignment.start,
                      children: [
                        const getText(
                            title: "Type",
                            size: 14,
                            fontFamily: celiaRegular,
                            color: ColorConstant.buttonBorder,
                            fontWeight: FontWeight.w500),
                        SizedBox(height: 3,),
                        getText(
                            title: "Talktime",
                            size: 15,
                            fontFamily: celiaMedium,
                            color: ColorConstant.blackColor,
                            fontWeight: FontWeight.w600),
                      ],
                    )),
                    Expanded(child:  Column (
                      crossAxisAlignment: CrossAxisAlignment.start,
                      children: [
                        const getText(
                            title: "Credited",
                            size: 14,
                            fontFamily: celiaRegular,
                            color: ColorConstant.buttonBorder,
                            fontWeight: FontWeight.w500),
                        SizedBox(height: 3,),
                        Row(
                          children: [
                            SizedBox(
                                height: 12,
                                width: 12,
                                child: Image.asset(
                                  AppImages.ruppesExp,
                                  color: ColorConstant.blackColor ,
                                )),

                            getText(
                                title: "250",
                                size: 13,
                                fontFamily: celiaMedium,
                                color: ColorConstant.blackColor,
                                fontWeight: FontWeight.w400),
                          ],
                        ),
                      ],
                    ))


                  ],
                ),
              ),
            )
          ],
        ),
      ),
    ),
  );
}

