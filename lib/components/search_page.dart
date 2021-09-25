import 'package:algolia/algolia.dart';
import 'package:flutter/cupertino.dart';
import 'package:flutter/material.dart';
import 'package:orev/components/AlgoliaApplication.dart';
import 'package:orev/models/Product.dart';

// import 'package:orev/screens/home/components/home_header.dart';
// import 'package:orev/screens/searchpage/searchpage.dart';
import 'package:orev/services/product_services.dart';

import '../constants.dart';
import '../size_config.dart';

class SearchPage extends StatefulWidget {
  SearchPage({Key key}) : super(key: key);
  @override
  _SearchPageState createState() => _SearchPageState();
}

class _SearchPageState extends State<SearchPage> {
  final Algolia _algoliaApp = AlgoliaApplication.algolia;
  String _searchTerm = "";

  List<Product> productList = [];

  Future<List<AlgoliaObjectSnapshot>> _operation(String input) async {
    AlgoliaQuery query = _algoliaApp.instance.index("products").search(input);
    AlgoliaQuerySnapshot querySnap = await query.getObjects();
    List<AlgoliaObjectSnapshot> results = querySnap.hits;
    return results;
  }

  @override
  Widget build(BuildContext context) {
    function(value, boo) {
      setState(() => _searchTerm = value);
      if (boo) {
        // Navigator.push(
        //     context,
        //     MaterialPageRoute(
        //         builder: (context) => SearchResultsPage(
        //               productList: productList,
        //               title: value,
        //             )));
      }
    }

    return SafeArea(
      child: Scaffold(
        body: Column(
          children: [
            SizedBox(height: getProportionateScreenHeight(10)),
            // HomeHeader(
            //   simplebutton: false,
            //   func: function,
            // ),
            SizedBox(height: getProportionateScreenHeight(10)),
            Expanded(
              child: SingleChildScrollView(
                child: Padding(
                  padding: EdgeInsets.symmetric(
                      horizontal: getProportionateScreenWidth(20)),
                  child: StreamBuilder<List<AlgoliaObjectSnapshot>>(
                    stream: Stream.fromFuture(_operation(_searchTerm)),
                    builder: (context, snapshot) {
                      if (!snapshot.hasData)
                        return Text(
                          "",
                          style: TextStyle(color: Colors.black),
                        );
                      else {
                        productList = [];
                        List<AlgoliaObjectSnapshot> currSearchStuff =
                            snapshot.data;
                        ProductServices _services = ProductServices();
                        for (var pr in currSearchStuff) {
                          productList
                              .add(_services.getProductSearchPage(pr.data));
                        }
                        switch (snapshot.connectionState) {
                          case ConnectionState.waiting:
                            return Container();
                          default:
                            if (snapshot.hasError)
                              return new Text('Error: ${snapshot.error}');
                            else {
                              return CustomScrollView(
                                shrinkWrap: true,
                                physics: NeverScrollableScrollPhysics(),
                                slivers: <Widget>[
                                  SliverList(
                                    delegate: SliverChildBuilderDelegate(
                                      (context, index) {
                                        return _searchTerm.length > 0
                                            ? DisplaySearchResult(
                                                title: currSearchStuff[index]
                                                    .data["title"],
                                                product: productList[index],
                                              )
                                            : Container();
                                      },
                                      childCount: currSearchStuff.length ?? 0,
                                    ),
                                  ),
                                ],
                              );
                            }
                        }
                      }
                    },
                  ),
                ),
              ),
            )
          ],
        ),
      ),
    );
  }
}

class DisplaySearchResult extends StatefulWidget {
  final String title;
  final Product product;

  DisplaySearchResult({Key key, this.title, this.product}) : super(key: key);
  @override
  _DisplaySearchResultState createState() => _DisplaySearchResultState();
}

class _DisplaySearchResultState extends State<DisplaySearchResult> {
  @override
  Widget build(BuildContext context) {
    return Column(
      children: [
        Row(
          children: [
            GestureDetector(
              onTap: () {},
              child: Icon(
                Icons.search,
                size: getProportionateScreenWidth(15),
                color: kTextColor,
              ),
            ),
            SizedBox(
              width: getProportionateScreenWidth(20),
            ),
            Expanded(
              child: GestureDetector(
                onTap: () {
                  // Navigator.pushNamed(
                  //   context,
                  //   DetailsScreen.routeName,
                  //   arguments: ProductDetailsArguments(product: widget.product),
                  // );
                },
                child: Text(
                  widget.title ?? "",
                  maxLines: 1,
                  overflow: TextOverflow.ellipsis,
                  style: TextStyle(
                      fontWeight: FontWeight.bold,
                      color: kPrimaryColor,
                      fontSize: getProportionateScreenWidth(18)),
                ),
              ),
            ),
            SizedBox(
              width: getProportionateScreenWidth(10),
            ),
            Icon(
              Icons.north_west,
              size: getProportionateScreenWidth(15),
              color: kTextColor,
            ),
          ],
        ),
        Divider(
          color: Colors.black,
        )
      ],
    );
  }
}

// class DisplaySearchResult extends StatelessWidget {
//   final String title;
//   final Product productId;
//
//   DisplaySearchResult({Key key,this.title, this.productId})
//       : super(key: key);
//
//   @override
//   Widget build(BuildContext context) {
//     return ListView.builder(
//         shrinkWrap: true,
//         physics: NeverScrollableScrollPhysics(),
//         itemCount: 10,
//         itemBuilder: (BuildContext context, int index) {
//           return Column(
//             children: [
//               Row(
//                 children: [
//                   GestureDetector(
//                       onTap: () {},
//                       child: Text(
//                         "✕",
//                         style: TextStyle(
//                             fontSize:
//                             getProportionateScreenWidth(15)),
//                       )),
//                   SizedBox(
//                     width: getProportionateScreenWidth(20),
//                   ),
//                   GestureDetector(
//                       onTap: () {
//                         Navigator.pushNamed(
//                           context,
//                           DetailsScreen.routeName,
//                           arguments: ProductDetailsArguments(product: product),
//                         );
//                       },
//                       child: Text(
//                         title ?? "",
//                         style: TextStyle(
//                             fontWeight: FontWeight.bold,
//                             color: Colors.blue,
//                             fontSize:
//                             getProportionateScreenWidth(18)),
//                       )),
//                 ],
//               ),
//               Divider(
//                 color: Colors.black,
//               )
//             ],);
//         });
//   }
// }

// Column(children: <Widget>[
// Text(
// artDes ?? "",
// style: TextStyle(color: Colors.black),
// ),
// Text(
// artistName ?? "",
// style: TextStyle(color: Colors.black),
// ),
// Text(
// genre ?? "",
// style: TextStyle(color: Colors.black),
// ),
// Divider(
// color: Colors.black,
// ),
// SizedBox(height: 20)
