import 'package:flutter/cupertino.dart';
import 'package:flutter/material.dart';
import 'package:internet_connection_checker/internet_connection_checker.dart';
import 'package:like_button/like_button.dart';

import '../model/product_model.dart';

Future<bool> checkInternet() async {
  bool result = await InternetConnectionChecker().hasConnection;
  if (result == true) {
    return true;
  } else {
    return false;
  }
}

String rupeeSymbol = "\u{20B9}";

Container productCard(Product product) {
  return Container(
    margin: const EdgeInsets.all(10),
    width: double.infinity,
    decoration: BoxDecoration(
      color: Colors.white,
      boxShadow: [
        BoxShadow(
          color: Colors.grey.withOpacity(0.1),
          spreadRadius: 3,
          blurRadius: 7,
          offset: const Offset(0, 3),
        ),
      ],
      borderRadius: BorderRadius.circular(10),
    ),
    child: Column(
      crossAxisAlignment: CrossAxisAlignment.start,
      children: [
        ClipRRect(
          borderRadius: BorderRadius.only(
              topLeft: Radius.circular(10), topRight: Radius.circular(10)),
          child: Image.network(
            "${product.looksImageUrl ?? "https://assets.ajio.com/medias/sys_master/root/20230703/0tQU/64a2db8ca9b42d15c930f5d8/-473Wx593H-420434297-blue-MODEL.jpg"}",
            height: 200,
            width: double.maxFinite,
            fit: BoxFit.cover,
          ),
        ),
        const SizedBox(
          width: 15,
        ),
        Padding(
          padding: const EdgeInsets.all(8.0),
          child: Column(
            crossAxisAlignment: CrossAxisAlignment.start,
            children: [
              Row(
                children: [
                  Expanded(
                    child: Text(
                      "${product.name}",
                      style: const TextStyle(
                          fontWeight: FontWeight.bold, fontSize: 18),
                    ),
                  ),
                  const LikeButton()
                ],
              ),
              Text(
                "${product.subCategory}",
              ),
              const SizedBox(
                height: 5,
              ),
              const Text(
                "50% off",
                style: TextStyle(color: Colors.red, fontSize: 12),
              ),
              const SizedBox(
                height: 5,
              ),
              Row(
                children: [
                  Text(
                    actualPrice(product),
                    style: const TextStyle(
                        decoration: TextDecoration.lineThrough,
                        color: Colors.grey,
                        fontWeight: FontWeight.bold,
                        fontSize: 14),
                  ),
                  SizedBox(
                    width: 10,
                  ),
                  Text(
                    discountPrice(product),
                    style: const TextStyle(
                        color: Colors.black,
                        fontWeight: FontWeight.bold,
                        fontSize: 14),
                  ),
                ],
              ),
              SizedBox(
                height: 5,
              ),
              const Text(
                "EXPRESS DELIVERY",
                style: TextStyle(color: Colors.grey, fontSize: 10),
              ),
            ],
          ),
        ),
        const SizedBox(
          width: 5,
        ),
      ],
    ),
  );
}

Container searchProductCard(Product product) {
  return Container(
    margin: const EdgeInsets.all(10),
    width: double.infinity,
    decoration: BoxDecoration(
      color: Colors.white,
      boxShadow: [
        BoxShadow(
          color: Colors.grey.withOpacity(0.1),
          spreadRadius: 3,
          blurRadius: 7,
          offset: const Offset(0, 3),
        ),
      ],
      borderRadius: BorderRadius.circular(10),
    ),
    child: Row(
      crossAxisAlignment: CrossAxisAlignment.start,
      children: [
        ClipRRect(
          borderRadius: BorderRadius.only(
              topLeft: Radius.circular(10), topRight: Radius.circular(10)),
          child: Image.network(
            "${product.looksImageUrl ?? "https://assets.ajio.com/medias/sys_master/root/20230703/0tQU/64a2db8ca9b42d15c930f5d8/-473Wx593H-420434297-blue-MODEL.jpg"}",
            height: 70,
            width: 70,
            fit: BoxFit.cover,
          ),
        ),
        const SizedBox(
          width: 15,
        ),
        Padding(
          padding: const EdgeInsets.all(8.0),
          child: Column(
            crossAxisAlignment: CrossAxisAlignment.start,
            children: [
              Text(
                "${product.name}",
                style:
                    const TextStyle(fontWeight: FontWeight.bold, fontSize: 18),
              ),
              Text(
                "${product.subCategory}",
              ),
              const SizedBox(
                height: 5,
              ),
              Wrap(
                children: [
                  sizeBox(),
                  sizeBox(),
                  sizeBox(),
                  sizeBox(),
                ],
              )
            ],
          ),
        ),
        const SizedBox(
          width: 5,
        ),
      ],
    ),
  );
}

Container sizeBox() {
  return Container(
    padding: const EdgeInsets.all(5),
    margin: const EdgeInsets.all(5),
    decoration: BoxDecoration(
      border: Border.all(color: Colors.black, width: 1),
      color: Colors.grey.shade300,
      borderRadius: BorderRadius.circular(5),
    ),
    child: Text(
      "38",
    ),
  );
}

String actualPrice(Product product) {
  return "$rupeeSymbol ${product.mrp!}";
}

String discountPrice(Product product) {
  return "$rupeeSymbol ${product.mrp! - (product.mrp! * 0.5)}";
}
