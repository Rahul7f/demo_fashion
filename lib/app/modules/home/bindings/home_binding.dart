import 'package:get/get.dart';

import '../controllers/home_controller.dart';
import '../providers/product_provider.dart';

class HomeBinding extends Bindings {
  @override
  void dependencies() {
    Get.lazyPut<HomeController>(
      () => HomeController(),
    );
    Get.lazyPut<ProductProvider>(
          () => ProductProvider(),
    );
  }
}
