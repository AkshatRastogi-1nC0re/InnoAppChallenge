import 'package:flutter/material.dart';
import 'package:orev/models/Varient.dart';

class OrderProduct {
  final String brandname;
  final String id;
  final String sellerId;
  final String title, detail;
  final Varient variant;
  final double tax;

  OrderProduct({
    @required this.brandname,
    @required this.id,
    @required this.sellerId,
    @required this.title,
    @required this.detail,
    @required this.variant,
    @required this.tax,
  });
}
