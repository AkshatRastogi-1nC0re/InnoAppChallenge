import 'package:cached_network_image/cached_network_image.dart';
import 'package:flutter/material.dart';
import 'package:flutter_svg/flutter_svg.dart';
import 'package:loading_skeleton/loading_skeleton.dart';
import 'package:orev/components/default_button.dart';
import 'package:orev/models/Product.dart';
import 'package:orev/providers/auth_provider.dart';

import 'package:orev/screens/sign_in/sign_in_screen.dart';
import 'package:orev/services/product_services.dart';
import 'package:orev/services/user_simple_preferences.dart';

import '../constants.dart';
import '../size_config.dart';

class FullWidthProductCard extends StatefulWidget {
  final bool like;
  final double width, aspectRetio;
  final Product product;
  final Function() notifyParent;

  const FullWidthProductCard({
    Key key,
    this.width = 140,
    this.aspectRetio = 1.02,
    @required this.product,
    this.like = true,
    @required this.notifyParent,
  }) : super(key: key);

  @override
  _FullWidthProductCardState createState() => _FullWidthProductCardState();
}

class _FullWidthProductCardState extends State<FullWidthProductCard> {
  // final int saleprice = 200;
  bool outofstock = true;
  bool favor = false;
  bool sale = false;

  void outofstockcheck() {
    for (var varient in widget.product.varients) {
      if (varient.inStock == true) {
        outofstock = false;
        break;
      }
    }
  }

  int defaultVarient = 0;

  void getDefaultVarient() {
    int index = 0;
    for (var varient in widget.product.varients) {
      if (varient.default_product == true) {
        defaultVarient = index;
        break;
      }
      index += 1;
    }
    sale = widget.product.varients[defaultVarient].isOnSale;
  }

  String user_key;
  List<dynamic> keys = [];

  Future<void> getAllProducts() async {
    ProductServices _services = ProductServices();
    var favref = await _services.favourites.doc(user_key).get();
    keys = favref["favourites"];

    if (keys.contains(widget.product.id)) {
      favor = true;
    }
    setState(() {});
    // list.add(SizedBox(width: getProportionateScreenWidth(20)));
  }

  Future<void> removeFavourite() async {
    ProductServices _services = ProductServices();
    var favref = await _services.favourites.doc(user_key).get();
    keys = favref["favourites"];
    keys.remove(widget.product.id);
    await _services.favourites.doc(user_key).update({'favourites': keys});
    setState(() {});
    // list.add(SizedBox(width: getProportionateScreenWidth(20)));
  }

  Future<void> addFavourite() async {
    ProductServices _services = ProductServices();
    var favref = await _services.favourites.doc(user_key).get();
    keys = favref["favourites"];
    keys.add(widget.product.id);
    await _services.favourites.doc(user_key).update({'favourites': keys});
    setState(() {});
    // list.add(SizedBox(width: getProportionateScreenWidth(20)));
  }

  Future<void> addToCart() async {
    ProductServices _services = ProductServices();
    var favref = await _services.cart.doc(user_key).get();
    keys = favref["cartItems"];

    var x = widget.product.varients[defaultVarient].id;

    bool alreadyexixts = false;

    for (var k in keys) {
      if (k["varientNumber"] == x && k["productId"] == widget.product.id) {
        var currentqty = k["qty"];
        var newqty = currentqty + 1;
        k["qty"] = newqty;
        alreadyexixts = true;
      }
    }
    if (!alreadyexixts) {
      keys.add({
        "productId": widget.product.id,
        "qty": 1,
        "varientNumber": x,
      });
    }

    await _services.cart.doc(user_key).update({'cartItems': keys});
    setState(() {
      final snackBar = SnackBar(
        content: Text('Item added to Cart'),
        backgroundColor: kPrimaryColor,
      );
      ScaffoldMessenger.of(context).showSnackBar(snackBar);
    });
    // list.add(SizedBox(width: getProportionateScreenWidth(20)));
  }

  String authkey = "";

  @override
  void initState() {
    authkey = UserSimplePreferences.getAuthKey() ?? '';
    if (authkey != "") {
      user_key = AuthProvider().user.uid;
      getAllProducts();
    }
    getDefaultVarient();
    outofstockcheck();
    super.initState();
  }

