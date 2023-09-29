import 'package:cloud_firestore/cloud_firestore.dart';

class FirestoreCollection {
  const FirestoreCollection();

  static CollectionReference customer =
      FirebaseFirestore.instance.collection('customer');

  //auto number
  static DocumentReference customerCode =
      FirebaseFirestore.instance.collection('auto-number').doc('customer');
}
