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

class DetailScreen extends StatefulWidget {
  static String routeName = "/details";
  @override
  _DetailScreenState createState() => _DetailScreenState();
}

class _DetailScreenState extends State<DetailScreen> {
  bool firsttime = false;
  bool maintenance = false;
  bool updateAvailable = false;

  checkInitial() async {
    ProductServices _services = ProductServices();
    DocumentSnapshot check = await _services.initialChecks.get();
    PackageInfo packageInfo = await PackageInfo.fromPlatform();

    String version = packageInfo.version;

    if (version != check["currentVersion"] && check["updateAvailable"]) {
      updateAvailable = true;
    }

    maintenance = check["maintenance"];

    if (updateAvailable) {
      Navigator.push(
        context,
        MaterialPageRoute(
            builder: (context) => UpdateAvailable(
                  value: "Download Now",
                  bottomNavigation: false,
                )),
      );
    } else if (maintenance) {
      Navigator.push(
        context,
        MaterialPageRoute(
            builder: (context) => UpdateAvailable(
                  value: "Come Back Soon",
                  bottomNavigation: false,
                )),
      );
    }
  }

  @override
  void initState() {
    firsttime = true;
    checkInitial();
    super.initState();
  }

  DateTime backbuttonpressedTime;

  @override
  Widget build(BuildContext context) {
    return SafeArea(
      child: Scaffold(
        body: Body(),
      ),
    );
  }
}
