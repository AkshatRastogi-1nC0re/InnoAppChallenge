import 'package:flutter/material.dart';
import 'package:card_swiper/card_swiper.dart';
import 'package:font_awesome_flutter/font_awesome_flutter.dart';

import '../../../size_config.dart';

class Body extends StatefulWidget {
  @override
  _BodyState createState() => _BodyState();
}

class _BodyState extends State<Body> {
  @override
  Widget build(BuildContext context) {
    return SingleChildScrollView(
      child: Column(

          children: [
            Container(
          color: Color(0xff212f44),
              child: Row(
                children: [
                  FaIcon(FontAwesomeIcons.hamburger),
                  Text(
                    "Hello, Aryan",
                    style: TextStyle(
                      fontSize: getProportionateScreenWidth(36),
                      color: Colors.white,
                      fontWeight: FontWeight.bold,
                    ),
                  )
                ],
              ),
            ),
            Container(
              decoration: BoxDecoration(
                color:  Color(0xffffefc5),
              ),
              child: Column(
                crossAxisAlignment: CrossAxisAlignment.start,
                children: [
                  Padding(
                    padding: EdgeInsets.symmetric(vertical: getProportionateScreenWidth(10),horizontal: getProportionateScreenHeight(20)),
                    child: Text(
                      "Bennett Hub",
                      style: TextStyle(
                        fontSize: getProportionateScreenWidth(36),

                        color: Color(0xff212f44),
                        fontWeight: FontWeight.bold,
                      ),
                    ),
                  ),
                  Container(
                      height: getProportionateScreenHeight(360),
                      child: Swiper(
                        physics: NeverScrollableScrollPhysics(),
                        itemBuilder: (BuildContext context, int index) {
                          return Stack(
                            children: [
                              Image.network(
                                "https://harris.uchicago.edu/files/styles/square/public/2019-10/emileigh_harrison_cropped.jpg?itok=zL13vTOG",
                                fit: BoxFit.fill,
                              ),
                              Padding(
                                padding: EdgeInsets.only(left: 5),
                                child: Column(
                                  mainAxisAlignment: MainAxisAlignment.spaceBetween,
                                  crossAxisAlignment: CrossAxisAlignment.start,
                                  children: [
                                    Column(
                                      crossAxisAlignment: CrossAxisAlignment.start,
                                      children: [
                                        Text(
                                          "Yash Sharma",
                                          style: TextStyle(
                                            fontSize: getProportionateScreenWidth(26),
                                            color: Colors.white,
                                            fontWeight: FontWeight.w800,
                                          ),
                                        ),
                                        Text(
                                          "CSE,2024",
                                          style: TextStyle(
                                            fontSize: getProportionateScreenWidth(14),
                                            color: Colors.white,
                                            fontWeight: FontWeight.w500,
                                          ),
                                        ),
                                      ],
                                    ),
                                    Padding(
                                      padding: EdgeInsets.only(bottom: getProportionateScreenHeight(20)),
                                      child: Row(
                                        children: [
                                          Container(
                                            // width: getProportionateScreenWidth(60),
                                            decoration: BoxDecoration(
                                                color: Colors.white.withOpacity(0.6),
                                                // border: Border.all(
                                                //   color: Colors.white,
                                                // ),
                                                borderRadius: BorderRadius.all(Radius.circular(20))
                                            ),
                                            child: Padding(
                                              padding:  EdgeInsets.symmetric(vertical: getProportionateScreenWidth(5),horizontal: getProportionateScreenHeight(15)),
                                              child: Center(child: Text("FootBall",style: TextStyle(color: Color(0xff212f44),fontSize: getProportionateScreenWidth(13)),)),
                                            ),
                                          ),
                                          SizedBox(width: getProportionateScreenWidth(10),),
                                          Container(
                                            // width: getProportionateScreenWidth(60),
                                            decoration: BoxDecoration(
                                                color: Colors.white.withOpacity(0.6),
                                                // border: Border.all(
                                                //   color: Colors.white,
                                                // ),
                                                borderRadius: BorderRadius.all(Radius.circular(20))
                                            ),
                                            child: Padding(
                                              padding:  EdgeInsets.symmetric(vertical: getProportionateScreenWidth(5),horizontal: getProportionateScreenHeight(15)),
                                              child: Center(child: Text("FootBall",style: TextStyle(color: Color(0xff212f44),fontSize: getProportionateScreenWidth(13)),)),
                                            ),
                                          )
                                        ],
                                      ),
                                    ),
                                  ],
                                ),
                              )


                            ],
                          );
                        },
                        itemCount: 10,
                        itemWidth: 300.0,
                        layout: SwiperLayout.STACK,
                      )
                  ),
                  Padding(
                    padding: EdgeInsets.symmetric(vertical: getProportionateScreenWidth(10),horizontal: getProportionateScreenHeight(20)),
                    child: Text(
                      "Anime",
                      style: TextStyle(
                        fontSize: getProportionateScreenWidth(36),

                        color: Color(0xff212f44),
                        fontWeight: FontWeight.bold,
                      ),
                    ),
                  ),
                  Container(
                    height: getProportionateScreenHeight(250),
                    child: ListView.builder(
                        itemCount: 10,
                        scrollDirection: Axis.horizontal,
                        shrinkWrap: true,
                        itemBuilder: (BuildContext context, int index){
                          return Padding(
                            padding: EdgeInsets.symmetric(horizontal: getProportionateScreenWidth(10)),
                            child: Stack(
                              children: [
                                Image.network(
                                  "https://d2qp0siotla746.cloudfront.net/img/use-cases/profile-picture/template_3.jpg",
                                  fit: BoxFit.fill,
                                ),
                                Padding(
                                  padding: EdgeInsets.only(left: 5),
                                  child: Column(
                                    crossAxisAlignment: CrossAxisAlignment.start,
                                    children: [
                                      Text(
                                        "Yash Sharma",
                                        style: TextStyle(
                                          fontSize: getProportionateScreenWidth(20),
                                          color: Colors.white,
                                          fontWeight: FontWeight.w800,
                                        ),
                                      ),
                                      Text(
                                        "CSE,2024",
                                        style: TextStyle(
                                          fontSize: getProportionateScreenWidth(12),
                                          color: Colors.white,
                                          fontWeight: FontWeight.w500,
                                        ),
                                      ),
                                    ],
                                  ),
                                )


                              ],
                            ),
                          );
                        }
                    ),
                  ),
                  Padding(
                    padding: EdgeInsets.symmetric(vertical: getProportionateScreenWidth(10),horizontal: getProportionateScreenHeight(20)),
                    child: Text(
                      "Coding",
                      style: TextStyle(
                        fontSize: getProportionateScreenWidth(36),

                        color: Color(0xff212f44),
                        fontWeight: FontWeight.bold,
                      ),
                    ),
                  ),
                  Container(
                    height: getProportionateScreenHeight(250),
                    child: ListView.builder(
                        itemCount: 10,
                        scrollDirection: Axis.horizontal,
                        shrinkWrap: true,
                        itemBuilder: (BuildContext context, int index){
                          return Padding(
                            padding: EdgeInsets.symmetric(horizontal: getProportionateScreenWidth(10)),
                            child: Stack(
                              children: [
                                Image.network(
                                  "https://d2qp0siotla746.cloudfront.net/img/use-cases/profile-picture/template_3.jpg",
                                  fit: BoxFit.fill,
                                ),
                                Padding(
                                  padding: EdgeInsets.only(left: 5),
                                  child: Column(
                                    crossAxisAlignment: CrossAxisAlignment.start,
                                    children: [
                                      Text(
                                        "Yash Sharma",
                                        style: TextStyle(
                                          fontSize: getProportionateScreenWidth(20),
                                          color: Colors.white,
                                          fontWeight: FontWeight.w800,
                                        ),
                                      ),
                                      Text(
                                        "CSE,2024",
                                        style: TextStyle(
                                          fontSize: getProportionateScreenWidth(12),
                                          color: Colors.white,
                                          fontWeight: FontWeight.w500,
                                        ),
                                      ),
                                    ],
                                  ),
                                )


                              ],
                            ),
                          );
                        }
                    ),
                  ),
                  SizedBox(height: getProportionateScreenHeight(20),)

                ],
              ),
            )
          ],
      ),
    );
  }
}



