import 'package:flutter/material.dart';

import '../../size_config.dart';
import 'components/body.dart';

class ForgotPasswordScreen extends StatelessWidget {
  static String routeName = "/forgot_password";
  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(
        title: Text("Forgot Password",style: TextStyle(
          fontSize: getProportionateScreenWidth(18),
        ),),
      ),
      body: Body(),
    );
  }
}
