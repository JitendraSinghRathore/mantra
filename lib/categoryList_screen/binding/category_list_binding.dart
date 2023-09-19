import 'package:get/get.dart';
import '../controller/category_list_controller.dart';
class CategoryListBinding extends Bindings {
  @override
  void dependencies() {
    Get.put(CategoryListController());
  }
}
