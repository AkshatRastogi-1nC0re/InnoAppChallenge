import 'package:flutter/material.dart';
import 'package:card_swiper/card_swiper.dart';
import 'package:flutter_staggered_grid_view/flutter_staggered_grid_view.dart';
import 'package:flip_card/flip_card.dart';
import 'package:socialbennett/screens/detail/detailscreen.dart';

import '../../../size_config.dart';
import "dart:math";

class Body extends StatefulWidget {
  @override
  _BodyState createState() => _BodyState();
}

class _BodyState extends State<Body> {
  @override
  GlobalKey<FlipCardState> cardKey = GlobalKey<FlipCardState>();

  List<Map> sampleUsers = [
    {
      "image": "assets/images/imagep16.jpg",
      "name": "Akanksha Solanki",
      "course": "BBA",
      "yog": "2022",
      "number": "9826723647",
      "descritions":
          """I love meeting new faces and always in pursuit of doing different things and connecting with like-minded people.
  We are going to be a hit from the start if you're like me too and enjoy exploring different stuff.""",
      "flipperDescription": "I’m the exception",
      "interest1": "Singing",
      "interest2": "Acting",
      "instaId": "https://www.instagram.com/akanksha_solanki/",
      "snapchatId": "https://www.facebook.com/akanksha.solanki.56/",
      "linkedinId": "https://www.linkedin.com/in/akanksha-solanki-759b391a5/",
    },
    {
      "image": "assets/images/imagep2.png",
      "name": "Vansh Singh",
      "course": "BA JMC",
      "yog": "2021",
      "number": "9846758390",
      "descritions":
          """I love meeting new faces and always in pursuit of doing different things and connecting with like-minded people.
  We are going to be a hit from the start if you're like me too and enjoy exploring different stuff.""",
      "flipperDescription": "Humble, with just a hint of Kanye",
      "interest1": "Writer",
      "interest2": "Foodie",
      "instaId": "https://www.instagram.com/vanshsingh._/",
      "snapchatId": "https://www.facebook.com/vansh.singh.3304",
      "linkedinId": "https://www.linkedin.com/in/vansh-singh-00524714a/",
    },
    {
      "image": "assets/images/imagep1.png",
      "name": "Tushar Rajput",
      "course": "BCA",
      "yog": "2023",
      "number": "9812337457",
      "descritions":
          """I love meeting new faces and always in pursuit of doing different things and connecting with like-minded people.
  We are going to be a hit from the start if you're like me too and enjoy exploring different stuff.""",
      "flipperDescription":
          "I’m actually not funny. I’m just really mean but people always think I’m joking",
      "interest1": "Traveller",
      "interest2": "Movie Buff",
      "instaId": "https://www.instagram.com/tusharrajput._/",
      "snapchatId": "https://www.facebook.com/tushar.rajput.7564",
      "linkedinId": "https://www.linkedin.com/in/tushar325/",
    },
    {
      "image": "assets/images/imagep4.png",
      "name": "Aneesha Sharma",
      "course": "BA",
      "yog": "2023",
      "number": "9874578254",
      "descritions":
          """I love meeting new faces and always in pursuit of doing different things and connecting with like-minded people.
  We are going to be a hit from the start if you're like me too and enjoy exploring different stuff.""",
      "flipperDescription": "Trying to watch more sunsets than Netflix",
      "interest1": "Reading",
      "interest2": "Singing",
      "instaId": "https://www.instagram.com/aneeshasharma/",
      "snapchatId": "https://www.facebook.com/funky.aneesha",
      "linkedinId": "https://www.linkedin.com/in/aneesharma/",
    },
    {
      "image": "assets/images/imagep11.jpg",
      "name": "Shivangi Sharma",
      "course": "CSE",
      "yog": "2025",
      "number": " 8839845873",
      "descritions":
          """I love meeting new faces and always in pursuit of doing different things and connecting with like-minded people.
  We are going to be a hit from the start if you're like me too and enjoy exploring different stuff.""",
      "flipperDescription": "Trying to watch more sunsets than Netflix",
      "interest1": "art",
      "interest2": "dancing",
      "instaId": "https://www.instagram.com/manvigupta___/",
      "facebookId": "https://www.instagram.com/manvigupta___/",
      "linkedinId": "https://www.linkedin.com/in/manvi-gupta-aa430b17a/",
    },
    {
      "image": "assets/images/imagep6.jpg",
      "name": "Jasmeet Kaur",
      "course": "BBA",
      "yog": "2022",
      "number": "8465725473",
      "descritions":
          """I love meeting new faces and always in pursuit of doing different things and connecting with like-minded people.
  We are going to be a hit from the start if you're like me too and enjoy exploring different stuff.""",
      "flipperDescription":
          "I might not know who I am but I know where I want to be. Right here in paradise.",
      "interest1": "Food Lover",
      "interest2": "Shopaholic",
      "instaId": "https://www.instagram.com/jasmeetkaur_11/",
      "snapchatId": "https://www.facebook.com/profile.php?id=100034925682907",
      "linkedinId": "https://www.linkedin.com/in/jasmeet-kaur-061a6754/",
    },
    {
      "image": "assets/images/imagep7.jpg",
      "name": "Kanika Sharma",
      "course": "Computer Science",
      "yog": "2022",
      "number": "8726486266",
      "descritions":
          """I love meeting new faces and always in pursuit of doing different things and connecting with like-minded people.
  We are going to be a hit from the start if you're like me too and enjoy exploring different stuff.""",
      "flipperDescription":
          "It’s better to be a lonely lion than a popular sheep",
      "interest1": "Code Geek",
      "interest2": "Avid Reader",
      "instaId": "https://www.instagram.com/kanikashrma09/",
      "snapchatId": "https://www.facebook.com/profile.php?id=100026312897167",
      "linkedinId": "https://www.linkedin.com/in/kanika-sharma-b5926910a/",
    },
    {
      "image": "assets/images/imagep8.jpg",
      "name": "Anurag Singhania",
      "course": "BA LLB",
      "yog": "2025",
      "number": "7364825484",
      "descritions":
          """I love meeting new faces and always in pursuit of doing different things and connecting with like-minded people.
  We are going to be a hit from the start if you're like me too and enjoy exploring different stuff.""",
      "flipperDescription": "I strive to impress myself",
      "interest1": "Fashion",
      "interest2": "Vlogger",
      "instaId": "https://www.instagram.com/ianuragsinghania/",
      "snapchatId": "https://www.facebook.com/anurag.singhania.355",
      "linkedinId": "https://www.linkedin.com/in/anurag-singhania-0525281b9/",
    },
  ];

