import 'package:flutter/material.dart';
import 'package:lottie/lottie.dart';
import 'package:socialbennett/components/default_button.dart';
import 'package:socialbennett/screens/home/home_screen.dart';
import 'package:socialbennett/size_config.dart';

class Body extends StatefulWidget {
  @override
  _BodyState createState() => _BodyState();
}

class _BodyState extends State<Body> {
  @override
  void initState() {
    new Future.delayed(const Duration(seconds: 3), () {
      Navigator.pushReplacementNamed(context, HomeScreen.routeName);
    });
    super.initState();
  }

  @override
  Widget build(BuildContext context) {
    return Container(
      color:Color(0xffffefc5),
      child: Lottie.asset("assets/animation/success.json", repeat: false),
    );
  }
}
