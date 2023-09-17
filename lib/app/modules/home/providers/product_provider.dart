import 'dart:developer';
import 'package:get/get.dart';
import '../../../model/product_model.dart';

class ProductProvider extends GetConnect {
  @override
  void onInit() {
    httpClient.baseUrl = 'https://debug.qartsolutions.com/api/';
    httpClient.defaultContentType = 'application/json';
    super.onInit();
  }
  Future<ProductModel> getProduct() async {
    final response = await get('product/GetProductsWithSizes?retailerCode=40984');
    return productModelFromJson(errorHandler(response));
  }
  String errorHandler(Response response) {
    switch (response.statusCode) {
      case 200:
      case 201:
      case 202:
        if(response.bodyString != null){
          log("👍👍👍👍 API CALLED");
          return response.bodyString!;
        }
        throw "No Data found";
      case 500:
        throw "Server Error pls retry later";
      case 403:
        throw 'Error occurred pls check internet and retry.';
      default:
        throw 'Error occurred retry ${response.statusCode}';
    }
  }

}
