import 'package:flutter/material.dart';
import 'package:socialbennett/screens/sign_in/sign_in_screen.dart';
import 'package:socialbennett/constants.dart';
import 'package:socialbennett/screens/home/home_screen.dart';
import 'package:socialbennett/screens/sign_in/sign_in_screen.dart';
import 'package:socialbennett/services/user_simple_preferences.dart';
import 'package:socialbennett/size_config.dart';

// This is the best practice
import '../components/splash_content.dart';
import '../../../components/default_button.dart';

class Body extends StatefulWidget {
  @override
  _BodyState createState() => _BodyState();
}

class _BodyState extends State<Body> {
  int currentPage = 0;
  List<Map<String, String>> splashData = [
    {
      "text": "Welcome to Bennett Hub, Let’s be Social!",
      "image": "assets/images/init1.png",
      "anim": ""
    },
    {
      "text": "Feeling shy talking to others Bennett Hub \nwill help you",
      "image": "assets/images/init2.png",
      "anim": ""
    },
    {
      "text": "Find the right people for you at Bennett",
      "image": "assets/images/init3.png",
      "anim": ""
    },
  ];

  @override
  Widget build(BuildContext context) {
    return SafeArea(
      child: SizedBox(
        width: double.infinity,
        child: Column(
          children: <Widget>[
            Expanded(
              flex: 3,
              child: PageView.builder(
                onPageChanged: (value) {
                  setState(() {
                    currentPage = value;
                  });
                },
                itemCount: splashData.length,
                itemBuilder: (context, index) => SplashContent(
                  image: splashData[index]["image"],
                  text: splashData[index]['text'],
                  anim: splashData[index]["anim"],
                ),
              ),
            ),
            Expanded(
              flex: 2,
              child: Padding(
                padding: EdgeInsets.symmetric(
                    horizontal: getProportionateScreenWidth(20)),
                child: Column(
                  children: <Widget>[
                    Spacer(),
                    Row(
                      mainAxisAlignment: MainAxisAlignment.center,
                      children: List.generate(
                        splashData.length,
                        (index) => buildDot(index: index),
                      ),
                    ),
                    Spacer(flex: 3),
                    currentPage == 2
                        ? DefaultButton(
                            color: Color(0xff212f44),
                            colour: Colors.white,
                            text: "Let's make some friends",
                            press: () {
                              UserSimplePreferences.setFirst("status");
                              Navigator.pushNamed(
                                  context, SignInScreen.routeName);
                            },
                          )
                        : Center(),
                    Spacer(),
                  ],
                ),
              ),
            ),
          ],
        ),
      ),
    );
  }

  AnimatedContainer buildDot({int index}) {
    return AnimatedContainer(
      duration: kAnimationDuration,
      margin: EdgeInsets.only(right: 5),
      height: 6,
      width: currentPage == index ? 20 : 6,
      decoration: BoxDecoration(
        color: currentPage == index ? kPrimaryColor : Color(0xFFD8D8D8),
        borderRadius: BorderRadius.circular(3),
      ),
    );
  }
}
