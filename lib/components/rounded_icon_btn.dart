import 'package:flutter/material.dart';

import '../size_config.dart';

class RoundedIconBtn extends StatelessWidget {
  const RoundedIconBtn({
    Key key,
    @required this.icon,
    @required this.press,
    this.showShadow = false,
    this.colour = Colors.white,
    this.width = 40.0,
    this.height = 40.0,
  }) : super(key: key);

  final Icon icon;
  final GestureTapCancelCallback press;
  final bool showShadow;
  final colour;
  final width;
  final height;

  @override
  Widget build(BuildContext context) {
    return Container(
      height: getProportionateScreenWidth(height),
      width: getProportionateScreenWidth(width),
      decoration: BoxDecoration(
        shape: BoxShape.circle,
        boxShadow: [
          if (showShadow)
            BoxShadow(
              offset: Offset(0, 6),
              blurRadius: 10,
              color: Color(0xFFB0B0B0).withOpacity(0.2),
            ),
        ],
      ),
      child: FlatButton(
        padding: EdgeInsets.zero,
        color: colour,
        shape: RoundedRectangleBorder(borderRadius: BorderRadius.circular(50)),
        onPressed: press,
        child: icon,
      ),
    );
  }
}
