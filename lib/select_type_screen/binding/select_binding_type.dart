import 'package:get/get.dart';
import '../controller/select_type_controller.dart';

class SelectTypeBinding extends Bindings{
  @override
  void dependencies() {
    Get.put(SelectTypeController());
    // TODO: implement dependencies
  }

}