import 'package:flutter/cupertino.dart';
import 'package:flutter/material.dart';
import 'package:lottie/lottie.dart';

import 'package:socialbennett/screens/home/home_screen.dart';

import '../constants.dart';
import '../size_config.dart';

class QuerySuccess extends StatefulWidget {
  final String queryname;
  const QuerySuccess({Key key, @required this.queryname}) : super(key: key);

  @override
  _QuerySuccessState createState() => _QuerySuccessState();
}

class _QuerySuccessState extends State<QuerySuccess> {
  @override
  void initState() {
    new Future.delayed(const Duration(seconds: 3), () {
      // Navigator.pushReplacementNamed(context, YourOrder.routeName);
    });
    super.initState();
  }

  @override
  Widget build(BuildContext context) {
    return SafeArea(
      child: SingleChildScrollView(
        child: Column(
          children: [
            SizedBox(height: getProportionateScreenHeight(10)),
            // HomeHeader(),
            SizedBox(height: getProportionateScreenHeight(50)),
            Padding(
              padding: EdgeInsets.symmetric(
                  horizontal: getProportionateScreenWidth(20)),
              child: Column(
                children: [
                  FittedBox(
                    child: Row(
                      children: [
                        widget.queryname == "Query"
                            ? Text(
                                "Query Posted",
                                style: TextStyle(
                                    fontSize: getProportionateScreenWidth(25),
                                    fontWeight: FontWeight.bold,
                                    color: Colors.black),
                              )
                            : widget.queryname == "Cancel"
                                ? Text(
                                    "Cancel Requested",
                                    style: TextStyle(
                                        fontSize:
                                            getProportionateScreenWidth(25),
                                        fontWeight: FontWeight.bold,
                                        color: Colors.black),
                                  )
                                : Text(
                                    "Return Requested",
                                    textAlign: TextAlign.center,
                                    style: TextStyle(
                                        fontSize:
                                            getProportionateScreenWidth(25),
                                        fontWeight: FontWeight.bold,
                                        color: Colors.black),
                                  ),
                      ],
                    ),
                  ),
                  SizedBox(
                    height: getProportionateScreenHeight(10),
                  ),
                  widget.queryname == "Query"
                      ? Text(
                          "Our Help team will contact you as soon as possible",
                          textAlign: TextAlign.center,
                          style: TextStyle(
                              fontSize: getProportionateScreenWidth(15)),
                        )
                      : widget.queryname == "Cancel"
                          ? Text(
                              "Your Cancellation request in under processing we will notify you with further details",
                              textAlign: TextAlign.center,
                              style: TextStyle(
                                  fontSize: getProportionateScreenWidth(15)),
                            )
                          : Text(
                              "Your Return/Replacement request in under processing we will notify you with further details",
                              textAlign: TextAlign.center,
                              style: TextStyle(
                                  fontSize: getProportionateScreenWidth(15)),
                            ),
                  Container(
                    child: Lottie.asset("assets/animation/success.json",
                        repeat: false),
                  ),
                ],
              ),
            ),
          ],
        ),
      ),
    );
  }
}
