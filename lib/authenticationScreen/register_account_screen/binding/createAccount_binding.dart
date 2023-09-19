import 'package:get/get.dart';

import '../controller/createAccount_controller.dart';

class RegisterAccountBinding extends Bindings {
  @override
  void dependencies() {
    Get.put(RegisterAccountController());
  }
}
