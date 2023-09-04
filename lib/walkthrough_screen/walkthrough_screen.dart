import 'package:flutter/material.dart';
import 'package:flutter/services.dart';
import 'package:get/get.dart';
import 'package:get/get_core/src/get_main.dart';
import 'package:new_mantra/config/routes.dart';
import 'package:new_mantra/helper/appimage.dart';
import 'package:new_mantra/helper/getText.dart';

import '../utils/color_constant.dart';
import '../utils/constants.dart';

class OnboardingScreen extends StatefulWidget {
  const OnboardingScreen({super.key});

  @override
  _OnboardingScreenState createState() => _OnboardingScreenState();
}

class _OnboardingScreenState extends State<OnboardingScreen> {
  PageController _pageController = PageController(initialPage: 0);
  int _currentPage = 0;

  final List<OnboardingData> _onboardingData = [
    OnboardingData(
      image1: AppImages.slideBackOne,
      image2: AppImages.slideOneImage,
      title1: 'First Consultation',
      title2: 'Only RS. 1',
      title3: "Hurry! Consult with Indi's best\nastrologers NOW",
    ),
    OnboardingData(
      image1: AppImages.slideBackTwo,
      image2: AppImages.slideTwoImage,
      title1: 'Meet Your',
      title2: 'Astros!',
      title3:
          "Access India's most trusted astrologers, tarot readers & Vaastu experts instantly.",
    ),
    OnboardingData(
      image1: AppImages.slideBackThree,
      image2: AppImages.slideThreeImage,
      title1: 'Consult',
      title2: '24/7',
      title3:
          'Talk to our astrologers at any time \nof the day or night. No waiting.',
    ),
  ];

  @override
  Widget build(BuildContext context) {
    SystemChrome.setSystemUIOverlayStyle(const SystemUiOverlayStyle(
        statusBarColor: Colors.transparent,
        statusBarIconBrightness: Brightness.dark));
    return Scaffold(
      body: Stack(
        children: [
          Align(
            alignment: Alignment.bottomCenter,
            //height: MediaQuery.of(context).size.height,
            child: PageView.builder(
              controller: _pageController,
              itemCount: _onboardingData.length,
              onPageChanged: (index) {
                setState(() {
                  _currentPage = index;
                });
              },
              itemBuilder: (context, index) {
                return Center(
                  child: OnboardingPage(
                    data: _onboardingData[index],
                  ),
                );
              },
            ),
          ),
          Align(
            alignment: Alignment.topRight,
            child: Padding(
              padding: const EdgeInsets.all(48.0),
              child: getText(
                size: 14,
                color: ColorConstant.blackColor,
                fontFamily: celiaRegular,
                fontWeight: FontWeight.w600,
                title: 'Skip',
              ),
            ),
          ),
          Align(
            alignment: Alignment.bottomRight,
            child: Row(
              mainAxisAlignment: MainAxisAlignment.end,
              children: [
                GestureDetector(
                  behavior: HitTestBehavior.opaque,
                  onTap: () {
                    setState(() {});
                    _currentPage == _onboardingData.length - 1
                        ? Get.toNamed(AppRoutes.selectTypeScreen)
                        : _pageController.jumpToPage(_currentPage + 1);
                  },
                  child: Align(
                    alignment: Alignment.bottomRight,
                    child: Padding(
                      padding: const EdgeInsets.only(right: 50, bottom: 75),
                      child: getText(
                        size: 14,
                        color: ColorConstant.blackColor,
                        fontFamily: celiaRegular,
                        fontWeight: FontWeight.w600,
                        title: _currentPage == _onboardingData.length - 1
                            ? "Get Started"
                            : 'Next',
                      ),
                    ),
                  ),
                ),
                const SizedBox(),
                GestureDetector(
                  onTap: ()
                  {
                    setState(() {});
                    _currentPage == _onboardingData.length - 1
                        ? Get.toNamed(AppRoutes.selectTypeScreen)
                        : _pageController.jumpToPage(_currentPage + 1);
                  },
                  child: Align(
                    alignment: Alignment.bottomRight,
                    child: Padding(
                      padding: const EdgeInsets.only(right: 20, bottom: 66),
                      child: Image.asset(
                        AppImages.sliderNext,
                        height: 45,
                        fit: BoxFit.fill,
                        width: 45,
                      ),
                    ),
                  ),
                ),
              ],
            ),
          ),
          Padding(
            padding: const EdgeInsets.only(left: 30, bottom: 70),
            child: Align(
              alignment: Alignment.bottomLeft,
              child: Padding(
                padding: const EdgeInsets.only(bottom: 16.0),
                child: Row(
                  mainAxisAlignment: MainAxisAlignment.start,
                  children: _buildPageIndicator(),
                ),
              ),
            ),
          ),
        ],
      ),
    );
  }

  List<Widget> _buildPageIndicator() {
    List<Widget> indicators = [];
    for (int i = 0; i < _onboardingData.length; i++) {
      indicators.add(
        Row(
          children: [
            Container(
              margin: EdgeInsets.symmetric(horizontal: 4.0),
              height: 8.0,
              width: 8.0,
              decoration: BoxDecoration(
                shape: BoxShape.circle,
                color: _currentPage == i ? ColorConstant.naviBlue : Colors.grey,
              ),
            ),
          ],
        ),
      );
    }
    return indicators;
  }

  @override
  void dispose() {
    _pageController.dispose();
    super.dispose();
  }
}

class OnboardingData {
  final String image1;
  final String image2;
  final String title1;
  final String title2;
  final String title3;

  OnboardingData(
      {required this.image1,
      required this.image2,
      required this.title1,
      required this.title2,
      required this.title3});
}

class OnboardingPage extends StatelessWidget {
  final OnboardingData data;

  OnboardingPage({required this.data});

  @override
  Widget build(BuildContext context) {
    return Center(
      child: Stack(
        children: [
          Image.asset(
            data.image1,
            height: MediaQuery.of(context).size.height,
            fit: BoxFit.fill,
            width: MediaQuery.of(context).size.height,
          ),
          Padding(
            padding: const EdgeInsets.only(left: 30),
            child: Align(
              alignment: Alignment.centerLeft,
              child: Column(
                mainAxisAlignment: MainAxisAlignment.center,
                crossAxisAlignment: CrossAxisAlignment.start,
                children: [
                  Image.asset(
                    data.image2,
                    height: 100,
                  ),
                  const SizedBox(height: 25.0),
                  getText(
                      title: data.title1,
                      size: 18,
                      fontFamily: celiaRegular,
                      color: ColorConstant.blackColor,
                      fontWeight: FontWeight.w600),
                  const SizedBox(
                    height: 5,
                  ),
                  getText(
                      title: data.title2,
                      size: 19,
                      fontFamily: celiaBold,
                      color: ColorConstant.naviBlue,
                      fontWeight: FontWeight.w500),
                  const SizedBox(
                    height: 4,
                  ),
                  getText(
                      title: data.title3,
                      size: 14,
                      fontFamily: celiaRegular,
                      color: ColorConstant.blackColor,
                      fontWeight: FontWeight.w600),
                ],
              ),
            ),
          )
        ],
      ),
    );
  }
}
