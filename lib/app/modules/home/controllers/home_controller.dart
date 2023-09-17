import 'package:get/get.dart';

import '../../../data/hive/product_hive.dart';
import '../../../model/product_model.dart';
import '../../../utils/constant.dart';
import '../providers/product_provider.dart';

class HomeController extends GetxController  {
  RxInt productCount = 0.obs;
  RxList<Product> productList = <Product>[].obs;

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
  void onReady() {
    super.onReady();
  }

  @override
  void onClose() {
    super.onClose();
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
