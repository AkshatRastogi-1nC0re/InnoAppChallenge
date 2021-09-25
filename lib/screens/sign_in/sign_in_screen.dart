import 'package:flutter/material.dart';
import 'package:socialbennett/constants.dart';
import 'package:socialbennett/constants.dart';

import '../../size_config.dart';
import 'components/body.dart';

class SignInScreen extends StatefulWidget {
  const SignInScreen({
    Key key,
    this.snackbar = false,
  }) : super(key: key);
  final bool snackbar;
  static String routeName = "/sign_in";

  @override
  _SignInScreenState createState() => _SignInScreenState(snackbar: snackbar);
}

class _SignInScreenState extends State<SignInScreen> {
  _SignInScreenState({
    this.snackbar = false,
  });
  final bool snackbar;

  @override
  void initState() {
    super.initState();
    if (snackbar) {
      Future(() {
        final snackBar = SnackBar(
          content: Text('Password Updated'),
          backgroundColor: kPrimaryColor,
        );
        ScaffoldMessenger.of(context).showSnackBar(snackBar);
      });
    }

    // Shows the SnackBar as soon as this page is opened.
  }

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      backgroundColor: Color(0xffffefc6),
      appBar: AppBar(
        backgroundColor: Color(0xffffefc6),
        title: Text(
          "Sign In",
          style: TextStyle(
            color: kPrimaryTextColor,
            fontSize: getProportionateScreenWidth(18),
          ),
        ),
      ),
      body: Body(),
    );
  }
}
