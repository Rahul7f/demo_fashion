import 'package:demo_fashion/app/model/product_model.dart';
import 'package:demo_fashion/app/utils/constant.dart';
import 'package:flutter/material.dart';
import 'package:flutter_staggered_grid_view/flutter_staggered_grid_view.dart';

import 'package:get/get.dart';
import 'package:like_button/like_button.dart';

import '../../../routes/app_pages.dart';
import '../controllers/home_controller.dart';

class HomeView extends GetView<HomeController> {
  const HomeView({Key? key}) : super(key: key);

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(
        backgroundColor: Colors.red,
        title: const Text('Qart Solutions'),
        actions: [
          // Navigate to the Search Screen
          IconButton(
              onPressed: () => Get.toNamed(Routes.SEARCH_PAGE),
              icon: const Icon(Icons.search))
        ],
      ),
      body: Obx(() => controller.productCount.value == 0
          ? const Center(child: CircularProgressIndicator())
          : RefreshIndicator(
              onRefresh: () async {
                controller.productList.value = [];
                controller.productCount.value = 0;
                controller.fetchProduct();
              },
              child: Padding(
                padding: const EdgeInsets.symmetric(horizontal: 10),
                child: Center(
                  child: Column(
                      mainAxisAlignment: MainAxisAlignment.start,
                      crossAxisAlignment: CrossAxisAlignment.start,
                      children: [
                        const SizedBox(
                          height: 10,
                        ),
                        Text(
                          'Total Products: ${controller.productCount}',
                        ),
                        const SizedBox(
                          height: 10,
                        ),
                        Expanded(
                          child: SingleChildScrollView(
                            child: StaggeredGrid.count(
                              crossAxisCount: 2,
                              mainAxisSpacing: 4,
                              crossAxisSpacing: 4,
                              children: controller.productList
                                  .map((element) => productCard(element))
                                  .toList(),
                            ),
                          ),
                        ),
                      ]),
                ),
              ),
            )),
    );
  }
}
