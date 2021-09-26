import 'dart:async';

import 'package:flutter/material.dart';
import 'package:socialbennett/components/custom_surfix_icon.dart';
import 'package:socialbennett/components/form_error.dart';
import 'package:socialbennett/helper/keyboard.dart';
import 'package:socialbennett/providers/auth_provider.dart';
import 'package:socialbennett/screens/address/address.dart';
import 'package:socialbennett/screens/forgot_password/forgot_password_screen.dart';
import 'package:socialbennett/screens/home/home_screen.dart';
import 'package:socialbennett/screens/login_success/login_success_screen.dart';
import 'package:firebase_auth/firebase_auth.dart';
import 'package:socialbennett/services/user_services.dart';
import 'package:socialbennett/services/user_simple_preferences.dart';

import '../../../components/default_button.dart';
import '../../../constants.dart';
import '../../../constants.dart';
import '../../../size_config.dart';
import 'package:provider/provider.dart';
import 'package:flutter_easyloading/flutter_easyloading.dart';
import 'package:rounded_loading_button/rounded_loading_button.dart';

class SignForm extends StatefulWidget {
  @override
  _SignFormState createState() => _SignFormState();
}

class _SignFormState extends State<SignForm> {
  final _formKey = GlobalKey<FormState>();
  String number;
  String password;
  bool remember = false;
  List<String> errors = [];

  void addError({String error}) {
    if (!errors.contains(error))
      setState(() {
        errors.add(error);
      });
  }

  void removeError({String error}) {
    if (errors.contains(error))
      setState(() {
        errors.remove(error);
      });
  }

  final RoundedLoadingButtonController _btnController =
      RoundedLoadingButtonController();

  @override
  Widget build(BuildContext context) {
    final _auth = Provider.of<AuthProvider>(context);
    UserServices _userServices = UserServices();
    return Form(
      key: _formKey,
      child: Column(
        children: [
          buildPhoneFormField(),
          SizedBox(height: getProportionateScreenHeight(10)),
          buildPasswordFormField(),
          SizedBox(height: getProportionateScreenHeight(30)),
          Row(
            children: [
              Transform.scale(
                scale: getProportionateScreenHeight(1.1),
                child: Checkbox(
                  value: remember,
                  activeColor: kPrimaryTextColor,
                  onChanged: (value) {
                    setState(() {
                      remember = value;
                    });
                  },
                ),
              ),
              Text(
                "Remember me",
                style: TextStyle(fontSize: getProportionateScreenWidth(13)),
              ),
            ],
          ),
          FormError(errors: errors),
          SizedBox(height: getProportionateScreenHeight(20)),
          RoundedLoadingButton(
            successColor: kPrimaryColor,
            duration: Duration(milliseconds: 1300),
            width: getProportionateScreenWidth(500),
            height: getProportionateScreenHeight(56),
            color: kPrimaryTextColor,
            child: Text(" Continue ",
                style: TextStyle(
                    fontSize: getProportionateScreenWidth(18),
                    color: Colors.white)),
            controller: _btnController,
            onPressed: () async {
              print(errors);
              errors = [];
              if (_formKey.currentState.validate()) {
                _formKey.currentState.save();
                KeyboardUtil.hideKeyboard(context);
                Navigator.pushNamed(context, LoginSuccessScreen.routeName);

                // try {
                //   await _auth.signIn(
                //     email: number + "@orev.user",
                //     password: password,
                //   );
                //   if (_auth.firebaseAuthException != null) {
                //     throw (_auth.firebaseAuthException);
                //   }
                //   String emailuid = _auth.user.uid;
                //   UserSimplePreferences.setAuthKey(emailuid);
                //   Navigator.pushNamed(context, LoginSuccessScreen.routeName);
                // } catch (e) {
                //   _btnController.error();
                //   if (e.code == 'user-not-found') {
                //     setState(() {
                //       addError(error: kUserNotFoundError);
                //     });
                //   } else if (e.code == 'wrong-password') {
                //     setState(() {
                //       addError(error: kPassWrongError);
                //     });
                //   } else if (e.code == 'network-request-failed') {
                //     setState(() {
                //       addError(error: kFirebaseNetworkError);
                //     });
                //   } else {
                //     setState(() {
                //       addError(error: ksomethingerror);
                //     });
                //   }
                //   _auth.firebaseAuthException = null;
                //   Timer(Duration(milliseconds: 1300), () {
                //     _btnController.reset();
                //   });
                // }
              } else {
                _btnController.error();
                Timer(Duration(milliseconds: 1300), () {
                  _btnController.reset();
                });
              }
            },
          ),
        ],
      ),
    );
  }

  Container buildPasswordFormField() {
    return Container(
      height: getProportionateScreenHeight(80),
      child: TextFormField(
        style: TextStyle(
          fontSize: getProportionateScreenWidth(16),
        ),
        obscureText: true,
        onSaved: (newValue) => password = newValue,
        onChanged: (value) {
          if (value.isNotEmpty) {
            removeError(error: kPassNullError);
          }
          if (value.length >= 8) {
            removeError(error: kShortPassError);
          }
          return null;
        },
        validator: (value) {
          if (value.isEmpty) {
            addError(error: kPassNullError);
            return "";
          } else if (value.length < 8) {
            addError(error: kShortPassError);
            return "";
          }
          return null;
        },
        decoration: InputDecoration(
          labelStyle: TextStyle(
            fontSize: getProportionateScreenWidth(15),
          ),
          hintStyle: TextStyle(
            fontSize: getProportionateScreenWidth(16),
          ),
          labelText: "Password",
          hintText: "Enter your password",
          // If  you are using latest version of flutter then lable text and hint text shown like this
          // if you r using flutter less then 1.20.* then maybe this is not working properly
          floatingLabelBehavior: FloatingLabelBehavior.always,
          suffixIcon: CustomSurffixIcon(svgIcon: "assets/icons/Lock.svg"),
        ),
      ),
    );
  }

  Container buildPhoneFormField() {
    return Container(
      height: getProportionateScreenHeight(116),
      child: TextFormField(
        style: TextStyle(
          fontSize: getProportionateScreenWidth(16),
        ),
        maxLength: 10,
        keyboardType: TextInputType.phone,
        onSaved: (newValue) => number = newValue,
        onChanged: (value) {
          if (value.isNotEmpty) {
            removeError(error: kPhoneNumberNullError);
          }
          if (value.length == 10) {
            removeError(error: kShortNumberError);
            removeError(error: kLongNumberError);
          }
          return null;
        },
        validator: (value) {
          if (value.isEmpty) {
            addError(error: kPassNullError);
            return "";
          } else if (value.length < 10) {
            addError(error: kShortNumberError);

            return "";
          } else if (value.length > 10) {
            addError(error: kLongNumberError);

            return "";
          }

          return null;
        },
        decoration: InputDecoration(
          labelStyle: TextStyle(
            fontSize: getProportionateScreenWidth(15),
          ),
          hintStyle: TextStyle(
            fontSize: getProportionateScreenWidth(16),
          ),
          labelText: "Number",
          hintText: "Enter your number",
          // If  you are using latest version of flutter then lable text and hint text shown like this
          // if you r using flutter less then 1.20.* then maybe this is not working properly
          floatingLabelBehavior: FloatingLabelBehavior.always,
          suffixIcon: CustomSurffixIcon(svgIcon: "assets/icons/Phone.svg"),
        ),
      ),
    );
  }
}
