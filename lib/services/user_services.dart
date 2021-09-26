//for all firebase related services for user
import 'package:cloud_firestore/cloud_firestore.dart';
import 'package:geocoding/geocoding.dart';
import 'package:geolocator/geolocator.dart';

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
}
