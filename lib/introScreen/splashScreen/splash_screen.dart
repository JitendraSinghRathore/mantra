import 'package:flutter/material.dart';
import 'package:get/get.dart';

import '../../helper/appimage.dart';
import 'controller/splash_controller.dart';

class SplashScreen extends GetView<SplashController> {
  const SplashScreen({key});

  @override
  Widget build(BuildContext context) {

    return Scaffold(
        body: Container(
            child: Column(
          children: [
            Expanded(
              child: SizedBox(
                  height: MediaQuery.of(context).size.height,
                  width: MediaQuery.of(context).size.width,
                  child: Image.asset(
                    fit: BoxFit.cover,
                    AppImages.splashOne,
                  )),
            ),
            Expanded(
              child: SizedBox(
                  height: MediaQuery.of(context).size.height,
                  width: MediaQuery.of(context).size.width,
                  child: Image.asset(
                    AppImages.splashCenter,
                  )),
            ),
            Expanded(
              child: SizedBox(
                  height: MediaQuery.of(context).size.height,
                  width: MediaQuery.of(context).size.width,
                  child: Image.asset(
                    fit: BoxFit.cover,
                    AppImages.splashOne,
                  )),
            )
          ],
        )));
  }
}
