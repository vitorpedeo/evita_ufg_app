import 'package:cloud_firestore/cloud_firestore.dart';

class DBFirestore {
  static final DBFirestore _instance = DBFirestore._();
  final FirebaseFirestore _firestore = FirebaseFirestore.instance;

  DBFirestore._();

  static FirebaseFirestore get() {
    return DBFirestore._instance._firestore;
  }
}
