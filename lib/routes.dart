import 'package:flutter/widgets.dart';
import 'package:socialbennett/screens/forgot_password/forgot_password_screen.dart';
import 'package:socialbennett/screens/forgot_password/update_password_screen.dart';
import 'package:socialbennett/screens/home/home_screen.dart';
import 'package:socialbennett/screens/login_success/login_success_screen.dart';
import 'package:socialbennett/screens/otp/otp_screen.dart';
import 'package:socialbennett/screens/sign_in/sign_in_screen.dart';
import 'package:socialbennett/screens/splash/splash_screen.dart';
import 'screens/sign_up/sign_up_screen.dart';

// We use name route
// All our routes will be available here
final Map<String, WidgetBuilder> routes = {
  SplashScreen.routeName: (context) => SplashScreen(), //done ui
  SignInScreen.routeName: (context) => SignInScreen(), //done ui
  ForgotPasswordScreen.routeName: (context) => ForgotPasswordScreen(), //done ui
  UpdatePasswordScreen.routeName: (context) =>
      UpdatePasswordScreen(), //not done
  LoginSuccessScreen.routeName: (context) => LoginSuccessScreen(), //done ui
  SignUpScreen.routeName: (context) => SignUpScreen(), //done ui
  HomeScreen.routeName: (context) => HomeScreen(), //done ui
};
