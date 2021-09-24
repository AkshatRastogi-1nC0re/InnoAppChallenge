import 'package:cloud_firestore/cloud_firestore.dart';
import 'package:geocoding/geocoding.dart';
import 'package:orev/models/Product.dart';
import 'package:orev/models/Varient.dart';

class ProductServices {
  CollectionReference category =
      FirebaseFirestore.instance.collection('category');
  DocumentReference mainscreen = FirebaseFirestore.instance
      .collection('mainscreen')
      .doc("FPqix1bIAibs46FOA5zV");

  DocumentReference initialChecks = FirebaseFirestore.instance
      .collection('Maintainance')
      .doc("JmEmXY3ZoYp71gznVp5I");

  CollectionReference products =
      FirebaseFirestore.instance.collection('products');

  CollectionReference favourites =
      FirebaseFirestore.instance.collection('favourites');

  CollectionReference cart = FirebaseFirestore.instance.collection('cart');

  CollectionReference offerZone =
      FirebaseFirestore.instance.collection('offerZone');

  CollectionReference users = FirebaseFirestore.instance.collection('users');

  Future<void> updateAddress(Map<String, dynamic> values, id) async {
    await FirebaseFirestore.instance.collection("users").doc(id).update(values);
  }

  Future<String> getSellerInfo(id) async {
    var document =
        await FirebaseFirestore.instance.collection("vendors").doc(id).get();
    return document["shopName"];
  }

  Future<double> getSellerCODcost(id) async {
    var document =
        await FirebaseFirestore.instance.collection("vendors").doc(id).get();
    return document["codCharge"].toDouble();
  }

  Future<DocumentSnapshot> getAdInfo(id) async {
    var document =
        await FirebaseFirestore.instance.collection("Ads").doc(id).get();
    return document;
  }

  Future<double> getSellerSellingDistance(id) async {
    var document =
        await FirebaseFirestore.instance.collection("vendors").doc(id).get();
    return document["deliveryRadius"].toDouble();
  }

  Future<Map> getSellerDeliveryCharge(id) async {
    var document =
        await FirebaseFirestore.instance.collection("vendors").doc(id).get();
    return document["deliveryCharge"];
  }

  Future<GeoPoint> getSellerLocation(id) async {
    var document =
        await FirebaseFirestore.instance.collection("vendors").doc(id).get();
    return document["location"];
  }

  Future<bool> getSellerCODAvailable(id) async {
    var document =
        await FirebaseFirestore.instance.collection("vendors").doc(id).get();
    return document["codAvailable"];
  }

  Product getProductSeeMore(document) {
    var exists = document.exists;
    if (exists) {
      var listVarientraw = document["variant"];
      List<Varient> listVarient = [];
      for (var vari in listVarientraw) {
        listVarient.add(new Varient(
            default_product: vari["default"],
            isOnSale: vari["onSale"]["isOnSale"],
            comparedPrice: vari["onSale"]["comparedPrice"].toDouble(),
            discountPercentage: vari["onSale"]["discountPercentage"].toDouble(),
            price: vari["price"].toDouble(),
            inStock: vari["stock"]["inStock"],
            qty: vari["stock"]["qty"],
            title: vari["variantDetails"]["title"],
            id: vari["id"],
            images: vari["variantDetails"]["images"]));
      }
      return Product(
          id: document["productId"],
          brandname: document["brand"],
          varients: listVarient,
          title: document["title"],
          detail: document["detail"],
          rating: document["rating"],
          sellerId: document["sellerId"],
          isFavourite: true,
          isPopular: true,
          tax: document["tax"].toDouble(),
          youmayalsolike: document["youMayAlsoLike"]);
    }
    return null;
  }

  Product getProductSearchPage(document) {
    var exists = true;
    if (exists) {
      var listVarientraw = document["variant"];
      List<Varient> listVarient = [];
      for (var vari in listVarientraw) {
        listVarient.add(new Varient(
            default_product: vari["default"],
            isOnSale: vari["onSale"]["isOnSale"],
            comparedPrice: vari["onSale"]["comparedPrice"].toDouble(),
            discountPercentage: vari["onSale"]["discountPercentage"].toDouble(),
            price: vari["price"].toDouble(),
            inStock: vari["stock"]["inStock"],
            qty: vari["stock"]["qty"],
            title: vari["variantDetails"]["title"],
            id: vari["id"],
            images: vari["variantDetails"]["images"]));
      }
      return Product(
          id: document["productId"],
          brandname: document["brand"],
          varients: listVarient,
          title: document["title"],
          detail: document["detail"],
          rating: document["rating"],
          sellerId: document["sellerId"],
          isFavourite: true,
          isPopular: true,
          tax: document["tax"].toDouble(),
          youmayalsolike: document["youMayAlsoLike"]);
    }
    return null;
  }

  Future<Product> getProduct(productId) async {
    ProductServices _services = ProductServices();
    var document = await _services.products.doc(productId).get();
    var exists = document.exists;
    if (exists) {
      var listVarientraw = document["variant"];
      List<Varient> listVarient = [];
      for (var vari in listVarientraw) {
        listVarient.add(new Varient(
            default_product: vari["default"],
            isOnSale: vari["onSale"]["isOnSale"],
            comparedPrice: vari["onSale"]["comparedPrice"].toDouble(),
            discountPercentage: vari["onSale"]["discountPercentage"].toDouble(),
            price: vari["price"].toDouble(),
            inStock: vari["stock"]["inStock"],
            qty: vari["stock"]["qty"],
            title: vari["variantDetails"]["title"],
            id: vari["id"],
            images: vari["variantDetails"]["images"]));
      }
      return Product(
          id: document["productId"],
          brandname: document["brand"],
          varients: listVarient,
          title: document["title"],
          detail: document["detail"],
          rating: document["rating"],
          sellerId: document["sellerId"],
          isFavourite: true,
          isPopular: true,
          tax: document["tax"].toDouble(),
          youmayalsolike: document["youMayAlsoLike"]);
    }
    return null;
  }
}
