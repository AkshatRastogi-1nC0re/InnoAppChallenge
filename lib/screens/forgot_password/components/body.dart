import 'package:flutter/material.dart';
import 'package:socialbennett/components/custom_surfix_icon.dart';
import 'package:socialbennett/components/default_button.dart';
import 'package:socialbennett/components/form_error.dart';
import 'package:socialbennett/components/no_account_text.dart';
import 'package:socialbennett/providers/auth_provider.dart';
import 'package:socialbennett/services/user_services.dart';
import 'package:socialbennett/size_config.dart';
import '../../../constants.dart';
import 'package:slide_popup_dialog/slide_popup_dialog.dart' as slideDialog;

import 'package:pinput/pin_put/pin_put.dart';
import 'package:firebase_auth/firebase_auth.dart';

import '../update_password_screen.dart';
import 'package:provider/provider.dart';

class Body extends StatelessWidget {
  @override
  Widget build(BuildContext context) {
    return SizedBox(
      width: double.infinity,
      child: ScrollConfiguration(
        behavior: ScrollBehavior(),
        child: GlowingOverscrollIndicator(
          axisDirection: AxisDirection.down,
          color: kPrimaryColor2,
          child: SingleChildScrollView(
            child: Padding(
              padding: EdgeInsets.symmetric(
                  horizontal: getProportionateScreenWidth(20)),
              child: Column(
                children: [
                  SizedBox(height: SizeConfig.screenHeight * 0.04),
                  Text(
                    "Forgot Password",
                    style: TextStyle(
                      color: Colors.black,
                      fontSize: getProportionateScreenWidth(27),
                      fontWeight: FontWeight.bold,
                    ),
                  ),
                  Text(
                      "Please enter your phone number and we will send you an otp to return to your account",
                      textAlign: TextAlign.center,
                      style: TextStyle(
                        fontSize: getProportionateScreenWidth(15),
                      )),
                  SizedBox(height: SizeConfig.screenHeight * 0.1),
                  ForgotPassForm(),
                ],
              ),
            ),
          ),
        ),
      ),
    );
  }
}

class ForgotPassForm extends StatefulWidget {
  @override
  _ForgotPassFormState createState() => _ForgotPassFormState();
}

class _ForgotPassFormState extends State<ForgotPassForm> {
  final TextEditingController _pinPutController = TextEditingController();
  final FocusNode _pinPutFocusNode = FocusNode();
  final _formKey = GlobalKey<FormState>();
  List<String> errors = [];
  final FirebaseAuth auth = FirebaseAuth.instance;

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

  _verifyPhone() async {
    await auth.verifyPhoneNumber(
        phoneNumber: '+91' + number,
        verificationCompleted: (PhoneAuthCredential credential) async {
          await FirebaseAuth.instance
              .signInWithCredential(credential)
              .then((value) async {
            if (value.user != null) {
              print("nothinggggg");
            }
          });
        },
        verificationFailed: (FirebaseAuthException e) {
          print("erorrrrrrrrrrrrrrrrrrrrrrrrrrrrrrrrrr");
          print(e.message);
        },
        codeSent: (String verficationID, int resendToken) {
          setState(() {
            _verificationCode = verficationID;
          });
        },
        codeAutoRetrievalTimeout: (String verificationID) {
          setState(() {
            _verificationCode = verificationID;
          });
        },
        timeout: Duration(seconds: 30));
  }

  String _verificationCode;
  String number;
  @override
  Widget build(BuildContext context) {
    final _auth = Provider.of<AuthProvider>(context);
    UserServices _userServices = UserServices();
    String phone_uid;
    final BoxDecoration pinPutDecoration = BoxDecoration(
      color: kPrimaryColor,
      borderRadius: BorderRadius.circular(5.0),
    );
    Widget boxedPinPutWithPreFilledSymbol() {
      return Theme(
        data: Theme.of(context).copyWith(
            inputDecorationTheme: InputDecorationTheme(
          floatingLabelBehavior: FloatingLabelBehavior.always,
          contentPadding: EdgeInsets.symmetric(horizontal: 42, vertical: 20),
        )),
        child: PinPut(
          withCursor: true,
          fieldsCount: 6,
          textStyle: const TextStyle(fontSize: 25.0, color: Colors.white),
          eachFieldWidth: getProportionateScreenWidth(50),
          eachFieldHeight: getProportionateScreenHeight(50),
          onSubmit: (String pin) async {
            try {
              await auth
                  .signInWithCredential(PhoneAuthProvider.credential(
                      verificationId: _verificationCode, smsCode: pin))
                  .then((value) async {
                if (value.user != null) {
                  phone_uid = auth.currentUser.uid;
                  auth.signOut();
                  String password = await _userServices.getKeyPass(phone_uid);
                  print("password is $password");
                  await _auth.signIn(
                      email: number + "@orev.user", password: password);
                  var uid_real = _auth.user.uid;
                  print("Email UID is $uid_real");
                  Navigator.pushReplacement(
                      context,
                      MaterialPageRoute(
                          builder: (context) =>
                              UpdatePasswordScreen(phone_uid: phone_uid)));
                }
              });
            } catch (e) {
              print(e);
            }
          },
          focusNode: _pinPutFocusNode,
          controller: _pinPutController,
          submittedFieldDecoration: pinPutDecoration,
          selectedFieldDecoration:
              pinPutDecoration.copyWith(color: Colors.lightGreen),
          followingFieldDecoration: pinPutDecoration,
        ),
      );
    }

    void _showDialog() {
      slideDialog.showSlideDialog(
          context: context,
          child: Expanded(
            child: ScrollConfiguration(
              behavior: ScrollBehavior(),
              child: GlowingOverscrollIndicator(
                axisDirection: AxisDirection.down,
                color: kPrimaryColor2,
                child: SingleChildScrollView(
                  child: Padding(
                    padding: EdgeInsets.symmetric(
                        horizontal: getProportionateScreenWidth(20)),
                    child: Column(
                      children: [
                        Text(
                          "One Time Password",
                          style: TextStyle(
                            color: Colors.black,
                            fontSize: getProportionateScreenWidth(27),
                            fontWeight: FontWeight.bold,
                          ),
                        ),
                        SizedBox(height: SizeConfig.screenHeight * 0.05),
                        boxedPinPutWithPreFilledSymbol(),
                        SizedBox(height: SizeConfig.screenHeight * 0.05),
                        Text(
                          "Please enter the OTP that you have received on your provided phone number $number",
                          style: TextStyle(
                            fontSize: getProportionateScreenWidth(15),
                          ),
                          textAlign: TextAlign.center,
                        ),
                        SizedBox(height: SizeConfig.screenHeight * 0.1),
                      ],
                    ),
                  ),
                ),
              ),
            ),
          ));
    }

    return Form(
      key: _formKey,
      child: Column(
        children: [
          buildPhoneFormField(),
          SizedBox(height: getProportionateScreenHeight(30)),
          FormError(errors: errors),
          SizedBox(height: SizeConfig.screenHeight * 0.1),
          DefaultButton(
            text: "Continue",
            press: () async {
              print(errors);
              errors = [];
              if (_formKey.currentState.validate()) {
                _formKey.currentState.save();
                _verifyPhone();
                _showDialog();
              }
            },
          ),
          SizedBox(height: SizeConfig.screenHeight * 0.1),
          NoAccountText(),
        ],
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
