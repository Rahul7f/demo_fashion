import 'package:get/get.dart';
import 'package:hive/hive.dart';

import '../../model/product_model.dart';

class ProductBox{
  static getProduct(){
    return Hive.box("productBox").get("products", defaultValue: null);
  }
  static Future<ProductModel> putProduct(ProductModel data) async {
    await Hive.box("productBox").put("products", data);
    return getProduct();
  }

}
