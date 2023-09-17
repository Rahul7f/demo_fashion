import 'package:demo_fashion/app/model/product_model.dart';
import 'package:get/get.dart';

import '../../../data/hive/product_hive.dart';

class ProductController extends GetxController {
  Rx<Product?> product = Product().obs;
  RxList<Product> productList = <Product>[].obs;

  @override
  void onInit() {
    super.onInit();
    fetchProductFromCache();
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
  Future<void> fetchProductFromCache() async {
    ProductModel data =  await ProductBox.getProduct();
    productList.value = data.products??[];
  }
}
