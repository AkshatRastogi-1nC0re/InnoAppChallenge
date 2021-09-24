import 'package:flutter/material.dart';
import 'package:orev/models/Varient.dart';

class Product {
  final String brandname;
  final String id;
  final String sellerId;
  final String title, detail;
  final List<Varient> varients;
  final List<dynamic> youmayalsolike;
  final double rating;
  final double tax;
  final bool isFavourite, isPopular;

  Product({
    @required this.brandname,
    @required this.id,
    @required this.sellerId,
    @required this.title,
    @required this.detail,
    this.rating = 0.0,
    this.isFavourite = false,
    this.isPopular = false,
    @required this.varients,
    @required this.youmayalsolike,
    @required this.tax,
  });
}

// Our demo Products

List<Product> demoProducts = [
  Product(
      id: "1",
      brandname: "Organic Tattva",
      varients: [
        Varient(
          default_product: false,
          isOnSale: true,
          comparedPrice: 100,
          discountPercentage: 11,
          price: 89,
          inStock: true,
          qty: 50,
          title: "5 kg",
          images: [
            "assets/images/ps4_console_white_1.png",
            "assets/images/ps4_console_white_2.png",
          ],
        ),
        Varient(
          id: "aaaaa",
          default_product: true,
          isOnSale: true,
          comparedPrice: 5000,
          discountPercentage: 90,
          price: 500,
          inStock: true,
          qty: 50,
          title: "10 kg",
          images: [
            "assets/images/ps4_console_white_1.png",
            "assets/images/ps4_console_white_2.png",
            "assets/images/ps4_console_white_3.png",
          ],
        ),
        Varient(
          id: "aaaaa",
          default_product: false,
          isOnSale: true,
          comparedPrice: 10000,
          discountPercentage: 90,
          price: 1000,
          inStock: true,
          qty: 50,
          title: "20 kg",
          images: [
            "assets/images/ps4_console_white_1.png",
            "assets/images/ps4_console_white_2.png",
            "assets/images/ps4_console_white_3.png",
            "assets/images/ps4_console_white_4.png",
          ],
        )
      ],
      title: "Wireless Controller for PS4™",
      detail: description,
      rating: 4.8,
      isFavourite: true,
      isPopular: true,
      tax: 10,
      youmayalsolike: ["uygfkhj", "sdfdsf", "sdfsdfsd"]),
  // Product(
  //   id: "2",
  //   brandname: "Organic Tattva",
  //   images: [
  //     "assets/images/Image Popular Product 2.png",
  //   ],
  //   colors: [
  //     Color(0xFFF6625E),
  //     Color(0xFF836DB8),
  //     Color(0xFFDECB9C),
  //     Colors.white,
  //   ],
  //   title: "Nike Sport White - Man Pant",
  //   price: 50.5,
  //   description: description,
  //   rating: 4.1,
  //   isPopular: true,
  // ),
  // Product(
  //   id: "3",
  //   brandname: "Organic Tattva",
  //   images: [
  //     "assets/images/glap.png",
  //   ],
  //   colors: [
  //     Color(0xFFF6625E),
  //     Color(0xFF836DB8),
  //     Color(0xFFDECB9C),
  //     Colors.white,
  //   ],
  //   title: "Gloves XC Omega - Polygon",
  //   price: 36.55,
  //   description: description,
  //   rating: 4.1,
  //   isFavourite: true,
  //   isPopular: true,
  // ),
  // Product(
  //   id: "4",
  //   brandname: "Organic Tattva",
  //   images: [
  //     "assets/images/wireless headset.png",
  //   ],
  //   colors: [
  //     Color(0xFFF6625E),
  //     Color(0xFF836DB8),
  //     Color(0xFFDECB9C),
  //     Colors.white,
  //   ],
  //   title: "Logitech Head",
  //   price: 20.20,
  //   description: description,
  //   rating: 4.1,
  //   isFavourite: true,
  //   isPopular: true,
  // ),
];
//
const String description =
    "Wireless Controller for PS4™ gives you what you want in your gaming from over precision control your games to sharingover precision control your games to sharingover precision control your games to sharingover precision control your games to sharingvover precision control your games to sharingvvvover precision control your games to sharingover precision control your games to sharingover precision control your games to sharing";
