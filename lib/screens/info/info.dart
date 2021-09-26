import 'package:flutter/material.dart';
import 'package:flutter/services.dart';
import 'package:fluttertoast/fluttertoast.dart';
import 'package:socialbennett/screens/home/home_screen.dart';
import 'package:socialbennett/size_config.dart';

import 'dart:ui' as ui;
import '../../constants.dart';
import 'components/body.dart';

class Info extends StatefulWidget {
  static String routeName = "/info";
  @override
  _InfoState createState() => _InfoState();
}

class _InfoState extends State<Info> {
  @override
  void initState() {
    super.initState();
  }

  DateTime backbuttonpressedTime;

  @override
  Widget build(BuildContext context) {
    return SafeArea(
      child: Scaffold(
        body: Builder(
          builder: (BuildContext context) => HawkFabMenu(
            icon: AnimatedIcons.menu_arrow,
            fabColor: Colors.transparent,
            iconColor: Colors.black,
            items: [
              HawkFabMenuItem(
                label: '',
                ontap: () {
                  Navigator.push(
                    context,
                    MaterialPageRoute(builder: (context) => HomeScreen()),
                  );
                },
                icon: Icon(
                  Icons.home_rounded,
                  size: getProportionateScreenWidth(30),
                ),
                color: Colors.red,
                labelColor: Colors.blue,
              ),
              HawkFabMenuItem(
                label: '',
                ontap: () {},
                icon: Icon(
                  Icons.account_circle_rounded,
                  size: getProportionateScreenWidth(30),
                ),
              ),
              HawkFabMenuItem(
                label: '',
                ontap: () {},
                icon: Icon(
                  Icons.info,
                  size: getProportionateScreenWidth(31),
                ),
              ),
            ],
            body: Body(),
          ),
        ),
      ),
    );
  }
}

/// Wrapper that builds a FAB menu on top of [body] in a [Stack]
class HawkFabMenu extends StatefulWidget {
  final Widget body;
  final List<HawkFabMenuItem> items;
  final double blur;
  final AnimatedIconData icon;
  final Color fabColor;
  final Color iconColor;
  HawkFabMenu({
    @required this.body,
    @required this.items,
    this.blur: 5.0,
    this.icon,
    this.fabColor,
    this.iconColor,
  }) {
    assert(this.items.length > 0);
  }

  @override
  _HawkFabMenuState createState() => _HawkFabMenuState();
}

class _HawkFabMenuState extends State<HawkFabMenu>
    with TickerProviderStateMixin {
  /// To check if the menu is open
  bool _isOpen = false;

  /// The [Duration] for every animation
  Duration _duration = Duration(milliseconds: 500);

  /// Animation controller that animates the menu item
  AnimationController _iconAnimationCtrl;

  /// Animation that animates the menu item
  Animation<double> _iconAnimationTween;

  @override
  void initState() {
    super.initState();
    _iconAnimationCtrl = AnimationController(
      vsync: this,
      duration: _duration,
    );
    _iconAnimationTween = Tween(
      begin: 0.0,
      end: 1.0,
    ).animate(_iconAnimationCtrl);
  }

  /// Closes the menu if open and vice versa
  void _toggleMenu() {
    setState(() {
      _isOpen = !_isOpen;
    });
    if (_isOpen) {
      _iconAnimationCtrl.forward();
    } else {
      _iconAnimationCtrl.reverse();
    }
  }

  /// If the menu is open and the device's back button is pressed then menu gets closed instead of going back.
  Future<bool> _preventPopIfOpen() async {
    if (_isOpen) {
      _toggleMenu();
      return false;
    }
    return true;
  }

  @override
  Widget build(BuildContext context) {
    return WillPopScope(
      child: Stack(
        children: <Widget>[
          widget.body,
          _isOpen ? _buildBlurWidget() : Container(),
          _isOpen ? _buildMenuItemList() : Container(),
          _buildMenuButton(context),
        ],
      ),
      onWillPop: _preventPopIfOpen,
    );
  }

  /// Returns animated list of menu items
  Widget _buildMenuItemList() {
    return Positioned(
      top: getProportionateScreenHeight(80),
      right: getProportionateScreenWidth(13),
      child: ScaleTransition(
        scale: AnimationController(
          vsync: this,
          value: 0.7,
          duration: _duration,
        )..forward(),
        child: SizeTransition(
          axis: Axis.horizontal,
          sizeFactor: AnimationController(
            vsync: this,
            value: 0.5,
            duration: _duration,
          )..forward(),
          child: FadeTransition(
            opacity: AnimationController(
              vsync: this,
              value: 0.0,
              duration: _duration,
            )..forward(),
            child: Column(
              crossAxisAlignment: CrossAxisAlignment.end,
              children: this
                  .widget
                  .items
                  .map<Widget>(
                    (item) => _MenuItemWidget(
                      item: item,
                      toggleMenu: _toggleMenu,
                    ),
                  )
                  .toList(),
            ),
          ),
        ),
      ),
    );
  }

  /// Builds the blur effect when the menu is opened
  Widget _buildBlurWidget() {
    return InkWell(
      onTap: _toggleMenu,
      child: BackdropFilter(
        filter: ui.ImageFilter.blur(
          sigmaX: this.widget.blur,
          sigmaY: this.widget.blur,
        ),
        child: Container(
          color: Colors.black12,
        ),
      ),
    );
  }

  /// Builds the main floating action button of the menu to the bottom right
  /// On clicking of which the menu toggles
  Widget _buildMenuButton(BuildContext context) {
    return Positioned(
      top: 10,
      right: 13,
      child: GestureDetector(
        child: AnimatedIcon(
          size: 30,
          icon: this.widget.icon ?? AnimatedIcons.menu_close,
          progress: _iconAnimationTween,
          color: this.widget.iconColor,
        ),
        onTap: _toggleMenu,
      ),
    );
  }
}

/// Builds widget for a single menu item
class _MenuItemWidget extends StatelessWidget {
  /// Contains details for a single menu item
  final HawkFabMenuItem item;

  /// A callback that toggles the menu
  final Function toggleMenu;

  _MenuItemWidget({
    @required this.item,
    @required this.toggleMenu,
  });

  /// Closes the menu and calls the function for a particular menu item
  void onTap() {
    this.toggleMenu();
    this.item.ontap();
  }

  @override
  Widget build(BuildContext context) {
    return InkWell(
      onTap: this.onTap,
      child: Padding(
        padding:
            EdgeInsets.symmetric(vertical: getProportionateScreenHeight(8)),
        child: GestureDetector(
          onTap: this.onTap,
          child: this.item.icon,
        ),
      ),
    );
  }
}

/// Model for single menu item
class HawkFabMenuItem {
  /// Text label for for the menu item
  String label;

  /// Corresponding icon for the menu item
  Icon icon;

  /// Action that is to be performed on tapping the menu item
  Function ontap;

  /// Background color for icon
  Color color;

  /// Text color for label
  Color labelColor;

  /// Background color for label
  Color labelBackgroundColor;

  HawkFabMenuItem({
    @required this.label,
    @required this.ontap,
    @required this.icon,
    this.color,
    this.labelBackgroundColor,
    this.labelColor,
  });
}
