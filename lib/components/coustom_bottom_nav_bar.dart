import 'package:flutter/material.dart';
import 'package:flutter_svg/flutter_svg.dart';
import 'package:orev/screens/home/home_screen.dart';
import 'package:orev/screens/profile/profile_screen.dart';
import 'package:orev/screens/sign_in/sign_in_screen.dart';
import 'package:orev/services/user_simple_preferences.dart';

import '../constants.dart';
import '../enums.dart';
import 'package:orev/screens/liked_item/like_screen.dart';

import '../size_config.dart';
import 'comingsoonpage.dart';

class CustomBottomNavBar extends StatefulWidget {
  final MenuState selectedMenu;

  const CustomBottomNavBar({
    Key key,
    @required this.selectedMenu,
  }) : super(key: key);
  @override
  _CustomBottomNavBarState createState() => _CustomBottomNavBarState();
}

class _CustomBottomNavBarState extends State<CustomBottomNavBar> {
  String authkey = '';

  @override
  void initState() {
    authkey = UserSimplePreferences.getAuthKey() ?? '';
    super.initState();
  }

  @override
  Widget build(BuildContext context) {
    final Color inActiveIconColor = Color(0xFFB6B6B6);
    return Container(
      padding: EdgeInsets.symmetric(vertical: getProportionateScreenHeight(14)),
      decoration: BoxDecoration(
        color: Colors.white,
        boxShadow: [
          BoxShadow(
            offset: Offset(0, -15),
            blurRadius: 20,
            color: Color(0xFFDADADA).withOpacity(0.15),
          ),
        ],
        borderRadius: BorderRadius.only(
          topLeft: Radius.circular(40),
          topRight: Radius.circular(40),
        ),
      ),
      child: SafeArea(
          top: false,
          child: Row(
            mainAxisAlignment: MainAxisAlignment.spaceAround,
            children: [
              IconButton(
                  icon: SvgPicture.asset(
                    "assets/icons/Shop Icon.svg",height: getProportionateScreenHeight(25),
                    color: MenuState.home == widget.selectedMenu
                        ? kPrimaryColor
                        : inActiveIconColor,
                  ),
                  onPressed: () {
                    if(MenuState.home == widget.selectedMenu){

                    }
                    else{
                      Navigator.pushNamed(context, HomeScreen.routeName);
                    }

                  }),
              IconButton(
                icon: SvgPicture.asset(
                  "assets/icons/Heart Icon.svg",height: getProportionateScreenHeight(25),
                  color: MenuState.favourite == widget.selectedMenu
                      ? kPrimaryColor
                      : inActiveIconColor,
                ),
                onPressed: () {
                  if(MenuState.favourite == widget.selectedMenu){

                  }
                  else{
                    if (authkey == '') {
                      Navigator.pushNamed(context, SignInScreen.routeName);
                    } else {
                      Navigator.pushNamed(context, LikedScreen.routeName);
                    }
                  }

                },
              ),
              IconButton(
                icon: SvgPicture.asset(
                    "assets/icons/Chat bubble Icon.svg",height: getProportionateScreenHeight(25),
                  color: MenuState.message == widget.selectedMenu
                      ? kPrimaryColor
                      : inActiveIconColor,
                ),
                onPressed: () {
                  if(MenuState.message == widget.selectedMenu){

                  }
                  else{
                    Navigator.push(
                      context,
                      MaterialPageRoute(builder: (context) => ComingSoon(value: "Ticketing Service",bottomNavigation: true,)),
                    );
                  }

                },
              ),
              IconButton(
                  icon: SvgPicture.asset(
                    "assets/icons/User Icon.svg",height: getProportionateScreenHeight(25),
                    color: MenuState.profile == widget.selectedMenu
                        ? kPrimaryColor
                        : inActiveIconColor,
                  ),
                  onPressed: () {
                    if(MenuState.profile == widget.selectedMenu){

                    }
                    else{
                      Navigator.pushNamed(context, ProfileScreen.routeName);
                    }
                  }),
            ],
          )),
    );
  }
}
