import 'package:flutter/material.dart';
import 'package:socialbennett/components/socal_card.dart';
import 'package:socialbennett/constants.dart';
import 'package:socialbennett/size_config.dart';

import 'sign_up_form.dart';

class Body extends StatelessWidget {
  @override
  Widget build(BuildContext context) {
    return SafeArea(
      child: SizedBox(
        width: double.infinity,
        child: Padding(
          padding:
              EdgeInsets.symmetric(horizontal: getProportionateScreenWidth(20)),
          child: ScrollConfiguration(
            behavior: ScrollBehavior(),
            child: GlowingOverscrollIndicator(
              axisDirection: AxisDirection.down,
              color: kPrimaryColor2,
              child: SingleChildScrollView(
                child: Column(
                  children: [
                    SizedBox(height: SizeConfig.screenHeight * 0.01), // 4%
                    Text(
                      "Register Account",
                      style: TextStyle(
                        color: Colors.black,
                        fontSize: getProportionateScreenWidth(27),
                        fontWeight: FontWeight.bold,
                      ),
                    ),
                    Text(
                      "Complete your details",
                      style: TextStyle(
                        fontSize: getProportionateScreenWidth(15),
                      ),
                      textAlign: TextAlign.center,
                    ),
                    SizedBox(height: SizeConfig.screenHeight * 0.08),
                    SignUpForm(),
                    SizedBox(height: SizeConfig.screenHeight * 0.08),
                    Text(
                      'By continuing your confirm that you agree \nwith our Term and Condition',
                      textAlign: TextAlign.center,
                      style:
                          TextStyle(fontSize: getProportionateScreenWidth(13)),
                    ),
                    SizedBox(height: SizeConfig.screenHeight * 0.015),
                  ],
                ),
              ),
            ),
          ),
        ),
      ),
    );
  }
}
