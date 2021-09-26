import 'package:flutter/material.dart';

import 'components/body.dart';

class LoginSuccessScreen extends StatelessWidget {
  static String routeName = "/login_success";
  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(
        leading: SizedBox(),
      ),
      body: Body(),
    );
  }
}
