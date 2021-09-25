import 'package:flutter/material.dart';
import 'package:lottie/lottie.dart';
import '../../../constants.dart';
import '../../../size_config.dart';

class SplashContent extends StatelessWidget {
  const SplashContent({
    Key key,
    this.text,
    this.image,
    this.anim
  }) : super(key: key);
  final String text, image,anim;

  @override
  Widget build(BuildContext context) {
    return Column(
      children: <Widget>[
        Spacer(),
        Text(
          "Bennett Hub",
          style: TextStyle(
            fontSize: getProportionateScreenWidth(36),
            color: Color(0xff212f44),
            fontWeight: FontWeight.bold,
          ),
        ),
        Text(
          text,
          textAlign: TextAlign.center,
        ),
        Spacer(flex: 2),
        anim==""?Image.asset(
          image,
          height: getProportionateScreenHeight(265),
          width: getProportionateScreenWidth(235),
        ):Container(
            height: getProportionateScreenHeight(265),
            width: getProportionateScreenWidth(235),
            child: Lottie.asset(anim)),

      ],
    );
  }
}
