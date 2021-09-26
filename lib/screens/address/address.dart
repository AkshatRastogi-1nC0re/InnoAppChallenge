import 'package:flutter/material.dart';

import 'components/body.dart';

class Address extends StatelessWidget {
  static String routeName = "/Address";
  @override
  Widget build(BuildContext context) {
    return Scaffold(
      backgroundColor: Color(0xffffefc5),
      appBar: AppBar(
        backgroundColor: Color(0xffffefc5),
        title: Text("Registration Form"),
      ),
      body: Body(),
    );
  }
}
