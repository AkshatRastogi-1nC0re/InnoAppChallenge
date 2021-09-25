import 'package:cloud_firestore/cloud_firestore.dart';
import 'package:firebase_auth/firebase_auth.dart';
import 'package:flutter/cupertino.dart';
import 'package:flutter/material.dart';
import 'package:socialbennett/services/user_services.dart';

class AuthProvider with ChangeNotifier {
  FirebaseAuth _auth = FirebaseAuth.instance;
  String smsOtp;
  String verificationId;
  String error = '';
  FirebaseAuthException firebaseAuthException;
  UserServices _userServices = UserServices();
  bool loading = false;
  String screen;
  DocumentSnapshot snapshot;
  get user => _auth.currentUser;

  Future signUp({String email, var password}) async {
    try {
      await _auth.createUserWithEmailAndPassword(
        email: email,
        password: password,
      );
      return null;
    } on FirebaseAuthException catch (e) {
      this.error = e.toString();
      print(e.message);
    }
  }

  Future signIn({String email, String password}) async {
    try {
      await _auth.signInWithEmailAndPassword(email: email, password: password);
      return null;
    } on FirebaseAuthException catch (e) {
      this.error = e.toString();
      this.firebaseAuthException = e;
      print(e.message);
      return e;
    }
  }

  Future signOut() async {
    await _auth.signOut();
    print('signout');
  }

  String getuserid() {
    final User user = _auth.currentUser;
    final uid_real = user.uid;
    return uid_real;
  }

  void _createUser({String id, String number}) {
    _userServices.createUserData({'id': id, 'number': number});
    this.loading = false;
    notifyListeners();
  }

  void updateUser({
    String id,
    String number,
  }) {
    _userServices.updateUserData({
      'id': id,
      'number': number,
      'firstName': null,
      'lastName': null,
      'email': null
    });
    this.loading = false;
    notifyListeners();
  }

  getUserDetails() async {
    DocumentSnapshot result = await FirebaseFirestore.instance
        .collection('users')
        .doc(_auth.currentUser.uid)
        .get();
    if (result != null) {
      this.snapshot = result;
      notifyListeners();
    } else {
      this.snapshot = null;
      notifyListeners();
    }

    return result;
  }
}
