import 'package:flutter/material.dart';
import 'package:card_swiper/card_swiper.dart';
import 'package:flutter_staggered_grid_view/flutter_staggered_grid_view.dart';
import 'package:flip_card/flip_card.dart';
import 'package:socialbennett/screens/detail/detailscreen.dart';

import '../../../size_config.dart';

class Body extends StatefulWidget {
  @override
  _BodyState createState() => _BodyState();
}

class _BodyState extends State<Body> {
  @override
  GlobalKey<FlipCardState> cardKey = GlobalKey<FlipCardState>();

  var sampleUsers = [
    {
      "image": "assets/images/imagep4.png",
      "name": "Manvi Gupta",
      "course": "CA",
      "yog": "2021"
    },
    {
      "image": "assets/images/imagep1.png",
      "name": "Akshat Rastogi",
      "course": "CSE",
      "yog": "2024"
    },
    {
      "image": "assets/images/imagep2.png",
      "name": "Aryan Solanki",
      "course": "CSE",
      "yog": "2024"
    },
    {
      "image": "assets/images/imagep3.png",
      "name": "Yash Sharma",
      "course": "CSE",
      "yog": "2024"
    },
    {
      "image": "assets/images/imagep4.png",
      "name": "Manvi Gupta",
      "course": "CA",
      "yog": "2021"
    },
    {
      "image": "assets/images/imagep5.jpg",
      "name": "Shivangi Sharma",
      "course": "CSE",
      "yog": "2025"
    },
  ];