  var Cat1users = [
    {
      "image": "assets/images/imagep9.jpg",
      "name": "Saumya Gupta",
      "course": "B Tech",
      "yog": "2024",
      "number": "7629635474",
      "descritions":
          """I love meeting new faces and always in pursuit of doing different things and connecting with like-minded people.
  We are going to be a hit from the start if you're like me too and enjoy exploring different stuff.""",
      "flipperDescription": "I strive to impress myself",
      "interest1": "Traveller",
      "interest2": "foodie",
      "instaId": "https://www.instagram.com/sauuumyaaa/",
      "snapchatId": " https://www.facebook.com/saumya.gupta.71216141",
      "linkedinId": " https://www.linkedin.com/in/saumya-gupta-429606209/",
    },
    {
      "image": "assets/images/imagep10.jpg",
      "name": "Aakash Mitra",
      "course": "BA",
      "yog": "2022",
      "number": "7693756836",
      "descritions":
          """I love meeting new faces and always in pursuit of doing different things and connecting with like-minded people.
  We are going to be a hit from the start if you're like me too and enjoy exploring different stuff.""",
      "flipperDescription":
          "I don’t care what people think of me. This is me in rawest form.",
      "interest1": "Bookworm",
      "interest2": "Carismatic",
      "instaId": "https://www.instagram.com/iamaakashmitra/",
      "snapchatId": " https://www.facebook.com/aakash.mitra.334",
      "linkedinId": " https://www.linkedin.com/in/aakash-mitra-11143b171/",
    },
    {
      "image": "assets/images/imagep11.jpg",
      "name": "Shivangi Sharma",
      "course": "CSE",
      "yog": "2025",
      "number": " 8839845873",
      "descritions":
          """I love meeting new faces and always in pursuit of doing different things and connecting with like-minded people.
  We are going to be a hit from the start if you're like me too and enjoy exploring different stuff.""",
      "interest1": "art",
      "flipperDescription":
          "I don’t care what people think of me. This is me in rawest form.",
      "interest2": "dancing",
      "instaId": "https://www.instagram.com/manvigupta___/",
      "facebookId": "https://www.instagram.com/manvigupta___/",
      "linkedinId": "https://www.linkedin.com/in/manvi-gupta-aa430b17a/",
    },
    {
      "image": "assets/images/imagep12.jpg",
      "name": "Jasmeet Kaur",
      "course": "BBA",
      "yog": "2022",
      "number": "8465725473",
      "descritions":
          """I love meeting new faces and always in pursuit of doing different things and connecting with like-minded people.
  We are going to be a hit from the start if you're like me too and enjoy exploring different stuff.""",
      "flipperDescription": "Anything but predictable....Nah!",
      "interest1": "Food Lover",
      "interest2": "Shopaholic",
      "instaId": "https://www.instagram.com/jasmeetkaur_11/",
      "snapchatId": "https://www.facebook.com/profile.php?id=100034925682907",
      "linkedinId": "https://www.linkedin.com/in/jasmeet-kaur-061a6754/",
    },
    {
      "image": "assets/images/imagep13.jpg",
      "name": "Kanika Sharma",
      "course": "Computer Science",
      "yog": "2022",
      "number": "8726486266",
      "descritions":
          """I love meeting new faces and always in pursuit of doing different things and connecting with like-minded people.
  We are going to be a hit from the start if you're like me too and enjoy exploring different stuff.""",
      "flipperDescription":
          "I’m actually not funny. I’m just really mean but people always think I’m joking",
      "interest1": "Code Geek",
      "interest2": "Avid Reader",
      "instaId": "https://www.instagram.com/kanikashrma09/",
      "snapchatId": "https://www.facebook.com/profile.php?id=100026312897167",
      "linkedinId": "https://www.linkedin.com/in/kanika-sharma-b5926910a/",
    },
  ];

