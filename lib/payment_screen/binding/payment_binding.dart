import 'package:get/get.dart';
import 'package:new_mantra/payment_screen/controller/payment_controller.dart';


class PaymentBinding extends Bindings {
  @override
  void dependencies() {
    Get.put(PaymentController());
  }
}
