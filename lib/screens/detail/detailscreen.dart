import 'dart:collection';

import 'package:card_swiper/card_swiper.dart';
import 'package:cloud_firestore/cloud_firestore.dart';
import 'package:flutter/material.dart';
import 'package:flutter/services.dart';
import 'package:fluttertoast/fluttertoast.dart';

import 'package:socialbennett/components/coustom_bottom_nav_bar.dart';
import 'package:socialbennett/components/updateavailablescreen.dart';
import 'package:socialbennett/services/product_services.dart';
import 'package:package_info_plus/package_info_plus.dart';

import '../../constants.dart';
import 'components/body.dart';
import "dart:math";

class DetailScreen extends StatefulWidget {
  static String routeName = "/details";
  Map dict;
  DetailScreen({this.dict});
  @override
  _DetailScreenState createState() => _DetailScreenState(dict: dict);
}

class _DetailScreenState extends State<DetailScreen> {
  Map dict;
  _DetailScreenState({this.dict});
  @override
  Widget build(BuildContext context) {
    return SafeArea(
      child: Scaffold(
        body: Body(dict: dict),
      ),
    );
  }
}
