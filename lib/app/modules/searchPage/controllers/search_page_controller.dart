import 'package:flutter/cupertino.dart';
import 'package:flutter/services.dart';
import 'package:get/get.dart';

import '../../../data/hive/product_hive.dart';
import '../../../model/product_model.dart';
import '../../../utils/constant.dart';
import '../../home/providers/product_provider.dart';

class SearchPageController extends GetxController {
  RxList<Product> productList = <Product>[].obs;
  RxList<Product> searchedProduct = <Product>[].obs;
  RxInt productCount = 0.obs;
  RxString? searchQuery = "".obs; // The search query
  TextEditingController searchController = TextEditingController();

  @override
  void onInit() {
    fetchProductFromCache();
    super.onInit();
  }

  @override
  void onClose() {
    super.onClose();
  }

   searchProducts(String? query) {
    query = query?.toUpperCase();
     searchedProduct.clear();
     productCount.value = 0;
     if(query == null || query.isEmpty || query.trim()==""){
       return;
     }
    for (Product product in productList) {
      if (query == null ||
          (product.qrCode != null && product.qrCode!.contains(query)) ||
          (product.option != null && product.option!.contains(query))) {
        searchedProduct.add(product);
      }
    }
    productCount.value = searchedProduct.length;
  }

  Future<void> fetchProductFromCache() async {
    ProductModel data =  await ProductBox.getProduct();
    printInfo(info: "fetchProduct: ${data.products?.length}");
    productList.value = data.products??[];
  }
}