  var Cat2users = [
    {
      "image": "assets/images/imagep10.jpg",
      "name": "Aakash Mitra",
      "course": "BA",
      "yog": "2022",
      "number": "7693756836",
      "descritions":
          """I love meeting new faces and always in pursuit of doing different things and connecting with like-minded people.
  We are going to be a hit from the start if you're like me too and enjoy exploring different stuff.""",
      "flipperDescription":
          "I’m actually not funny. I’m just really mean but people always think I’m joking",
      "interest1": "Bookworm",
      "interest2": "Carismatic",
      "instaId": "https://www.instagram.com/iamaakashmitra/",
      "snapchatId": " https://www.facebook.com/aakash.mitra.334",
      "linkedinId": " https://www.linkedin.com/in/aakash-mitra-11143b171/",
    },
    {
      "image": "assets/images/imagep11.jpg",
      "name": "Shivangi Sharma",
      "course": "CSE",
      "yog": "2025",
      "number": "8839845873",
      "descritions":
          """I love meeting new faces and always in pursuit of doing different things and connecting with like-minded people.
  We are going to be a hit from the start if you're like me too and enjoy exploring different stuff.""",
      "flipperDescription":
          "I might not know who I am but I know where I want to be. Right here in paradise.",
      "interest1": "art",
      "interest2": "dancing",
      "instaId": "https://www.instagram.com/manvigupta___/",
      "facebookId": "https://www.instagram.com/manvigupta___/",
      "linkedinId": "https://www.linkedin.com/in/manvi-gupta-aa430b17a/",
    },
    {
      "image": "assets/images/imagep17.jpg",
      "name": "Jasmeet Kaur",
      "course": "BBA",
      "yog": "2022",
      "number": "8465725473",
      "descritions":
          """I love meeting new faces and always in pursuit of doing different things and connecting with like-minded people.
  We are going to be a hit from the start if you're like me too and enjoy exploring different stuff.""",
      "flipperDescription":
          "I’m actually not funny. I’m just really mean but people always think I’m joking",
      "interest1": "Food Lover",
      "interest2": "Shopaholic",
      "instaId": "https://www.instagram.com/jasmeetkaur_11/",
      "snapchatId": "https://www.facebook.com/profile.php?id=100034925682907",
      "linkedinId": "https://www.linkedin.com/in/jasmeet-kaur-061a6754/",
    },
    {
      "image": "assets/images/imagep21.jpg",
      "name": "Kanika Sharma",
      "course": "Computer Science",
      "yog": "2022",
      "number": "8726486266",
      "descritions":
          """I love meeting new faces and always in pursuit of doing different things and connecting with like-minded people.
  We are going to be a hit from the start if you're like me too and enjoy exploring different stuff.""",
      "flipperDescription":
          "I’m actually not funny. I’m just really mean but people always think I’m joking",
      "interest1": "Code Geek",
      "interest2": "Avid Reader",
      "instaId": "https://www.instagram.com/kanikashrma09/",
      "snapchatId": "https://www.facebook.com/profile.php?id=100026312897167",
      "linkedinId": "https://www.linkedin.com/in/kanika-sharma-b5926910a/",
    },
    {
      "image": "assets/images/imagep21.jpg",
      "name": "Saumya Gupta",
      "course": "B Tech",
      "yog": "2024",
      "number": "7629635474",
      "descritions":
          """I love meeting new faces and always in pursuit of doing different things and connecting with like-minded people.
  We are going to be a hit from the start if you're like me too and enjoy exploring different stuff.""",
      "flipperDescription":
          "I’m actually not funny. I’m just really mean but people always think I’m joking",
      "interest1": "Traveller",
      "interest2": "foodie",
      "instaId": "https://www.instagram.com/sauuumyaaa/",
      "snapchatId": " https://www.facebook.com/saumya.gupta.71216141",
      "linkedinId": " https://www.linkedin.com/in/saumya-gupta-429606209/",
    },
  ];