  Widget build(BuildContext context) {
    return Stack(children: [
      Container(
        decoration: BoxDecoration(
          image: DecorationImage(
              image: AssetImage("assets/images/background.png"),
              fit: BoxFit.cover),
        ),
        child: SingleChildScrollView(
          child: Container(
            child: Column(
              crossAxisAlignment: CrossAxisAlignment.start,
              children: [
                Padding(
                    padding: EdgeInsets.symmetric(
                        vertical: getProportionateScreenWidth(10),
                        horizontal: getProportionateScreenHeight(20)),
                    child: Column(
                      crossAxisAlignment: CrossAxisAlignment.start,
                      children: [
                        Text(
                          "नमस्ते,",
                          style: TextStyle(
                            fontSize: getProportionateScreenWidth(28),
                            color: Color(0xff212f44),
                            fontWeight: FontWeight.bold,
                          ),
                        ),
                        Text(
                          "  " + "Aryan !",
                          style: TextStyle(
                            fontFamily: "Playlist",
                            fontSize: getProportionateScreenWidth(50),
                            color: Color(0xff212f44),
                          ),
                        ),
                      ],
                    )),
                Container(
                    height: getProportionateScreenHeight(310),
                    child: Swiper(
                      physics: NeverScrollableScrollPhysics(),
                      itemBuilder: (BuildContext context, int index) {
                        return GestureDetector(
                          onTap: () {
                            Navigator.push(
                              context,
                              MaterialPageRoute(
                                  builder: (context) => DetailScreen()),
                            );
                          },
                          child: Stack(
                            children: [
                              ClipRRect(
                                borderRadius: BorderRadius.circular(8.0),
                                child: Image.asset(
                                  sampleUsers[index]["image"],
                                  fit: BoxFit.fill,
                                ),
                              ),
                              Padding(
                                padding: EdgeInsets.only(left: 5),
                                child: Column(
                                  mainAxisAlignment:
                                      MainAxisAlignment.spaceBetween,
                                  crossAxisAlignment: CrossAxisAlignment.start,
                                  children: [
                                    Column(
                                      crossAxisAlignment:
                                          CrossAxisAlignment.start,
                                      children: [
                                        Text(
                                          sampleUsers[index]["name"],
                                          style: TextStyle(
                                            fontSize:
                                                getProportionateScreenWidth(26),
                                            color: Colors.white,
                                            fontFamily: "OpenSans",
                                            fontWeight: FontWeight.w800,
                                          ),
                                        ),
                                        Text(
                                          "${sampleUsers[index]["course"]},${sampleUsers[index]["yog"]}",
                                          style: TextStyle(
                                            fontSize:
                                                getProportionateScreenWidth(14),
                                            color: Colors.white,
                                            fontFamily: "OpenSans",
                                            fontWeight: FontWeight.w500,
                                          ),
                                        ),
                                      ],
                                    ),
                                    Padding(
                                      padding: EdgeInsets.only(
                                          bottom:
                                              getProportionateScreenHeight(20)),
                                      child: Row(
                                        children: [
                                          Container(
                                            // width: getProportionateScreenWidth(60),
                                            decoration: BoxDecoration(
                                                color: Colors.white
                                                    .withOpacity(0.6),
                                                // border: Border.all(
                                                //   color: Colors.white,
                                                // ),
                                                borderRadius: BorderRadius.all(
                                                    Radius.circular(20))),
                                            child: Padding(
                                              padding: EdgeInsets.symmetric(
                                                  vertical:
                                                      getProportionateScreenWidth(
                                                          5),
                                                  horizontal:
                                                      getProportionateScreenHeight(
                                                          15)),
                                              child: Center(
                                                  child: Text(
                                                "FootBall",
                                                style: TextStyle(
                                                    color: Color(0xff212f44),
                                                    fontSize:
                                                        getProportionateScreenWidth(
                                                            13)),
                                              )),
                                            ),
                                          ),
                                          SizedBox(
                                            width:
                                                getProportionateScreenWidth(10),
                                          ),
                                          Container(
                                            // width: getProportionateScreenWidth(60),
                                            decoration: BoxDecoration(
                                                color: Colors.white
                                                    .withOpacity(0.6),
                                                // border: Border.all(
                                                //   color: Colors.white,
                                                // ),
                                                borderRadius: BorderRadius.all(
                                                    Radius.circular(20))),
                                            child: Padding(
                                              padding: EdgeInsets.symmetric(
                                                  vertical:
                                                      getProportionateScreenWidth(
                                                          5),
                                                  horizontal:
                                                      getProportionateScreenHeight(
                                                          15)),
                                              child: Center(
                                                  child: Text(
                                                "FootBall",
                                                style: TextStyle(
                                                    color: Color(0xff212f44),
                                                    fontSize:
                                                        getProportionateScreenWidth(
                                                            13)),
                                              )),
                                            ),
                                          )
                                        ],
                                      ),
                                    ),
                                  ],
                                ),
                              )
                            ],
                          ),
                        );
                      },
                      itemCount: sampleUsers.length,
                      itemWidth: 300.0,
                      layout: SwiperLayout.STACK,
                    )),
                Padding(
                  padding: EdgeInsets.symmetric(
                      vertical: getProportionateScreenWidth(10),
                      horizontal: getProportionateScreenHeight(20)),
                  child: Text(
                    "Anime",
                    style: TextStyle(
                      fontSize: getProportionateScreenWidth(26),
                      fontFamily: "OpenSans",
                      color: Color(0xff212f44),
                    ),
                  ),
                ),
                Container(
                  width: getProportionateScreenWidth(320),
                  height: getProportionateScreenHeight(165),
                  child: ListView.builder(
                      itemCount: 10,
                      scrollDirection: Axis.horizontal,
                      shrinkWrap: true,
                      itemBuilder: (BuildContext context, int index) {
                        return Padding(
                          padding: EdgeInsets.symmetric(
                              horizontal: getProportionateScreenWidth(10)),
                          child: Stack(
                            children: [
                              Container(
                                child: ClipRRect(
                                  borderRadius: BorderRadius.circular(10.0),
                                  child: Image.network(
                                    "https://d2qp0siotla746.cloudfront.net/img/use-cases/profile-picture/template_3.jpg",
                                    fit: BoxFit.fill,
                                  ),
                                ),
                              ),
                              Padding(
                                padding: EdgeInsets.only(left: 5),
                                child: Column(
                                  crossAxisAlignment: CrossAxisAlignment.start,
                                  children: [
                                    Text(
                                      "Yash Sharma",
                                      style: TextStyle(
                                        fontSize:
                                            getProportionateScreenWidth(15),
                                        color: Colors.white,
                                        fontFamily: "OpenSans",
                                        fontWeight: FontWeight.w800,
                                      ),
                                    ),
                                    Text(
                                      "CSE,2024",
                                      style: TextStyle(
                                        fontSize:
                                            getProportionateScreenWidth(12),
                                        color: Colors.white,
                                        fontFamily: "OpenSans",
                                        fontWeight: FontWeight.w500,
                                      ),
                                    ),
                                  ],
                                ),
                              )
                            ],
                          ),
                        );
                      }),
                ),
                Padding(
                  padding: EdgeInsets.symmetric(
                      vertical: getProportionateScreenWidth(10),
                      horizontal: getProportionateScreenHeight(20)),
                  child: Text(
                    "Coding",
                    style: TextStyle(
                      fontSize: getProportionateScreenWidth(26),
                      fontFamily: "OpenSans",
                      color: Color(0xff212f44),
                    ),
                  ),
                ),
                Container(
                  height: 600,
                  width: getProportionateScreenWidth(320),
                  padding: const EdgeInsets.all(4.0),
                  child: StaggeredGridView.countBuilder(
                    physics: NeverScrollableScrollPhysics(),
                    crossAxisCount: 4,
                    itemCount: 6,
                    itemBuilder: (BuildContext context, int index) =>
                        new Container(
                      child: FlipCard(
                        direction: FlipDirection.HORIZONTAL, // default
                        front: ClipRRect(
                          borderRadius: BorderRadius.circular(10.0),
                          child: Container(
                            child: Stack(
                              children: [
                                index % 2 == 0
                                    ? Align(
                                        alignment: Alignment.bottomCenter,
                                        child: Container(
                                          height:
                                              getProportionateScreenHeight(55),
                                          width: double.maxFinite,
                                          color: Colors.black.withOpacity(0.7),
                                          child: Column(
                                            mainAxisSize: MainAxisSize.min,
                                            crossAxisAlignment:
                                                CrossAxisAlignment.start,
                                            children: [
                                              SizedBox(
                                                height:
                                                    getProportionateScreenHeight(
                                                        5),
                                              ),
                                              Center(
                                                child: Text(
                                                  "Yash Sharma",
                                                  style: TextStyle(
                                                    fontSize:
                                                        getProportionateScreenWidth(
                                                            15),
                                                    color: Colors.white,
                                                    fontFamily: "OpenSans",
                                                    fontWeight: FontWeight.w800,
                                                  ),
                                                ),
                                              ),
                                              Center(
                                                child: Text(
                                                  "CSE,2024",
                                                  style: TextStyle(
                                                    fontSize:
                                                        getProportionateScreenWidth(
                                                            12),
                                                    color: Colors.white,
                                                    fontFamily: "OpenSans",
                                                    fontWeight: FontWeight.w500,
                                                  ),
                                                ),
                                              ),
                                            ],
                                          ),
                                        ),
                                      )
                                    : Center(),
                                Container(
                                  child: Image.network(
                                    "https://d2qp0siotla746.cloudfront.net/img/use-cases/profile-picture/template_3.jpg",
                                    fit: BoxFit.fill,
                                  ),
                                ),
                                index % 2 != 0
                                    ? Align(
                                        alignment: Alignment.bottomCenter,
                                        child: Container(
                                          height:
                                              getProportionateScreenHeight(55),
                                          width: double.maxFinite,
                                          color: Colors.white.withOpacity(0.7),
                                          child: Column(
                                            mainAxisSize: MainAxisSize.min,
                                            crossAxisAlignment:
                                                CrossAxisAlignment.start,
                                            children: [
                                              Center(
                                                child: Text(
                                                  "Yash Sharma",
                                                  style: TextStyle(
                                                    fontSize:
                                                        getProportionateScreenWidth(
                                                            15),
                                                    color: Colors.black,
                                                    fontFamily: "OpenSans",
                                                    fontWeight: FontWeight.w800,
                                                  ),
                                                ),
                                              ),
                                              Center(
                                                child: Text(
                                                  "CSE,2024",
                                                  style: TextStyle(
                                                    fontSize:
                                                        getProportionateScreenWidth(
                                                            12),
                                                    fontFamily: "OpenSans",
                                                    color: index % 2 == 0
                                                        ? Colors.white
                                                        : Colors.black,
                                                    fontWeight: FontWeight.w500,
                                                  ),
                                                ),
                                              ),
                                            ],
                                          ),
                                        ),
                                      )
                                    : Center(),
                              ],
                            ),
                          ),
                        ),
                        back: ClipRRect(
                          borderRadius: BorderRadius.circular(10.0),
                          child: Container(
                              decoration: BoxDecoration(
                                color: Color(0xffffefc5),
                                image: DecorationImage(
                                  image: new AssetImage(
                                      'assets/images/lightlogo.png'),
                                ),
                              ),
                              child: Column(
                                mainAxisAlignment:
                                    MainAxisAlignment.spaceBetween,
                                children: [
                                  Padding(
                                    padding: EdgeInsets.only(
                                        top: getProportionateScreenHeight(15)),
                                    child: Text(
                                      "Lorem ipsum dolor sit amet coonsequuntur voluptatum laboruuas aliquid. Reprehenderit, quia. Quo neque error repudiandae fuga? ",
                                      textAlign: TextAlign.center,
                                      style: TextStyle(
                                          fontFamily: "OpenSans",
                                          color: Colors.black,
                                          fontSize:
                                              getProportionateScreenWidth(12)),
                                    ),
                                  ),
                                  GestureDetector(
                                    onTap: () {
                                      print("gfffdfdd");
                                    },
                                    child: Align(
                                      alignment: Alignment.bottomRight,
                                      child: Text(
                                        "See More",
                                        style: TextStyle(
                                            fontFamily: "OpenSans",
                                            color: Colors.blue),
                                      ),
                                    ),
                                  )
                                ],
                              )),
                        ),
                      ),
                    ),
                    staggeredTileBuilder: (int index) =>
                        new StaggeredTile.count(2, index.isEven ? 2.5 : 1.9),
                    mainAxisSpacing: 4.0,
                    crossAxisSpacing: 4.0,
                  ),
                ),
                SizedBox(
                  height: getProportionateScreenHeight(20),
                )
              ],
            ),
          ),
        ),
      ),
    ]);
  }
}