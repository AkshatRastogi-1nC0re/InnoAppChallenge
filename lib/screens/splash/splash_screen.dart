import 'package:flutter/material.dart';
import 'package:socialbennett/screens/home/home_screen.dart';
import 'package:socialbennett/screens/splash/components/body.dart';
import 'package:socialbennett/services/user_simple_preferences.dart';
import 'package:socialbennett/size_config.dart';
import 'package:animated_splash_screen/animated_splash_screen.dart';

class SplashScreen extends StatefulWidget {
  static String routeName = "/splash";
  @override
  _SplashScreenState createState() => _SplashScreenState();
}

class _SplashScreenState extends State<SplashScreen> {
  String getFirst = '';

  @override
  void initState() {
    getFirst = UserSimplePreferences.getFirst() ?? '';
    super.initState();
  }

  @override
  Widget build(BuildContext context) {
    // You have to call it on your starting screen
    SizeConfig().init(context);
    getFirst = UserSimplePreferences.getFirst() ?? '';
    return AnimatedSplashScreen(
        backgroundColor: Color(0xffffefc5),
        duration: 1,
        splashIconSize: getProportionateScreenWidth(280),
        splash: 'assets/images/BennettHub.png',
        nextScreen: (getFirst == '')
            ? Scaffold(
                backgroundColor: Color(0xffffefc5),
                body: Body(),
              )
            : HomeScreen()
        // splashTransition: SplashTransition.rotationTransition,
        // pageTransitionType: pageTransitionType.scale,
        );
  }
}
