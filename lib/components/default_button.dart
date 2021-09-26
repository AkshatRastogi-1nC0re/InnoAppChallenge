import 'package:flutter/material.dart';

import '../constants.dart';
import '../size_config.dart';

class DefaultButton extends StatelessWidget {
  const DefaultButton({
    Key key,
    this.text,
    this.press,
    this.color=kPrimaryColor,
    this.height=56,
    this.textheight=18,
    this.colour=Colors.white,
  }) : super(key: key);
  final String text;
  final Function press;
  final Color color;
  final double height;
  final double textheight;
  final Color colour;

  @override
  Widget build(BuildContext context) {
    return SizedBox(
      width: double.infinity,
      height: getProportionateScreenHeight(height),
      child: FlatButton(
        shape: RoundedRectangleBorder(borderRadius: BorderRadius.circular(35)),
        color: color,
        onPressed: press,
        child: Text(
          text,
          style: TextStyle(
            fontSize: getProportionateScreenWidth(textheight),
            color: colour,
          ),
        ),
      ),
    );
  }
}
