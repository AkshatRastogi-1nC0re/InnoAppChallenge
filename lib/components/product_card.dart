import 'package:cached_network_image/cached_network_image.dart';
import 'package:flutter/material.dart';
import 'package:flutter_svg/flutter_svg.dart';
import 'package:loading_skeleton/loading_skeleton.dart';
import 'package:orev/models/Product.dart';
import 'package:orev/providers/auth_provider.dart';

import 'package:orev/screens/sign_in/sign_in_screen.dart';
import 'package:orev/services/product_services.dart';
import 'package:orev/services/user_simple_preferences.dart';

import '../constants.dart';
import '../size_config.dart';

class ProductCard extends StatefulWidget {
  const ProductCard({
    Key key,
    this.width = 140,
    this.aspectRetio = 1.5,
    @required this.product,
  }) : super(key: key);
  final double width, aspectRetio;
  final Product product;

  @override
  _ProductCardState createState() => _ProductCardState();
}

class _ProductCardState extends State<ProductCard> {
  bool favor = false;
  List<Product> ProductList = [];
  List<dynamic> keys = [];

  String user_key;

  Future<void> getAllProducts() async {
    ProductServices _services = ProductServices();
    print(user_key);
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
    print(user_key);
    var favref = await _services.favourites.doc(user_key).get();
    keys = favref["favourites"];
    keys.remove(widget.product.id);
    await _services.favourites.doc(user_key).update({'favourites': keys});
    setState(() {});
    // list.add(SizedBox(width: getProportionateScreenWidth(20)));
  }

  Future<void> addFavourite() async {
    ProductServices _services = ProductServices();
    print(user_key);
    var favref = await _services.favourites.doc(user_key).get();
    keys = favref["favourites"];
    keys.add(widget.product.id);
    await _services.favourites.doc(user_key).update({'favourites': keys});
    setState(() {});
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
    super.initState();
  }

  @override
  Widget build(BuildContext context) {
    return Padding(
      padding: EdgeInsets.only(
          left: getProportionateScreenWidth(15),
          right: getProportionateScreenWidth(15)),
      child: SizedBox(
        width: getProportionateScreenWidth(widget.width),
        child: GestureDetector(
          // onTap: () => Navigator.pushNamed(
          //   context,
          //   DetailsScreen.routeName,
          //   arguments: ProductDetailsArguments(product: widget.product),
          // ),
          child: Column(
            crossAxisAlignment: CrossAxisAlignment.start,
            children: [
              AspectRatio(
                aspectRatio: widget.aspectRetio,
                child: Container(
                  decoration: BoxDecoration(
                    color: kSecondaryColor.withOpacity(0.1),
                    borderRadius: BorderRadius.circular(15),
                  ),
                  child: Hero(
                    tag: widget.product.id.toString(),
                    child: CachedNetworkImage(
                      imageUrl: widget.product.varients[0].images[0],
                      placeholder: (context, url) => new LoadingSkeleton(
                        width: getProportionateScreenWidth(500),
                        height: getProportionateScreenHeight(500),
                      ),
                      errorWidget: (context, url, error) =>
                          new Icon(Icons.error),
                    ),
                  ),
                ),
              ),
              Text(
                widget.product.title,
                style: TextStyle(
                    fontSize: getProportionateScreenWidth(12),
                    color: Colors.black),
                maxLines: 1,
                overflow: TextOverflow.ellipsis,
              ),
              Row(
                mainAxisAlignment: MainAxisAlignment.spaceBetween,
                children: [
                  Text(
                    "\₹${widget.product.varients[0].price}",
                    style: TextStyle(
                      fontSize: getProportionateScreenWidth(17),
                      fontWeight: FontWeight.w600,
                      color: kPrimaryColor,
                    ),
                  ),
                  InkWell(
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
                        shape: BoxShape.circle,
                      ),
                      child: SvgPicture.asset(
                        "assets/icons/Heart Icon_2.svg",
                        color: favor == true
                            ? Color(0xFFFF4848)
                            : Color(0xFFDBDEE4),
                      ),
                    ),
                  ),
                ],
              )
            ],
          ),
        ),
      ),
    );
  }
}
