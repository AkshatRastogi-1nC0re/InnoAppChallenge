import 'package:flutter/material.dart';

import 'Product.dart';
import 'Product.dart';

class Cart {
  final Product product;
  final int numOfItem;
  final int actualVarientNumber;
  final String varientNumber;
  final bool deliverable;
  final bool codAvailable;
  final double deliveryCharges;
  final double codCharges;
  final double distanceInMeters;
  final double freekms;
  final double variantPrice;

  Cart({
    @required this.product,
    @required this.numOfItem,
    @required this.varientNumber,
    @required this.deliverable,
    @required this.codAvailable,
    @required this.deliveryCharges,
    @required this.codCharges,
    @required this.distanceInMeters,
    @required this.freekms,
    @required this.variantPrice,
    @required this.actualVarientNumber,
  });
}

// Demo data for our cart

List<Cart> demoCarts = [
  Cart(product: demoProducts[0], numOfItem: 2),
  Cart(product: demoProducts[0], numOfItem: 2),
  Cart(product: demoProducts[0], numOfItem: 2),
];