  var Cat3users = [
    {
      "image": "assets/images/imagep16.jpg",
      "name": "Akanksha Solanki",
      "course": "BBA",
      "yog": "2022",
      "number": "9826723647",
      "descritions":
          """I love meeting new faces and always in pursuit of doing different things and connecting with like-minded people.
  We are going to be a hit from the start if you're like me too and enjoy exploring different stuff.""",
      "flipperDescription":
          "I’m actually not funny. I’m just really mean but people always think I’m joking",
      "interest1": "Singing",
      "interest2": "Acting",
      "instaId": "https://www.instagram.com/akanksha_solanki/",
      "snapchatId": "https://www.facebook.com/akanksha.solanki.56/",
      "linkedinId": "https://www.linkedin.com/in/akanksha-solanki-759b391a5/",
    },
    {
      "image": "assets/images/imagep7.jpg",
      "name": "Vansh Singh",
      "course": "BA JMC",
      "yog": "2021",
      "number": "9846758390",
      "descritions":
          """I love meeting new faces and always in pursuit of doing different things and connecting with like-minded people.
  We are going to be a hit from the start if you're like me too and enjoy exploring different stuff.""",
      "flipperDescription":
          "I’m actually not funny. I’m just really mean but people always think I’m joking",
      "interest1": "Writer",
      "interest2": "Foodie",
      "instaId": "https://www.instagram.com/vanshsingh._/",
      "snapchatId": "https://www.facebook.com/vansh.singh.3304",
      "linkedinId": "https://www.linkedin.com/in/vansh-singh-00524714a/",
    },
    {
      "image": "assets/images/imagep1.png",
      "name": "Tushar Rajput",
      "course": "BCA",
      "yog": "2023",
      "number": "9812337457",
      "descritions":
          """I love meeting new faces and always in pursuit of doing different things and connecting with like-minded people.
  We are going to be a hit from the start if you're like me too and enjoy exploring different stuff.""",
      "flipperDescription":
          "I’m actually not funny. I’m just really mean but people always think I’m joking",
      "interest1": "Traveller",
      "interest2": "Movie Buff",
      "instaId": "https://www.instagram.com/tusharrajput._/",
      "snapchatId": "https://www.facebook.com/tushar.rajput.7564",
      "linkedinId": "https://www.linkedin.com/in/tushar325/",
    },
    {
      "image": "assets/images/imagep3.png",
      "name": "Aneesha Sharma",
      "course": "BA",
      "yog": "2023",
      "number": "9874578254",
      "descritions":
          """I love meeting new faces and always in pursuit of doing different things and connecting with like-minded people.
  We are going to be a hit from the start if you're like me too and enjoy exploring different stuff.""",
      "flipperDescription":
          "I’m actually not funny. I’m just really mean but people always think I’m joking",
      "interest1": "Reading",
      "interest2": "Singing",
      "instaId": "https://www.instagram.com/aneeshasharma/",
      "snapchatId": "https://www.facebook.com/funky.aneesha",
      "linkedinId": "https://www.linkedin.com/in/aneesharma/",
    },
    {
      "image": "assets/images/imagep11.jpg",
      "name": "Shivangi Sharma",
      "course": "CSE",
      "yog": "2025",
      "number": " 8839845873",
      "descritions":
          """I love meeting new faces and always in pursuit of doing different things and connecting with like-minded people.
  We are going to be a hit from the start if you're like me too and enjoy exploring different stuff.""",
      "flipperDescription":
          "I don’t care what people think of me. This is me in rawest form.",
      "interest1": "art",
      "interest2": "dancing",
      "instaId": "https://www.instagram.com/manvigupta___/",
      "facebookId": "https://www.instagram.com/manvigupta___/",
      "linkedinId": "https://www.linkedin.com/in/manvi-gupta-aa430b17a/",
    },
    {
      "image": "assets/images/imagep17.jpg",
      "name": "Jasmeet Kaur",
      "course": "BBA",
      "yog": "2022",
      "number": "8465725473",
      "descritions":
          """I love meeting new faces and always in pursuit of doing different things and connecting with like-minded people.
  We are going to be a hit from the start if you're like me too and enjoy exploring different stuff.""",
      "flipperDescription":
          "I’m actually not funny. I’m just really mean but people always think I’m joking",
      "interest1": "Food Lover",
      "interest2": "Shopaholic",
      "instaId": "https://www.instagram.com/jasmeetkaur_11/",
      "snapchatId": "https://www.facebook.com/profile.php?id=100034925682907",
      "linkedinId": "https://www.linkedin.com/in/jasmeet-kaur-061a6754/",
    },
  ];

