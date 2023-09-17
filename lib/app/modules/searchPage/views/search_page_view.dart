import 'package:flutter/material.dart';
import 'package:flutter_staggered_grid_view/flutter_staggered_grid_view.dart';

import 'package:get/get.dart';

import '../../../utils/constant.dart';
import '../controllers/search_page_controller.dart';

class SearchPageView extends GetView<SearchPageController> {
  const SearchPageView({Key? key}) : super(key: key);
  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(
        // The search area here
          title: Container(
            width: double.infinity,
            height: 40,
            decoration: BoxDecoration(
                color: Colors.white, borderRadius: BorderRadius.circular(5)),
            child: Center(
              child: TextField(
                onChanged: (value) {

                  controller.searchProducts(value);
                },
                decoration: InputDecoration(
                    prefixIcon: const Icon(Icons.search),
                    suffixIcon: IconButton(
                      icon: const Icon(Icons.clear),
                      onPressed: () {
                       controller.searchController.clear();
                       controller.searchProducts("");
                      },
                    ),
                    hintText: 'Search...',
                    border: InputBorder.none),
                controller: controller.searchController,
              ),
            ),
          ),
        backgroundColor: Colors.red,
      ),
      body: Obx(() => controller.productCount.value == 0
          ? const Center(child: Text( "No data found.\nPlease enter a search query in the search box to search.",textAlign: TextAlign.center,))
          : Padding(
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
                      'Total Item Found: ${controller.productCount}',
                    ),
                    const SizedBox(
                      height: 10,
                    ),
                    Expanded(
                      child: ListView.builder(
                        itemCount: controller.productCount.value,
                        itemBuilder: (context, index) => searchProductCard(controller.searchedProduct[index]),),
                    ),
                  ]),
            ),
          )),
    );
  }
}
