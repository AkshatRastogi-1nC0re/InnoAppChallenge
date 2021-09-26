import 'package:cloud_firestore/cloud_firestore.dart';
import 'package:flutter/material.dart';
import 'package:socialbennett/components/custom_surfix_icon.dart';
import 'package:socialbennett/components/default_button.dart';
import 'package:socialbennett/components/form_error.dart';
import 'package:socialbennett/providers/auth_provider.dart';
import 'package:socialbennett/screens/address/address.dart';
import 'package:socialbennett/screens/home/home_screen.dart';
import 'package:socialbennett/services/user_services.dart';
import 'package:socialbennett/services/user_simple_preferences.dart';
import 'package:rounded_loading_button/rounded_loading_button.dart';
import '../../../constants.dart';
import '../../../size_config.dart';
import 'package:slide_popup_dialog/slide_popup_dialog.dart' as slideDialog;
import 'package:firebase_auth/firebase_auth.dart';
import 'package:pinput/pin_put/pin_put.dart';
import 'package:provider/provider.dart';

class SignUpForm extends StatefulWidget {
  @override
  _SignUpFormState createState() => _SignUpFormState();
}

class _SignUpFormState extends State<SignUpForm> with ChangeNotifier {
  final _formKey = GlobalKey<FormState>();
  String password;
  String conform_password;
  bool remember = false;
  String phone;
  String Name;
  DocumentSnapshot snapshot;
  List<String> errors = [];
  final TextEditingController _pinPutController = TextEditingController();
  final FocusNode _pinPutFocusNode = FocusNode();
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

  // _verifyPhone() async {
  //   await auth.verifyPhoneNumber(
  //       phoneNumber: '+91' + number,
  //       verificationCompleted: (PhoneAuthCredential credential) async {
  //         await FirebaseAuth.instance
  //             .signInWithCredential(credential)
  //             .then((value) async {
  //           if (value.user != null) {
  //             print("nothinggggg");
  //           }
  //         });
  //       },
  //       verificationFailed: (FirebaseAuthException e) {
  //         print("erorrrrrrrrrrrrrrrrrrrrrrrrrrrrrrrrrr");
  //         print(e.message);
  //       },
  //       codeSent: (String verficationID, int resendToken) {
  //         setState(() {
  //           _verificationCode = verficationID;
  //         });
  //       },
  //       codeAutoRetrievalTimeout: (String verificationID) {
  //         setState(() {
  //           _verificationCode = verificationID;
  //         });
  //       },
  //       timeout: Duration(seconds: 30));
  // }

  // Future<bool> Query(num) async {
  //   var bo = false;
  //   QuerySnapshot snapshot =
  //       await FirebaseFirestore.instance.collection("users").get();
  //   snapshot.docs.forEach((document) {
  //     if (document.exists) {
  //       if (document['number'] == num) {
  //         bo = true;
  //         return;
  //       }
  //     } else {
  //       print('document does not exist');
  //     }
  //   });
  //   return bo;
  // }

  String _verificationCode;
  String number;
  @override
  Widget build(BuildContext context) {
    final _auth = Provider.of<AuthProvider>(context);
    UserServices _userServices = UserServices();
    String phone_uid;

    // Future<void> createNewUser(number, name, password) async {
    //   String uid_real;
    //   var tempemail = number + "@orev.user";
    //   await _auth.signUp(email: tempemail, password: password);
    //   uid_real = _auth.user.uid;
    //   print("Email UID is $uid_real");
    //   UserSimplePreferences.setAuthKey(uid_real);
    //   Navigator.push(
    //     context,
    //     MaterialPageRoute(builder: (context) => Address()),
    //   );
    // }

    final BoxDecoration pinPutDecoration = BoxDecoration(
      color: kPrimaryTextColor,
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
                  // createNewUser(number, Name, password);
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
              pinPutDecoration.copyWith(color: Colors.indigo),
          followingFieldDecoration: pinPutDecoration,
        ),
      );
    }

    void _showDialog() {
      slideDialog.showSlideDialog(
          backgroundColor: Color(0xffffefc6),
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

    final RoundedLoadingButtonController _btnController =
        RoundedLoadingButtonController();

    return Form(
      key: _formKey,
      child: Column(
        children: [
          buildFirstNameFormField(),
          SizedBox(height: getProportionateScreenHeight(8)),
          buildPhoneFormField(),
          SizedBox(height: getProportionateScreenHeight(8)),
          buildPasswordFormField(),
          SizedBox(height: getProportionateScreenHeight(8)),
          buildConformPassFormField(),
          FormError(errors: errors),
          SizedBox(height: getProportionateScreenHeight(15)),
          RoundedLoadingButton(
            successColor: kPrimaryColor,
            duration: Duration(milliseconds: 1300),
            width: getProportionateScreenWidth(500),
            height: getProportionateScreenHeight(56),
            color: kPrimaryTextColor,
            child: Text("Continue",
                style: TextStyle(
                    fontSize: getProportionateScreenWidth(18),
                    color: Colors.white)),
            controller: _btnController,
            onPressed: () {
              errors = [];
              if (_formKey.currentState.validate()) {
                _formKey.currentState.save();
                Navigator.pushNamed(context, Address.routeName);
              }
            },
          ),
        ],
      ),
    );
  }

  Container buildFirstNameFormField() {
    return Container(
      height: getProportionateScreenHeight(116),
      child: TextFormField(
        style: TextStyle(
          fontSize: getProportionateScreenWidth(16),
        ),
        onSaved: (newValue) => Name = newValue,
        onChanged: (value) {
          if (value.isNotEmpty) {
            removeError(error: kNamelNullError);
          }
          return null;
        },
        validator: (value) {
          if (value.isEmpty) {
            addError(error: kNamelNullError);
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
          labelText: "Full Name",
          hintText: "Enter your full name",
          // If  you are using latest version of flutter then lable text and hint text shown like this
          // if you r using flutter less then 1.20.* then maybe this is not working properly
          floatingLabelBehavior: FloatingLabelBehavior.always,
          suffixIcon: CustomSurffixIcon(svgIcon: "assets/icons/User.svg"),
        ),
      ),
    );
  }

  Container buildConformPassFormField() {
    return Container(
      height: getProportionateScreenHeight(116),
      child: TextFormField(
        style: TextStyle(
          fontSize: getProportionateScreenWidth(16),
        ),
        obscureText: true,
        onSaved: (newValue) => conform_password = newValue,
        onChanged: (value) {
          if (value.isNotEmpty) {
            removeError(error: kPassNullError);
          }
          if (value.isNotEmpty && password == conform_password) {
            removeError(error: kMatchPassError);
          }
          conform_password = value;
        },
        validator: (value) {
          if (value.isEmpty) {
            addError(error: kPassNullError);
            return "";
          }
          if ((password != value)) {
            addError(error: kMatchPassError);
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
          labelText: "Confirm Password",
          hintText: "Re-enter your password",
          // If  you are using latest version of flutter then lable text and hint text shown like this
          // if you r using flutter less then 1.20.* then maybe this is not working properly
          floatingLabelBehavior: FloatingLabelBehavior.always,
          suffixIcon: CustomSurffixIcon(svgIcon: "assets/icons/Lock.svg"),
        ),
      ),
    );
  }

  Container buildPasswordFormField() {
    return Container(
      height: getProportionateScreenHeight(116),
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
          password = value;
        },
        validator: (value) {
          if (value.isEmpty) {
            addError(error: kPassNullError);
            return "";
          }
          if (value.length < 8) {
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

bool isNumeric(String s) {
  if (s == null) {
    return false;
  }
  return double.parse(s, (e) => null) != null;
}
