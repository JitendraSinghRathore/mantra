
import 'package:flutter/material.dart';
import 'package:get/get.dart';
import 'package:new_mantra/config/routes.dart';
import 'package:new_mantra/forgotPassword_screen/binding/forgotPassword_binding.dart';
import 'package:new_mantra/forgotPassword_screen/forgotPassword_screen.dart';
import 'package:new_mantra/home_screen/homescreen.dart';
import 'package:new_mantra/register_account_screen/binding/createAccount_binding.dart';
import 'package:new_mantra/select_type_screen/binding/select_binding_type.dart';
import 'package:new_mantra/select_type_screen/select_type_screen.dart';
import 'package:new_mantra/splashScreen/binding/splash_binding.dart';

import '../home_screen/binding/home_binding.dart';
import '../login_screen/binding/login_binding.dart';
import '../login_screen/login_screen.dart';
import '../register_account_screen/createAccount_screen.dart';
import '../splashScreen/splash_screen.dart';


class AppPages {
  static var initialRoute = AppRoutes.splash;

  static List<GetPage> pages = [
    GetPage(
        name: AppRoutes.splash,
        page: () => const SplashScreen(),
        binding: SplashBinding(),
        curve: Curves.easeInOut,
        transitionDuration: const Duration(milliseconds: 50),
        transition: Transition.fade),

    GetPage(
        name: AppRoutes.selectTypeScreen,
        page: () => const SelectTypeScreen(),
        binding: SelectTypeBinding(),
        curve: Curves.easeInOut,
        transitionDuration: const Duration(milliseconds: 50),
        transition: Transition.fade),

    GetPage(
        name: AppRoutes.loginScreen,
        page: () => const LoginScreen(),
        binding: LoginBinding(),
        curve: Curves.easeInOut,
        transitionDuration: const Duration(milliseconds: 50),
        transition: Transition.fade),

    GetPage(
        name: AppRoutes.forgotPasswordScreen,
        page: () => const ForgotPasswordScreen(),
        binding: ForgotPasswordBinding(),
        curve: Curves.easeInOut,
        transitionDuration: const Duration(milliseconds: 50),
        transition: Transition.fade),

    GetPage(
        name: AppRoutes.registerAccountScreen,
        page: () => const RegisterAccountScreen(),
        binding: RegisterAccountBinding(),
        curve: Curves.easeInOut,
        transitionDuration: const Duration(milliseconds: 50),
        transition: Transition.fade),

    GetPage(
        name: AppRoutes.homeScreen,
        page: () => const HomeScreen(),
        binding: HomeBinding(),
        curve: Curves.easeInOut,
        transitionDuration: const Duration(milliseconds: 50),
        transition: Transition.fade),



  ];
}
