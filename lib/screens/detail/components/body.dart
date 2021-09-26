import 'package:flutter/cupertino.dart';
import 'package:flutter/material.dart';
import 'package:card_swiper/card_swiper.dart';
import 'package:flutter/painting.dart';
import 'package:flutter_staggered_grid_view/flutter_staggered_grid_view.dart';
import 'package:flip_card/flip_card.dart';

import 'package:font_awesome_flutter/font_awesome_flutter.dart';
import 'package:url_launcher/url_launcher.dart';
import '../../../size_config.dart';

class Body extends StatefulWidget {
  @override
  _BodyState createState() => _BodyState();
}

class _BodyState extends State<Body> {
  String whatsapplink = "http://Wa.me/+919540014357?text=Hii+Lets+Connect";

  @override
  GlobalKey<FlipCardState> cardKey = GlobalKey<FlipCardState>();
  void launchURL() async => await canLaunch(whatsapplink)
      ? await launch(whatsapplink)
      : throw 'Could not launch $whatsapplink';
  Widget build(BuildContext context) {
    return Stack(children: [

      Container(
        decoration: BoxDecoration(
          image: DecorationImage(
              image: AssetImage("assets/images/bottomdetail.png"),
              fit: BoxFit.cover),
        ),
        child: SingleChildScrollView(
          child: Container(
            child: Column(
              crossAxisAlignment: CrossAxisAlignment.start,
              children: [
                Stack(
                  children: [
                    Container(
                      margin: EdgeInsets.only(
                          right: getProportionateScreenWidth(56)),
                      decoration: BoxDecoration(
                          borderRadius: BorderRadius.all(Radius.circular(10))),
                      child: Container(
                        // width: 200,
                        height: getProportionateScreenHeight(400),
                        child: Swiper(
                          itemBuilder: (BuildContext context, int index) {
                            return new Image.network(
                              "https://encrypted-tbn0.gstatic.com/images?q=tbn:ANd9GcRHX3IMYfQ3e4Umde-R6XlqHPTftd7PuHWBclyXqeTn1QMO2ikWswMpXzcgd1ztzXYns0g&usqp=CAU",
                              fit: BoxFit.fill,
                            );
                          },
                          itemCount: 3,
                          pagination: new RectSwiperPaginationBuilder(),
                          control: new SwiperControl(color: Colors.white ),
                        ),
                      ),
                    ),
                    Column(
                      mainAxisAlignment: MainAxisAlignment.spaceBetween,
                      children: [
                        SizedBox(
                          height: getProportionateScreenHeight(360),
                        ),
                        Row(
                          children: [
                            SizedBox(
                              width: getProportionateScreenWidth(5),
                            ),
                            Container(
                              // width: getProportionateScreenWidth(60),
                              decoration: BoxDecoration(
                                  color: Colors.white.withOpacity(0.6),
                                  // border: Border.all(
                                  //   color: Colors.white,
                                  // ),
                                  borderRadius:
                                      BorderRadius.all(Radius.circular(20))),
                              child: Padding(
                                padding: EdgeInsets.symmetric(
                                    vertical: getProportionateScreenWidth(5),
                                    horizontal:
                                        getProportionateScreenHeight(15)),
                                child: Center(
                                    child: Text(
                                  "FootBall",
                                  style: TextStyle(
                                      color: Color(0xff212f44),
                                      fontSize:
                                          getProportionateScreenWidth(12)),
                                )),
                              ),
                            ),
                            SizedBox(
                              width: getProportionateScreenWidth(5),
                            ),
                            Container(
                              // width: getProportionateScreenWidth(60),
                              decoration: BoxDecoration(
                                  color: Colors.white.withOpacity(0.6),
                                  // border: Border.all(
                                  //   color: Colors.white,
                                  // ),
                                  borderRadius:
                                      BorderRadius.all(Radius.circular(20))),
                              child: Padding(
                                padding: EdgeInsets.symmetric(
                                    vertical: getProportionateScreenWidth(5),
                                    horizontal:
                                        getProportionateScreenHeight(15)),
                                child: Center(
                                    child: Text(
                                  "FootBall",
                                  style: TextStyle(
                                      color: Color(0xff212f44),
                                      fontSize:
                                          getProportionateScreenWidth(12)),
                                )),
                              ),
                            ),
                            SizedBox(
                              width: getProportionateScreenWidth(5),
                            ),
                            Container(
                              // width: getProportionateScreenWidth(60),
                              decoration: BoxDecoration(
                                  color: Colors.white.withOpacity(0.6),
                                  // border: Border.all(
                                  //   color: Colors.white,
                                  // ),
                                  borderRadius:
                                      BorderRadius.all(Radius.circular(20))),
                              child: Padding(
                                padding: EdgeInsets.symmetric(
                                    vertical: getProportionateScreenWidth(5),
                                    horizontal:
                                        getProportionateScreenHeight(15)),
                                child: Center(
                                    child: Text(
                                  "FootBall",
                                  style: TextStyle(
                                      color: Color(0xff212f44),
                                      fontSize:
                                          getProportionateScreenWidth(12)),
                                )),
                              ),
                            ),
                          ],
                        ),
                      ],
                    )
                  ],
                ),
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
                          "About Me",
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
                SizedBox(
                  height: getProportionateScreenHeight(50),
                ),
                GestureDetector(
                  onTap: () {
                    launchURL();
                  },
                  child: Container(
                    width: getProportionateScreenWidth(180),
                    height: getProportionateScreenHeight(50),
                    padding: EdgeInsets.symmetric(
                        vertical: getProportionateScreenHeight(10),
                        horizontal: getProportionateScreenWidth(20)),
                    decoration: BoxDecoration(
                      color: Color(0xffffefc6),
                      borderRadius: BorderRadius.only(
                        topLeft: Radius.zero,
                        topRight: Radius.circular(20.0),
                        bottomLeft: Radius.zero,
                        bottomRight: Radius.circular(20.0),
                      ),
                    ),
                    child: Text(
                      "Let's have a chat !",
                      style: TextStyle(
                          fontFamily: "OpenSans",
                          fontWeight: FontWeight.bold,
                          color: Colors.black,
                          fontSize: getProportionateScreenWidth(15)),
                    ),
                  ),
                ),
                SizedBox(
                  height: getProportionateScreenHeight(70),
                ),
              ],
            ),
          ),
        ),
      ),
      Positioned(
        width: getProportionateScreenWidth(56),
        right: 0,
        child: Image(
            image: AssetImage("assets/images/rightbar.png")),
      ),
      Padding(
        padding: EdgeInsets.all(getProportionateScreenHeight(20)),
        child: Align(
          alignment: Alignment.topRight,
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
              Padding(
                padding: const EdgeInsets.symmetric(vertical: 8.0),
                child: FaIcon(FontAwesomeIcons.linkedin,
                    size: getProportionateScreenWidth(30)),
              ),
            ],
          ),
        ),
      ),
      Padding(
        padding: EdgeInsets.only(bottom: getProportionateScreenHeight(20)),
        child: Align(
            alignment: Alignment.bottomRight,
            child: RotatedBox(
              quarterTurns: 3,
              child: Text(
                "Aryan Solanki !",
                style: TextStyle(
                  fontFamily: "Playlist",
                  fontSize: getProportionateScreenWidth(40),
                  color: Color(0xff212f44),
                ),
              ),
            )),
      ),

      // Align(alignment: Alignment.topRight,child: Icon(Icons.menu,size: getProportionateScreenWidth(30),),),
    ]);
  }
}













