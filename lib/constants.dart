import 'package:flutter/material.dart';
import 'package:socialbennett/size_config.dart';

const kPrimaryColor = Color(0xff59b24d);
const kPrimaryColor2 = Color(0xff3bd80d);
const kPrimaryColor3 = Color(0xfff8e1a9);
const kPrimaryTextColor = Color(0xff212f44);
const kPrimaryColor4 = Color(0xfff3c13d);
const kBackgroundColor = Color(0xffededed);
const kPrimaryLightColor = Color(0xFFFFECDF);
const kPrimaryGradientColor = LinearGradient(
  begin: Alignment.topLeft,
  end: Alignment.bottomRight,
  colors: [Color(0xFFFFA53E), Color(0xFFFF7643)],
);
const kSecondaryColor = Color(0xFF979797);
const kTextColor = Color(0xFF757575);

const kAnimationDuration = Duration(milliseconds: 200);

final headingStyle = TextStyle(
  fontSize: getProportionateScreenWidth(28),
  fontWeight: FontWeight.bold,
  color: Color(0xff212544),
  height: 1.5,
);
final smallerheadingStyle = TextStyle(
  fontSize: getProportionateScreenWidth(24),
  fontWeight: FontWeight.bold,
  color: Colors.black,
  height: 1.5,
);
final verysmallerheadingStyle = TextStyle(
  fontSize: getProportionateScreenWidth(11),
  // fontWeight: FontWeight.bold,
  color: Colors.black,
  height: 1.5,
);

const defaultDuration = Duration(milliseconds: 250);

// Form Error
final RegExp emailValidatorRegExp =
    RegExp(r"^[a-zA-Z0-9.]+@[a-zA-Z0-9]+\.[a-zA-Z]+");
const String kEmailNullError = "Please Enter Your Email";
const String kInvalidEmailError = "Please Enter Valid Email";
const String kPassNullError = "Please Enter Your Password";
const String kUserExistsError = "This user already exists";
const String kUserNotFoundError = "This User Does Not Exist";
const String kPassWrongError = "Password Is Incorrect";
const String kFirebaseNetworkError = "Firebase Network Error";
const String ksomethingerror = "Authentication not successful";
const String kShortPassError = "Password Is Too Short";
const String kMatchPassError = "Passwords Don't Match";
const String kNamelNullError = "Please Enter Your Name";
const String kPhoneNumberNullError = "Please Enter Your Phone Number";
const String kPincodeNullError = "Please Enter Your PIN Code";
const String kAddressNullError = "Please Enter Your Address";
const String kAddressNameNullError = "Name is empty";
const String kShortNumberError = "Phone Number Is Too Short";
const String kShortPincodeError = "PIN Code Is Too Short";
const String kLongNumberError = "Phone Number Is Too Long";
const String kLongPincodeError = "PIN Code Is Too Long";
const String kInvalidPhoneError = "Please Enter Valid Phone Number";

final otpInputDecoration = InputDecoration(
  contentPadding:
      EdgeInsets.symmetric(vertical: getProportionateScreenWidth(15)),
  border: outlineInputBorder(),
  focusedBorder: outlineInputBorder(),
  enabledBorder: outlineInputBorder(),
);

OutlineInputBorder outlineInputBorder() {
  return OutlineInputBorder(
    borderRadius: BorderRadius.circular(getProportionateScreenWidth(15)),
    borderSide: BorderSide(color: kTextColor),
  );
}
