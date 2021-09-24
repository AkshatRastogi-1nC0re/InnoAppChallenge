import 'package:flutter/material.dart';
import 'package:orev/constants.dart';
import 'package:orev/screens/home/home_screen.dart';
import 'package:orev/screens/sign_in/sign_in_screen.dart';
import 'package:orev/services/user_simple_preferences.dart';
import 'package:orev/size_config.dart';

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
      "text": "Welcome to Orev, Let’s shop!",
      "image": "assets/images/splash_1.png",
      "anim": ""
    },
    {
      "text":
          "Nature is Organic,We at Orev delivers\n highest quality Organic Products.",
      "image": "assets/images/splash_2.png",
      "anim": "assets/animation/splash_2.json"
    },
    {
      "text": "Best Quality Organic Products \nat your doorstep.",
      "image": "assets/images/splash_3.png",
      "anim": "assets/animation/splash_3.json"
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
                    DefaultButton(
                      text: "Ready to Explore",
                      press: () {
                        UserSimplePreferences.setFirst("status");
                        Navigator.pushNamed(context, HomeScreen.routeName);
                      },
                    ),
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
