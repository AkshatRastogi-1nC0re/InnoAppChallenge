import 'package:cloud_firestore/cloud_firestore.dart';
import 'package:geocoding/geocoding.dart';
import 'package:orev/models/Product.dart';
import 'package:orev/models/Varient.dart';

class OrderServices {
  CollectionReference orders = FirebaseFirestore.instance.collection('orders');

  Future<void> updateOrder(Map<String, dynamic> values, id) async {
    await FirebaseFirestore.instance
        .collection("orders")
        .doc(id)
        .update(values);
  }

  Future<void> addOrder(Map<String, dynamic> values, orderId) async {
    await FirebaseFirestore.instance
        .collection("orders")
        .doc(orderId)
        .set(values);
  }

  Future<DocumentSnapshot> getTransactions(transactionId) async {
    return await FirebaseFirestore.instance
        .collection("orderTransactions")
        .doc(transactionId)
        .get();
  }

  Future<void> addTransaction(Map<String, dynamic> values, orderId) async {
    await FirebaseFirestore.instance
        .collection("orderTransactions")
        .doc(orderId)
        .set(values);
  }
}
