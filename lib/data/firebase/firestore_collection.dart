import 'package:cloud_firestore/cloud_firestore.dart';

class FirestoreCollection {
  const FirestoreCollection();

  static CollectionReference customer =
      FirebaseFirestore.instance.collection('customer');
  static CollectionReference category =
      FirebaseFirestore.instance.collection('category');
  static CollectionReference product =
      FirebaseFirestore.instance.collection('product');
  static CollectionReference sale =
      FirebaseFirestore.instance.collection('sale');
  static CollectionReference saleDetail =
      FirebaseFirestore.instance.collection('saleDetail');

  //auto number
  static DocumentReference customerCode =
      FirebaseFirestore.instance.collection('auto-number').doc('customer');
}
