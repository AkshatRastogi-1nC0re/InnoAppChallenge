import 'dart:math';

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
  Map dict;
  Body({this.dict});
  @override
  _BodyState createState() => _BodyState(dict: dict);
}

class _BodyState extends State<Body> {
  Map dict;
  _BodyState({this.dict});

  @override
  GlobalKey<FlipCardState> cardKey = GlobalKey<FlipCardState>();
  Widget build(BuildContext context) {
    final _random = new Random();

    var StartingText = [
      "Hey, How are you ?",
      "You have the best smile…FYI",
      "Tell me about yourself",
      "Have you done anything exciting lately?",
      "What made you smile today?",
      "How did you meet the host?",
      "What’s your favorite form of social media?",
      "What was the last good book you read?",
      "Do you listen to any podcasts? Which is your favorite?",
      "What do you think is the best show on Netflix right now?",
      "Have you been on any interesting trips lately?",
      "What do you think has been the best movie of the year so far?",
      "What song do you wish you could put on right now?",
      "Are you a cat person or a dog person?",
      "Do you think you’re an introvert or an extrovert?",
      "If you didn’t have the job you have now, what would you be?",
      "What’s your strangest hidden talent?",
      "What is something people are always surprised to learn about you?",
      "What is the most rewarding part of your career?",
      "Where do you want to be in five years?",
      "What superpower do you wish you could have?",
      "Where would you go on vacation if you had no budget?",
      "If you could travel back in time, what decade would you choose to live in?",
      "What’s the best thing you’ve ever bought off Amazon?",
      "What’s the last concert you went to?",
      "What is one thing you can’t live without?",
      "What’s the strangest dream you’ve had recently?",
      "What is your favorite book of all time?",
      "How many countries have you been to?",
      "What’s your favorite city you’ve visited?",
      "Would you rather travel via plane or boat?",
      "Would you rather be really hot or really cold?",
      "What are your thoughts on the British royal family?",
      "Do you like documentaries? Have you watched any good ones recently?",
      "Who is your favorite celebrity couple ever?",
      "Which celebrity couple do you wish would get back together?",
      "If you could host a talk show, who would you have on first?",
      "What’s your favorite sport?",
      "What sport do you wish you were really good at?",
      "What’s the best holiday?",
      "How did you spend your last birthday?"
    ];

    String whatsapplink =
        "http://Wa.me/+91${dict["number"]}?text=${StartingText[_random.nextInt(StartingText.length)].replaceAll(' ', '+')}";

    String instaLink = dict["instaId"];
    String facebookLink = dict["snapchatId"];
    String linkedInLink = dict["linkedinId"];

    void launchURL() async => await canLaunch(whatsapplink)
        ? await launch(whatsapplink)
        : throw 'Could not launch $whatsapplink';

    void launchURLInsta() async => await canLaunch(instaLink)
        ? await launch(instaLink)
        : throw 'Could not launch $instaLink';

    void launchURLFacebook() async => await canLaunch(facebookLink)
        ? await launch(facebookLink)
        : throw 'Could not launch $facebookLink';

    void launchURLLinkedIn() async => await canLaunch(linkedInLink)
        ? await launch(linkedInLink)
        : throw 'Could not launch $linkedInLink';

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
                            return new Image.asset(
                              dict["image"],
                              fit: BoxFit.fill,
                            );
                          },
                          itemCount: 3,
                          pagination: new RectSwiperPaginationBuilder(),
                          control: new SwiperControl(color: Colors.white),
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
                                  dict["interest1"],
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
                                  dict["interest2"],
                                  style: TextStyle(
                                      color: Color(0xff212f44),
                                      fontSize:
                                          getProportionateScreenWidth(12)),
                                )),
                              ),
                            ),
                            // SizedBox(
                            //   width: getProportionateScreenWidth(5),
                            // ),
                            // Container(
                            //   // width: getProportionateScreenWidth(60),
                            //   decoration: BoxDecoration(
                            //       color: Colors.white.withOpacity(0.6),
                            //       // border: Border.all(
                            //       //   color: Colors.white,
                            //       // ),
                            //       borderRadius:
                            //           BorderRadius.all(Radius.circular(20))),
                            //   child: Padding(
                            //     padding: EdgeInsets.symmetric(
                            //         vertical: getProportionateScreenWidth(5),
                            //         horizontal:
                            //             getProportionateScreenHeight(15)),
                            //     child: Center(
                            //         child: Text(
                            //       "FootBall",
                            //       style: TextStyle(
                            //           color: Color(0xff212f44),
                            //           fontSize:
                            //               getProportionateScreenWidth(12)),
                            //     )),
                            //   ),
                            // ),
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
                          dict["descritions"],
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
        child: Image(image: AssetImage("assets/images/rightbar.png")),
      ),
      Padding(
        padding: EdgeInsets.all(getProportionateScreenHeight(20)),
        child: Align(
          alignment: Alignment.topRight,
          child: Column(
            children: [
              Padding(
                padding: const EdgeInsets.symmetric(vertical: 8),
                child: GestureDetector(
                  onTap: () {
                    launchURLInsta();
                  },
                  child: FaIcon(FontAwesomeIcons.instagramSquare,
                      color: Color(0xff212f44),
                      size: getProportionateScreenWidth(30)),
                ),
              ),
              Padding(
                padding: const EdgeInsets.symmetric(vertical: 8),
                child: GestureDetector(
                  onTap: () {
                    launchURLFacebook();
                  },
                  child: FaIcon(FontAwesomeIcons.facebook,
                      color: Color(0xff212f44),
                      size: getProportionateScreenWidth(30)),
                ),
              ),
              Padding(
                padding: const EdgeInsets.symmetric(vertical: 8),
                child: GestureDetector(
                  onTap: () {
                    launchURLLinkedIn();
                  },
                  child: FaIcon(FontAwesomeIcons.linkedin,
                      color: Color(0xff212f44),
                      size: getProportionateScreenWidth(30)),
                ),
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
                "${dict["name"]} !",
                style: TextStyle(
                  letterSpacing: 2,
                  fontFamily: "Playlist",
                  fontSize: getProportionateScreenWidth(34),
                  color: Color(0xff212f44),
                ),
              ),
            )),
      ),

      // Align(alignment: Alignment.topRight,child: Icon(Icons.menu,size: getProportionateScreenWidth(30),),),
    ]);
  }
}