  @override
  Widget build(BuildContext context) {
    return Padding(
        padding: EdgeInsets.symmetric(
            vertical: getProportionateScreenHeight(5),
            horizontal: getProportionateScreenWidth(20)),
        child: Stack(
          children: [
            Container(
              height: getProportionateScreenHeight(150),
              decoration: BoxDecoration(
                  borderRadius: BorderRadius.circular(15),
                  border: Border.all(
                    color:
                        kSecondaryColor.withOpacity(0.1), // red as border color
                  )),
              child: GestureDetector(
                // onTap: () => Navigator.pushNamed(
                //   context,
                //   DetailsScreen.routeName,
                //   arguments: ProductDetailsArguments(product: widget.product),
                // ),
                child: Row(
                  mainAxisSize: MainAxisSize.max,
                  // crossAxisAlignment: CrossAxisAlignment.start,
                  children: [
                    Container(
                      decoration: BoxDecoration(
                        color: kSecondaryColor.withOpacity(0.1),
                      ),
                      width: getProportionateScreenWidth(160),
                      child: Hero(
                        tag: widget.product.id.toString(),
                        child: CachedNetworkImage(
                          height: getProportionateScreenHeight(150),
                          width: getProportionateScreenWidth(160),
                          imageUrl:
                              widget.product.varients[defaultVarient].images[0],
                          placeholder: (context, url) => new LoadingSkeleton(
                            width: getProportionateScreenWidth(500),
                            height: getProportionateScreenHeight(500),
                          ),
                          errorWidget: (context, url, error) =>
                              new Icon(Icons.error),
                        ),
                      ),
                    ),
                    Padding(
                      padding: EdgeInsets.all(getProportionateScreenWidth(10)),
                      child: Column(
                        crossAxisAlignment: CrossAxisAlignment.start,
                        children: [
                          Container(
                            width: getProportionateScreenWidth(150),
                            child: Text(
                              widget.product.title,
                              style: TextStyle(
                                color: Colors.black,
                                fontSize: getProportionateScreenWidth(14),
                              ),
                              maxLines: 1,
                              overflow: TextOverflow.ellipsis,
                            ),
                          ),
                          Row(
                            mainAxisAlignment: MainAxisAlignment.spaceBetween,
                            children: [
                              Text(
                                "\₹${widget.product.varients[defaultVarient].price}",
                                style: TextStyle(
                                  fontSize: getProportionateScreenWidth(15),
                                  fontWeight: FontWeight.w600,
                                  color: kPrimaryColor,
                                ),
                              ),
                              SizedBox(
                                width: getProportionateScreenWidth(20),
                              ),
                              sale == true
                                  ? Text(
                                      "\₹${widget.product.varients[defaultVarient].comparedPrice}",
                                      style: TextStyle(
                                        decoration: TextDecoration.lineThrough,
                                        fontSize:
                                            getProportionateScreenWidth(12),
                                        // fontWeight: FontWeight.w600,
                                        color: Color(0xFF6B6B6B),
                                      ),
                                    )
                                  : Text(""),
                              SizedBox(
                                width: getProportionateScreenWidth(5),
                              ),
                              sale == true
                                  ? Text(
                                      "Sale",
                                      style: TextStyle(
                                        fontSize:
                                            getProportionateScreenWidth(14),
                                        color: Colors.black,
                                        // fontWeight: FontWeight.w600,
                                      ),
                                    )
                                  : Text("")
                            ],
                          ),
                          Container(
                            width: getProportionateScreenWidth(152),
                            height: getProportionateScreenHeight(36),
                            child: outofstock == false
                                ? FlatButton(
                                    shape: RoundedRectangleBorder(
                                        borderRadius: BorderRadius.circular(5)),
                                    color: kPrimaryColor,
                                    onPressed: () {
                                      if (authkey == '') {
                                        Navigator.pushNamed(
                                            context, SignInScreen.routeName);
                                      } else {
                                        addToCart();
                                      }
                                    },
                                    child: Text(
                                      "Add to Cart",
                                      style: TextStyle(
                                        fontSize:
                                            getProportionateScreenWidth(12),
                                        color: Colors.white,
                                      ),
                                    ),
                                  )
                                : FlatButton(
                                    shape: RoundedRectangleBorder(
                                        borderRadius: BorderRadius.circular(5)),
                                    color: kSecondaryColor,
                                    onPressed: () {},
                                    child: Text(
                                      "Out Of Stock",
                                      style: TextStyle(
                                        fontSize:
                                            getProportionateScreenWidth(12),
                                        color: Colors.white,
                                      ),
                                    ),
                                  ),
                          )
                        ],
                      ),
                    )
                  ],
                ),
              ),
            ),
            widget.like
                ? InkWell(
                    borderRadius: BorderRadius.circular(50),
                    onTap: () {
                      setState(() {
                        if (authkey == '') {
                          Navigator.pushNamed(context, SignInScreen.routeName);
                        } else {
                          if (favor == true) {
                            favor = false;
                            removeFavourite();
                            Scaffold.of(context).showSnackBar(new SnackBar(
                              content: new Text("Removed from Favourites"),
                              backgroundColor: kPrimaryColor2,
                            ));
                          } else {
                            favor = true;
                            addFavourite();
                            Scaffold.of(context).showSnackBar(new SnackBar(
                              content: new Text("Added to Favourites"),
                              backgroundColor: kPrimaryColor2,
                            ));
                          }
                        }
                      });
                    },
                    child: Container(
                      padding: EdgeInsets.all(getProportionateScreenWidth(8)),
                      height: getProportionateScreenWidth(28),
                      width: getProportionateScreenWidth(28),
                      decoration: BoxDecoration(
                        color: widget.product.isFavourite
                            ? kPrimaryColor.withOpacity(0.15)
                            : kSecondaryColor.withOpacity(0.1),
                      ),
                      child: SvgPicture.asset(
                        "assets/icons/Heart Icon_2.svg",
                        color: favor == true
                            ? Color(0xFFFF4848)
                            : Color(0xFFDBDEE4),
                      ),
                    ))
                : Center(),
          ],
        ));
  }
}
