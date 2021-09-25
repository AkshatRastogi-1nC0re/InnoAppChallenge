import 'package:flutter/material.dart';
import 'package:lottie/lottie.dart';


import '../enums.dart';
import '../size_config.dart';
import 'coustom_bottom_nav_bar.dart';

class UpdateAvailable extends StatefulWidget {
  final String value;
  final bool bottomNavigation;
  const UpdateAvailable({
    Key key,
    @required this.value,
    @required this.bottomNavigation,
  }) : super(key: key);

  @override
  _UpdateAvailableState createState() => _UpdateAvailableState();
}

class _UpdateAvailableState extends State<UpdateAvailable> {
  @override
  Widget build(BuildContext context) {
    return SafeArea(
      child: Scaffold(
        body: Container(
            child: SingleChildScrollView(
              child: Column(
                children: [
                  SizedBox(height: getProportionateScreenHeight(10)),
                  SizedBox(height: getProportionateScreenHeight(10)),
                  Container(
                    padding: EdgeInsets.symmetric(horizontal: getProportionateScreenWidth(20)),
                    child: Column(
                        children:[
                          Text(
                            "Orev",
                            style: TextStyle(
                              color: Colors.black,
                              fontSize: getProportionateScreenWidth(35),
                              fontWeight: FontWeight.w100,
                            ),
                          ),
                          Text(
                            widget.value,
                            style: TextStyle(
                              color: Colors.black,
                              fontSize: getProportionateScreenWidth(23),
                              fontWeight: FontWeight.bold,
                            ),
                          ),
                          SizedBox(height: getProportionateScreenHeight(150),),
                          Container(
                            child: widget.value=="Come Back Soon"?Image.asset("assets/images/undermaintenance.jpg"):Image.asset("assets/images/update.jpg"),
                          )
                        ]
                    ),
                  )
                ],
              ),
            )),
        bottomNavigationBar: widget.bottomNavigation==true?CustomBottomNavBar(selectedMenu: MenuState.message):null,
      ),
    );
  }
}
