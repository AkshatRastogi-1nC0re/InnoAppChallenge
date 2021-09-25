import 'package:flutter/material.dart';
import 'package:socialbennett/constants.dart';
import 'package:socialbennett/size_config.dart';

import 'update_form.dart';

class UpdatePassword extends StatelessWidget {
  String phone_uid;
  UpdatePassword({this.phone_uid});

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
                    SizedBox(height: SizeConfig.screenHeight * 0.04), // 4%
                    Text("Update Password",
                        style: TextStyle(
                          color: Colors.black,
                          fontSize: getProportionateScreenWidth(27),
                          fontWeight: FontWeight.bold,
                        )),
                    SizedBox(height: SizeConfig.screenHeight * 0.08),
                    UpdateForm(phone_uid: phone_uid),
                    SizedBox(height: SizeConfig.screenHeight * 0.08),
                    Text(
                      'By continuing your confirm that you agree \nwith our Term and Condition',
                      textAlign: TextAlign.center,
                      style: TextStyle(
                        fontSize: getProportionateScreenWidth(15),
                      ),
                    )
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
