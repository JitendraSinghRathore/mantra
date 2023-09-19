
import 'package:flutter/material.dart';
import 'package:get/get.dart';
import 'package:new_mantra/category_details_screen/binding/category_details_binding.dart';
import 'package:new_mantra/category_details_screen/category_details_screen.dart';
import 'package:new_mantra/change_password_screen/change_password_screen.dart';
import 'package:new_mantra/config/routes.dart';

import 'package:new_mantra/help_screen/binding/help_binding.dart';
import 'package:new_mantra/help_screen/help_screen.dart';
import 'package:new_mantra/payment_screen/payment_screen.dart';
import 'package:new_mantra/profile_screen/binding/profile_binding.dart';

import '../authenticationScreen/forgotPassword_screen/binding/forgotPassword_binding.dart';
import '../authenticationScreen/forgotPassword_screen/forgotPassword_screen.dart';
import '../authenticationScreen/login_screen/binding/login_binding.dart';
import '../authenticationScreen/login_screen/login_screen.dart';
import '../authenticationScreen/register_account_screen/binding/createAccount_binding.dart';
import '../authenticationScreen/register_account_screen/createAccount_screen.dart';
import '../categoryList_screen/binding/category_list_binding.dart';
import '../categoryList_screen/category_list_screen.dart';
import '../change_password_screen/binding/changePassword_binding.dart';

import '../homeScreen/dashboard_screen/binding/dashboard_binding.dart';
import '../homeScreen/dashboard_screen/dashboard_screen.dart';
import '../homeScreen/home_screen/binding/home_binding.dart';
import '../homeScreen/home_screen/homescreen.dart';
import '../introScreen/splashScreen/binding/splash_binding.dart';
import '../introScreen/splashScreen/splash_screen.dart';
import '../introScreen/type_screen/binding/type_binding.dart';
import '../introScreen/type_screen/type_screen.dart';
import '../payment_screen/binding/payment_binding.dart';
import '../profile_screen/profile_screen.dart';
import '../wallet_screen/binding/wallet_binding.dart';
import '../wallet_screen/wallet_screen.dart';

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

    GetPage(
        name: AppRoutes.walletScreen,
        page: () => const WalletScreen(),
        binding: WalletBinding(),
        curve: Curves.easeInOut,
        transitionDuration: const Duration(milliseconds: 50),
        transition: Transition.fade),

    GetPage(
        name: AppRoutes.dashboardScreen,
        page: () => const DashboardScreen(),
        binding: DashboardBinding(),
        curve: Curves.easeInOut,
        transitionDuration: const Duration(milliseconds: 50),
        transition: Transition.fade),

    GetPage(
        name: AppRoutes.profileScreen,
        page: () => const ProfileScreen(),
        binding: ProfileBinding(),
        curve: Curves.easeInOut,
        transitionDuration: const Duration(milliseconds: 50),
        transition: Transition.fade),

    GetPage(
        name: AppRoutes.changePasswordScreen,
        page: () => const ChangePasswordScreen(),
        binding: ChangePasswordBinding(),
        curve: Curves.easeInOut,
        transitionDuration: const Duration(milliseconds: 50),
        transition: Transition.fade),

    GetPage(
        name: AppRoutes.paymentScreen,
        page: () => const PaymentScreen(),
        binding: PaymentBinding(),
        curve: Curves.easeInOut,
        transitionDuration: const Duration(milliseconds: 50),
        transition: Transition.fade),

    GetPage(
        name: AppRoutes.homeScreen,
        page: () => const helpScreen(),
        binding: helpBinding(),
        curve: Curves.easeInOut,
        transitionDuration: const Duration(milliseconds: 50),
        transition: Transition.fade),

    GetPage(
        name: AppRoutes.categoryListScreen,
        page: () => const CategoryList(),
        binding: CategoryListBinding (),
        curve: Curves.easeInOut,
        transitionDuration: const Duration(milliseconds: 50),
        transition: Transition.fade),

    GetPage(
        name: AppRoutes.categoryDetailsScreen,
        page: () => const CategoryDetailScreen(),
        binding: CategoryDetailBinding (),
        curve: Curves.easeInOut,
        transitionDuration: const Duration(milliseconds: 50),
        transition: Transition.fade),

    GetPage(
        name: AppRoutes.typeScreen,
        page: () => const TypeScreen(),
        binding: TypeBinding(),
        curve: Curves.easeInOut,
        transitionDuration: const Duration(milliseconds: 50),
        transition: Transition.fade),



  ];
}
