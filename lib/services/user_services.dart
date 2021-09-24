//for all firebase related services for user
import 'package:cloud_firestore/cloud_firestore.dart';
import 'package:geocoding/geocoding.dart';
import 'package:geolocator/geolocator.dart';
import 'package:orev/services/product_services.dart';

class UserServices {
  String collection = 'users';
  FirebaseFirestore _firestore = FirebaseFirestore.instance;

  //create new user

  Future<void> createUserData(Map<String, dynamic> values) async {
    String id = values['id'];
    await _firestore.collection(collection).doc(id).set(values);
  }

  //update user data

  Future<void> updateUserData(Map<String, dynamic> values) async {
    String id = values['id'];
    await _firestore.collection(collection).doc(id).update(values);
  }

  //get user data by User id

  Future<DocumentSnapshot> getUserById(String id) async {
    var result = await _firestore.collection(collection).doc(id).get();
    return result;
  }

  Future<String> getKeyPass(String id) async {
    var result = await _firestore.collection("keypass").doc(id).get();
    var x = result["pass"];
    return x;
  }

  Future<void> setKeyPass(Map<String, dynamic> values) async {
    String id = values['id'];
    await _firestore.collection("keypass").doc(id).set(values);
  }

  Future<void> registerComplaint(Map<String, dynamic> values) async {
    await _firestore.collection("helpcenter").add(values);
  }

  Future<void> updateKeyPass(Map<String, dynamic> values) async {
    String id = values['id'];
    await _firestore.collection("keypass").doc(id).update(values);
  }

  Future<Map> isAvailableOnUserLocation(currentLocation, sellerId) async {
    ProductServices _services = new ProductServices();
    var sellingdistance = await _services.getSellerSellingDistance(sellerId);
    var vendorlocation = await _services.getSellerLocation(sellerId);
    var codAvailable = await _services.getSellerCODAvailable(sellerId);
    List<Location> locations =
        await locationFromAddress(currentLocation["pincode"].toString());
    var codCharge = await _services.getSellerCODcost(sellerId);
    var deliveryCost = await _services.getSellerDeliveryCharge(sellerId);
    var deliveryCharge = deliveryCost["charge"].toDouble();
    var freekms = deliveryCost["freeRadius"].toDouble();

    var distanceInMeters = await Geolocator.distanceBetween(
      locations[0].latitude,
      locations[0].longitude,
      vendorlocation.latitude,
      vendorlocation.longitude,
    );

    bool deliverable = false;
    double finalDeliveryCost = 0.0;

    if ((distanceInMeters / 1000) < sellingdistance) {
      deliverable = true;
    } else {
      deliverable = false;
    }

    if (distanceInMeters / 1000 > freekms) {
      finalDeliveryCost = deliveryCharge;
    } else {
      finalDeliveryCost = 0.0;
    }

    var returnValue = {
      "deliverable": deliverable,
      "codAvailable": codAvailable,
      "deliveryCost": finalDeliveryCost,
      "codCharges": codCharge,
      "freekms": freekms,
      "distanceInMeters": distanceInMeters
    };

    return returnValue;
  }
}
