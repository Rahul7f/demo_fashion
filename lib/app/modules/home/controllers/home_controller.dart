import 'package:get/get.dart';

import '../../../data/hive/product_hive.dart';
import '../../../model/product_model.dart';
import '../../../utils/constant.dart';
import '../providers/product_provider.dart';

class HomeController extends GetxController  {
  RxInt productCount = 0.obs;
  RxString message = "".obs;
  RxInt status = 0.obs;
  RxList<Product> productList = <Product>[].obs;
  int ERROR = 2;
  int SUCCESS = 1;


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
    productList.value = [];
    productCount.value = 0;
    ProductProvider productProvider = Get.find<ProductProvider>();
    await productProvider.getProduct().then((value) async {
      ProductModel data =  await ProductBox.putProduct(value);
     printInfo(info: "fetchProduct: ${data.products?.length}");
      productCount.value = data.products?.length??0;
      productList.value = data.products??[];
      if(productList.isNotEmpty){
        status.value = 1;
        message.value = "SUCCESS";
      }else{
        status.value = 2;
        message.value = "Data not found";
      }
    }).catchError((onError){
      printInfo(info: "fetchProduct Error:  ${onError.toString()}");
      status.value = 2;
      message.value = "Data not found\n${onError.toString()}";
    });
  }
  Future<void> fetchProductFromCache() async {
    ProductModel data =  await ProductBox.getProduct();
    printInfo(info: "fetchProduct: ${data.products?.length}");
    productList.value = data.products??[];
    if(productList.isEmpty){
      status.value = 2;
      message.value = "Data not found";
    }
  }

}
