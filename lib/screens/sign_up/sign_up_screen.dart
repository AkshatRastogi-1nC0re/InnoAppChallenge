import 'package:flutter/material.dart';

import '../../size_config.dart';
import 'components/body.dart';

class SignUpScreen extends StatelessWidget {
  static String routeName = "/sign_up";
  @override
  Widget build(BuildContext context) {
    return Scaffold(
      backgroundColor: Color(0xffffefc6),
      appBar: AppBar(
        backgroundColor: Color(0xffffefc6),
        title: Text(
          "Sign Up",
          style: TextStyle(
            fontSize: getProportionateScreenWidth(18),
          ),
        ),
      ),
      body: Body(),
    );
  }
}
