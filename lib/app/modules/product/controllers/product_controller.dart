import 'package:demo_fashion/app/model/product_model.dart';
import 'package:get/get.dart';

class ProductController extends GetxController {
  Rx<Product?> product = Product().obs;
  @override
  void onInit() {
    super.onInit();
  }

  @override
  void onReady() {
    super.onReady();
  }

  @override
  void onClose() {
    super.onClose();
  }
  void setProduct(Product product) {
    this.product.value = product;
  }
}
