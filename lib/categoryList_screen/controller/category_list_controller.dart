import 'package:get/get.dart';
import '../../utils/size_config.dart';
class CategoryListController extends GetxController {
  RxInt selectedAddressType = (-1).obs;
  @override
  void onInit() {
    SizeConfig().init();
    selectedAddressType.value=0;
    super.onInit();
  }
}
