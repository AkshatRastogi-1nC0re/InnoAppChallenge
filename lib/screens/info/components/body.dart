import 'package:flutter/cupertino.dart';
import 'package:flutter/material.dart';
import 'package:card_swiper/card_swiper.dart';
import 'package:flutter_staggered_grid_view/flutter_staggered_grid_view.dart';
import 'package:flip_card/flip_card.dart';
import 'package:font_awesome_flutter/font_awesome_flutter.dart';
import 'package:socialbennett/screens/detail/detailscreen.dart';

import '../../../size_config.dart';
import "dart:math";

class Body extends StatefulWidget {
  @override
  _BodyState createState() => _BodyState();
}

class _BodyState extends State<Body> {
  @override

  Widget build(BuildContext context) {
    return Stack(children: [
      Positioned(
        width: getProportionateScreenWidth(55),
        right: 0,
        child: Image(image: AssetImage("assets/images/rightbar.png")),
      ),
      Positioned(
        bottom: 0,
        right: getProportionateScreenWidth(12),
        child: Column(
          children: [
            Padding(
              padding: const EdgeInsets.symmetric(vertical: 8),
              child: FaIcon(FontAwesomeIcons.instagramSquare,
                  size: getProportionateScreenWidth(30)),
            ),
            Padding(
              padding: const EdgeInsets.symmetric(vertical: 8.0),
              child: FaIcon(FontAwesomeIcons.facebook,
                  size: getProportionateScreenWidth(30)),
            ),
          ],
        ),
      ),
      Container(
        decoration: BoxDecoration(
          image: DecorationImage(
              image: AssetImage("assets/images/info.png"),
              fit: BoxFit.cover),
        ),

        child: SingleChildScrollView(
          child: Column(
            crossAxisAlignment: CrossAxisAlignment.start,
            children: [
              Padding(
                  padding: EdgeInsets.only(
                    top: getProportionateScreenHeight(10),left: getProportionateScreenWidth(20),right:getProportionateScreenWidth(20)
                  ),
                  child: Column(
                    crossAxisAlignment: CrossAxisAlignment.start,
                    children: [
                      Text(
                        "हमारी,",
                        style: TextStyle(
                          fontSize: getProportionateScreenWidth(28),
                          color: Color(0xff212f44),
                          fontWeight: FontWeight.bold,
                        ),
                      ),
                      Text(
                        "  " + "Info !",
                        style: TextStyle(
                          fontFamily: "Playlist",
                          fontSize: getProportionateScreenWidth(50),
                          color: Color(0xff212f44),
                        ),
                      ),
                    ],
                  )),
              Center(child: Container(height: getProportionateScreenHeight(150),child: Image(image: AssetImage("assets/images/asynclogo.png")))),
              Padding(
                padding: EdgeInsets.only(
                    top: getProportionateScreenHeight(20),
                    left: getProportionateScreenWidth(20)),
                child: Container(
                  width: getProportionateScreenWidth(250),
                  child: Column(
                    crossAxisAlignment: CrossAxisAlignment.start,
                    children: [
                      Text(
                        "About Async",
                        style: TextStyle(
                            fontFamily: "OpenSans",
                            fontWeight: FontWeight.bold,
                            color: Colors.black,
                            fontSize: getProportionateScreenWidth(20)),
                      ),
                      SizedBox(
                        height: getProportionateScreenHeight(10),
                      ),
                      Text(
                        "Lorem ipsum dolor sit amet coonsequuntur voluptatum rem ipsum dolor sit amet coonsequuntur voluptatum l rem ipsum dolor sit amet coonsequuntur voluptatum l rem ipsum dolor sit amet coonsequuntur voluptatum l laboruuas aliquid. Reprehenderit, quia. Quo neque error repudiandae fuga? ",
                        style: TextStyle(
                            fontFamily: "OpenSans",
                            color: Colors.black,
                            fontSize: getProportionateScreenWidth(13)),
                      ),
                    ],
                  ),
                ),
              ),
              Padding(
                padding: EdgeInsets.only(
                    top: getProportionateScreenHeight(20),
                    left: getProportionateScreenWidth(20)),
                child: Container(
                  width: getProportionateScreenWidth(280),
                  child: Column(
                    crossAxisAlignment: CrossAxisAlignment.start,
                    children: [
                      Text(
                        "Founders",
                        style: TextStyle(
                            fontFamily: "OpenSans",
                            fontWeight: FontWeight.bold,
                            color: Colors.black,
                            fontSize: getProportionateScreenWidth(20)),
                      ),
                      SizedBox(
                        height: getProportionateScreenHeight(10),
                      ),
                      Row(
                        mainAxisAlignment: MainAxisAlignment.spaceBetween,
                        children: [
                          Container(height: getProportionateScreenHeight(90),child: Image(image: AssetImage("assets/images/aryan.png"))),
                          Container(height: getProportionateScreenHeight(120),child: Image(image: AssetImage("assets/images/yash.png"))),
                          Container(height: getProportionateScreenHeight(100),child: Image(image: AssetImage("assets/images/akshat.png"))),
                        ],
                      ),
                      Row(
                        mainAxisAlignment: MainAxisAlignment.spaceBetween,
                        children: [
                          Container(height: getProportionateScreenHeight(50),child: Text("Aryan Solanki",style: TextStyle(
                              fontFamily: "OpenSans",
                              color: Colors.black,
                              fontWeight: FontWeight.bold,
                              fontSize: getProportionateScreenWidth(10)),)),
                          Container(height: getProportionateScreenHeight(50),child: Text("Yash Sharma",style: TextStyle(
                              fontFamily: "OpenSans",
                              color: Colors.black,
                              fontWeight: FontWeight.bold,
                              fontSize: getProportionateScreenWidth(10)),)),
                          Container(height: getProportionateScreenHeight(50),child: Text("Akshat Rastogi",style: TextStyle(
                              fontFamily: "OpenSans",
                              color: Colors.black,
                              fontWeight: FontWeight.bold,
                              fontSize: getProportionateScreenWidth(10)),)),
                        ],
                      ),
                    ],
                  ),
                ),
              ),

            ],
          ),
        ),
      ),

    ]);
  }
}