  var listInterest = [
    "Art",
    "Dancing",
    "Marketing",
    "Designing",
    "Coding",
    "Gym",
    "Clubbing",
    "Chess"
  ];

  Widget build(BuildContext context) {
    final _random = new Random();
    return Stack(children: [
      Positioned(
        width: getProportionateScreenWidth(55),
        right: 0,
        child: Image(image: AssetImage("assets/images/rightbar.png")),
      ),
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
                                  builder: (context) =>
                                      DetailScreen(dict: sampleUsers[index])),
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
                                                sampleUsers[index]["interest1"],
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
                                                sampleUsers[index]["interest2"],
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
                      itemCount: 5,
                      itemWidth: 300.0,
                      layout: SwiperLayout.STACK,
                    )),
                Padding(
                  padding: EdgeInsets.symmetric(
                      vertical: getProportionateScreenWidth(10),
                      horizontal: getProportionateScreenHeight(10)),
                  child: Text(
                    "#YourBatchmates 🎓",
                    style: TextStyle(
                      fontWeight: FontWeight.bold,
                      fontSize: getProportionateScreenWidth(20),
                      fontFamily: "OpenSans",
                      color: Color(0xff212f44),
                    ),
                  ),
                ),
                Container(
                  width: getProportionateScreenWidth(320),
                  height: getProportionateScreenHeight(130),
                  child: ListView.builder(
                      itemCount: Cat1users.length,
                      scrollDirection: Axis.horizontal,
                      shrinkWrap: true,
                      itemBuilder: (BuildContext context, int index) {
                        return FlipCard(
                          direction: FlipDirection.VERTICAL,
                          front: Padding(
                            padding: EdgeInsets.symmetric(
                                horizontal: getProportionateScreenWidth(10)),
                            child: Container(
                              height: getProportionateScreenHeight(130),
                              child: ClipRRect(
                                borderRadius: BorderRadius.circular(10.0),
                                child: Image.asset(
                                  Cat1users[index]["image"],
                                  fit: BoxFit.fill,
                                ),
                              ),
                            ),
                          ),
                          back: ClipRRect(
                            borderRadius: BorderRadius.circular(10.0),
                            child: Container(
                                width: getProportionateScreenWidth(100),
                                decoration: BoxDecoration(
                                  color: Color(0xffffefc5),
                                  image: DecorationImage(
                                    image: new AssetImage(
                                        'assets/images/lightlogo.png'),
                                  ),
                                ),
                                child: Padding(
                                  padding: EdgeInsets.only(left: 5, top: 2),
                                  child: Column(
                                    mainAxisAlignment:
                                        MainAxisAlignment.spaceBetween,
                                    children: [
                                      Column(
                                        crossAxisAlignment:
                                            CrossAxisAlignment.start,
                                        children: [
                                          FittedBox(
                                            child: Text(
                                              Cat1users[index]["name"],
                                              style: TextStyle(
                                                fontSize:
                                                    getProportionateScreenWidth(
                                                        12),
                                                color: Colors.black,
                                                fontFamily: "OpenSans",
                                                fontWeight: FontWeight.w800,
                                              ),
                                            ),
                                          ),
                                          Text(
                                            "${Cat1users[index]["course"]},${Cat1users[index]["yog"]}",
                                            style: TextStyle(
                                              fontSize:
                                                  getProportionateScreenWidth(
                                                      10),
                                              color: Colors.black,
                                              fontFamily: "OpenSans",
                                              fontWeight: FontWeight.w500,
                                            ),
                                          ),
                                        ],
                                      ),
                                      GestureDetector(
                                        onTap: () {
                                          Navigator.push(
                                            context,
                                            MaterialPageRoute(
                                                builder: (context) =>
                                                    DetailScreen(
                                                        dict:
                                                            Cat1users[index])),
                                          );
                                        },
                                        child: Align(
                                          alignment: Alignment.bottomRight,
                                          child: Text(
                                            "See More",
                                            style: TextStyle(
                                                fontFamily: "OpenSans",
                                                color: Colors.blue,
                                                fontSize:
                                                    getProportionateScreenWidth(
                                                        11)),
                                          ),
                                        ),
                                      )
                                    ],
                                  ),
                                )),
                          ),
                        );
                      }),
                ),
                Padding(
                  padding: EdgeInsets.symmetric(
                      vertical: getProportionateScreenWidth(10),
                      horizontal: getProportionateScreenHeight(10)),
                  child: Text(
                    " #MovieBuffs  🎬",
                    style: TextStyle(
                      fontWeight: FontWeight.bold,
                      fontSize: getProportionateScreenWidth(20),
                      fontFamily: "OpenSans",
                      color: Color(0xff212f44),
                    ),
                  ),
                ),
                Container(
                  height: 350,
                  width: getProportionateScreenWidth(320),
                  padding: const EdgeInsets.all(4.0),
                  child: StaggeredGridView.countBuilder(
                    physics: NeverScrollableScrollPhysics(),
                    crossAxisCount: 4,
                    itemCount: 4,
                    itemBuilder: (BuildContext context, int index) =>
                        new Container(
                      child: FlipCard(
                        direction: FlipDirection.HORIZONTAL, // default
                        front: ClipRRect(
                          borderRadius: BorderRadius.circular(10.0),
                          child: Container(
                            child: Stack(
                              children: [
                                Container(
                                  child: Image.asset(
                                    Cat2users[index]["image"],
                                    fit: BoxFit.fill,
                                  ),
                                ),
                                Align(
                                  alignment: Alignment.bottomCenter,
                                  child: Container(
                                    height: getProportionateScreenHeight(40),
                                    width: double.maxFinite,
                                    color: Colors.white.withOpacity(0.7),
                                    child: Column(
                                      mainAxisSize: MainAxisSize.min,
                                      crossAxisAlignment:
                                          CrossAxisAlignment.start,
                                      children: [
                                        Center(
                                          child: Text(
                                            Cat2users[index]["name"],
                                            style: TextStyle(
                                              fontSize:
                                                  getProportionateScreenWidth(
                                                      12),
                                              color: Colors.black,
                                              fontFamily: "OpenSans",
                                              fontWeight: FontWeight.w800,
                                            ),
                                          ),
                                        ),
                                        Center(
                                          child: Text(
                                            "${Cat2users[index]["course"]},${Cat2users[index]["yog"]}",
                                            style: TextStyle(
                                              fontSize:
                                                  getProportionateScreenWidth(
                                                      10),
                                              fontFamily: "OpenSans",
                                              color: Colors.black,
                                              fontWeight: FontWeight.w500,
                                            ),
                                          ),
                                        ),
                                      ],
                                    ),
                                  ),
                                ),
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
                                      Cat2users[index]["flipperDescription"],
                                      textAlign: TextAlign.center,
                                      style: TextStyle(
                                          fontFamily: "OpenSans",
                                          color: Colors.black,
                                          fontSize:
                                              getProportionateScreenWidth(11)),
                                    ),
                                  ),
                                  GestureDetector(
                                    onTap: () {
                                      Navigator.push(
                                        context,
                                        MaterialPageRoute(
                                            builder: (context) => DetailScreen(
                                                dict: Cat2users[index])),
                                      );
                                    },
                                    child: Align(
                                      alignment: Alignment.bottomRight,
                                      child: Text(
                                        "See More",
                                        style: TextStyle(
                                            fontFamily: "OpenSans",
                                            color: Colors.blue,
                                            fontSize:
                                                getProportionateScreenWidth(
                                                    11)),
                                      ),
                                    ),
                                  )
                                ],
                              )),
                        ),
                      ),
                    ),
                    staggeredTileBuilder: (int index) =>
                        new StaggeredTile.count(2, index.isEven ? 2 : 2),
                    mainAxisSpacing: 4.0,
                    crossAxisSpacing: 4.0,
                  ),
                ),
                Padding(
                  padding: EdgeInsets.symmetric(
                      vertical: getProportionateScreenWidth(10),
                      horizontal: getProportionateScreenHeight(10)),
                  child: Text(
                    "#CodeCrashers 😎",
                    style: TextStyle(
                      fontWeight: FontWeight.bold,
                      fontSize: getProportionateScreenWidth(20),
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
                                                getProportionateScreenHeight(
                                                    95),
                                            width: double.maxFinite,
                                            color:
                                                Colors.black.withOpacity(0.7),
                                            child: Column(
                                              mainAxisAlignment:
                                                  MainAxisAlignment
                                                      .spaceBetween,
                                              children: [
                                                SizedBox(
                                                  height: 1,
                                                ),
                                                Column(
                                                  mainAxisSize:
                                                      MainAxisSize.min,
                                                  crossAxisAlignment:
                                                      CrossAxisAlignment.start,
                                                  children: [
                                                    Center(
                                                      child: Text(
                                                        Cat3users[index]
                                                            ["name"],
                                                        style: TextStyle(
                                                          fontSize:
                                                              getProportionateScreenWidth(
                                                                  12),
                                                          color: Colors.white,
                                                          fontFamily:
                                                              "OpenSans",
                                                          fontWeight:
                                                              FontWeight.w800,
                                                        ),
                                                      ),
                                                    ),
                                                    Center(
                                                      child: Text(
                                                        "${Cat3users[index]["course"]},${Cat3users[index]["yog"]}",
                                                        style: TextStyle(
                                                          fontSize:
                                                              getProportionateScreenWidth(
                                                                  10),
                                                          color: Colors.white,
                                                          fontFamily:
                                                              "OpenSans",
                                                          fontWeight:
                                                              FontWeight.w500,
                                                        ),
                                                      ),
                                                    ),
                                                    SizedBox(
                                                      height: 5,
                                                    ),
                                                  ],
                                                ),
                                              ],
                                            )),
                                      )
                                    : Center(),
                                Container(
                                  child: Image.asset(
                                    Cat3users[index]["image"],
                                    fit: BoxFit.fill,
                                  ),
                                ),
                                index % 2 != 0
                                    ? Align(
                                        alignment: Alignment.bottomCenter,
                                        child: Container(
                                          height:
                                              getProportionateScreenHeight(40),
                                          width: double.maxFinite,
                                          color: Colors.white.withOpacity(0.7),
                                          child: Column(
                                            mainAxisSize: MainAxisSize.min,
                                            crossAxisAlignment:
                                                CrossAxisAlignment.start,
                                            children: [
                                              Center(
                                                child: Text(
                                                  Cat3users[index]["name"],
                                                  style: TextStyle(
                                                    fontSize:
                                                        getProportionateScreenWidth(
                                                            12),
                                                    color: Colors.black,
                                                    fontFamily: "OpenSans",
                                                    fontWeight: FontWeight.w800,
                                                  ),
                                                ),
                                              ),
                                              Center(
                                                child: Text(
                                                  "${Cat3users[index]["course"]},${Cat3users[index]["yog"]}",
                                                  style: TextStyle(
                                                    fontSize:
                                                        getProportionateScreenWidth(
                                                            10),
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
                                      Cat3users[index]["flipperDescription"],
                                      textAlign: TextAlign.center,
                                      style: TextStyle(
                                          fontFamily: "OpenSans",
                                          color: Colors.black,
                                          fontSize:
                                              getProportionateScreenWidth(11)),
                                    ),
                                  ),
                                  GestureDetector(
                                    onTap: () {
                                      Navigator.push(
                                        context,
                                        MaterialPageRoute(
                                            builder: (context) => DetailScreen(
                                                dict: Cat3users[index])),
                                      );
                                    },
                                    child: Align(
                                      alignment: Alignment.bottomRight,
                                      child: Text(
                                        "See More",
                                        style: TextStyle(
                                            fontFamily: "OpenSans",
                                            color: Colors.blue,
                                            fontSize:
                                                getProportionateScreenWidth(
                                                    11)),
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
