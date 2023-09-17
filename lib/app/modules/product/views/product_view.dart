import 'package:demo_fashion/app/utils/constant.dart';
import 'package:flutter/material.dart';
import 'package:flutter_staggered_grid_view/flutter_staggered_grid_view.dart';

import 'package:get/get.dart';
import 'package:like_button/like_button.dart';

import '../controllers/product_controller.dart';

class ProductView extends GetView<ProductController> {
  const ProductView({Key? key}) : super(key: key);

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(
        backgroundColor: Colors.white,
        title: Obx(() => Text(
              controller.product.value?.brand ?? "",
              style: TextStyle(color: Colors.black),
            )),
        actions: [
          IconButton(onPressed: () => null, icon: const Icon(Icons.share)),
          const LikeButton(),
        ],
        iconTheme: const IconThemeData(color: Colors.black),
      ),
      body: Obx(() => SingleChildScrollView(
            child:
                Column(crossAxisAlignment: CrossAxisAlignment.start, children: [
              Stack(
                children: [
                  Image.network(sampleImage,
                      height: 500, width: double.infinity, fit: BoxFit.cover),
                  Positioned.fill(
                    child: Align(
                      alignment: Alignment.bottomRight,
                      child: Container(
                        margin: const EdgeInsets.all(10),
                        padding: const EdgeInsets.all(5),
                        decoration: BoxDecoration(
                          color: Colors.white,
                          borderRadius: BorderRadius.circular(10),
                        ),
                        child: Row(
                          mainAxisSize: MainAxisSize.min,
                          children: [
                            Text(
                              controller.product.value?.likeabilty.toString() ?? "",
                              style:  const TextStyle(
                                  color: Colors.black,
                                  fontWeight: FontWeight.bold,
                                  fontSize: 14
                              ),
                            ),
                            SizedBox(width: 5,),
                            Icon(Icons.star, color: Colors.green,size: 18,),
                            SizedBox(width: 5,),
                            const Text(
                              "|",
                              style:  TextStyle(
                                  color: Colors.black,
                                  fontWeight: FontWeight.bold,
                                  fontSize: 14
                              ),
                            ),
                            const SizedBox(width: 5,),
                            const Text(
                              "120",
                              style:  TextStyle(
                                  color: Colors.black,
                                  fontWeight: FontWeight.bold,
                                  fontSize: 14
                              ),
                            ),
                          ],
                        ),
                      ),
                    ),
                  )
                ],
              ),
              Padding(
                padding: const EdgeInsets.all(20),
                child: Column(
                    crossAxisAlignment: CrossAxisAlignment.start,
                    children: [
                      Row(
                        children: [
                          Text(
                            "${controller.product.value?.name} ",
                            style: const TextStyle(
                                fontWeight: FontWeight.bold, fontSize: 18),
                          ),
                          Text(
                            "${controller.product.value?.subCategory}",
                            style: const TextStyle(
                                fontWeight: FontWeight.normal, fontSize: 18),
                          ),
                        ],
                      ),
                      const SizedBox(
                        height: 5,
                      ),
                      Row(
                        children: [
                          Text(
                            actualPrice(controller.product.value!),
                            style: const TextStyle(
                                decoration: TextDecoration.lineThrough,
                                color: Colors.grey,
                                fontWeight: FontWeight.bold,
                                fontSize: 18),
                          ),
                          const SizedBox(
                            width: 10,
                          ),
                          Text(
                            discountPrice(controller.product.value!),
                            style: const TextStyle(
                                color: Colors.black,
                                fontWeight: FontWeight.bold,
                                fontSize: 18),
                          ),
                          SizedBox(
                            width: 10,
                          ),
                          const Text(
                            "50% off",
                            style: TextStyle(
                                color: Colors.red,
                                fontSize: 20,
                                fontWeight: FontWeight.bold),
                          ),
                        ],
                      ),
                      const Divider(
                        color: Colors.grey,
                        thickness: 1,
                      ),
                      Text(
                        "Size:",
                        style: TextStyle(fontWeight: FontWeight.bold),
                      ),
                      SizedBox(
                        height: 5,
                      ),
                      Wrap(
                        children: controller.product.value?.ean?.keys
                                .toList()
                                .map((e) => sizeBox(e))
                                .toList() ??
                            [],
                      ),
                      const SizedBox(height: 20,),
                      const Text("Product Details:",style: TextStyle(fontWeight: FontWeight.bold),),
                      const SizedBox(height: 20,),
                      StaggeredGrid.count(
                        crossAxisCount: 2,
                        mainAxisSpacing: 10,
                        crossAxisSpacing: 10,
                        children: [
                          infoCard("Color:", "${controller.product.value?.color}"),
                          infoCard("Brand:", "${controller.product.value?.brand}"),
                          infoCard("Mood:", controller.product.value?.mood??"--"),
                          infoCard("Gender:", controller.product.value?.gender??"--"),
                          infoCard("Theme:", controller.product.value?.theme??"--"),
                          infoCard("Category:", controller.product.value?.category??"--"),
                          infoCard("Option", controller.product.value?.option??"--"),
                          infoCard("Collection", controller.product.value?.collection??"--"),
                          infoCard("Fit", controller.product.value?.fit??"--"),
                          infoCard("QRCode", controller.product.value?.qrCode??"--"),
                          infoCard("Looks", controller.product.value?.looks??"--"),
                          infoCard("Fabric", controller.product.value?.fabric??"--"),
                          infoCard("Material", controller.product.value?.material??"--"),
                          infoCard("Quality", controller.product.value?.quality??"--"),


                        ],
                      )
                    ]),
              )
            ]),
          )),
    );
  }

  Widget infoCard(String title, String value) {
    return Column(crossAxisAlignment: CrossAxisAlignment.start, children: [
      Text(
        title,
        style: TextStyle(fontWeight: FontWeight.bold),
      ),
      const SizedBox(
        height: 5,
      ),
      Text(
        value,
        style: const TextStyle(fontWeight: FontWeight.normal),
      ),
      Divider(
        color: Colors.grey.shade400,
        thickness: 1,
      ),
    ]);
  }
}
