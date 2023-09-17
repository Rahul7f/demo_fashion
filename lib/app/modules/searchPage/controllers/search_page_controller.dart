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

  @override
  void onInit() {
    checkInternet().then((value){
      if(value){
        fetchProduct();
      }else{
        fetchProductFromCache();
      }
    });
    fetchProduct();
    super.onInit();
  }


  @override
  void onClose() {
    super.onClose();
  }

   searchProducts(List<Product> products, String? query) {
    List<Product> result = [];
    for (Product product in products) {
      if (query == null ||
          (product.qrCode != null && product.qrCode!.contains(query)) ||
          (product.option != null && product.option!.contains(query))) {
        result.add(product);
      }
    }
    searchedProduct.value =  result;
  }
  Future<void> fetchProduct() async {
    ProductProvider productProvider = Get.find<ProductProvider>();
    await productProvider.getProduct().then((value) async {
      ProductModel data =  await ProductBox.putProduct(value);
      printInfo(info: "fetchProduct: ${data.products?.length}");
      productCount.value = data.products?.length??0;
      productList.value = data.products??[];
    }).catchError((onError){
      printInfo(info: "fetchProduct Error:  ${onError.toString()}");
    });
  }
  Future<void> fetchProductFromCache() async {
    ProductModel data =  await ProductBox.getProduct();
    printInfo(info: "fetchProduct: ${data.products?.length}");
    productList.value = data.products??[];
  }
}
