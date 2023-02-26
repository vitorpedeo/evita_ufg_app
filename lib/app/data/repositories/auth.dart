import 'package:cloud_firestore/cloud_firestore.dart';
import 'package:evita_ufg_app/app/data/database/db_firestore.dart';
import 'package:evita_ufg_app/app/data/models/user.dart';
import 'package:firebase_auth/firebase_auth.dart';

class AuthRepository {
  late final FirebaseFirestore _dbFirestore;

  AuthRepository() {
    _dbFirestore = DBFirestore.get();
  }

  Future<UserModel> newUser(
      {required User? firebaseUser,
      Map<String, dynamic>? additionalInfo}) async {
    try {
      final UserModel user = UserModel(
        id: firebaseUser?.uid,
        name: additionalInfo != null ? additionalInfo['name'] : '',
        email: firebaseUser?.email,
        avatarUrl: firebaseUser?.photoURL,
        createdAt: DateTime.now().toIso8601String(),
      );

      final DocumentReference userRef =
          _dbFirestore.collection('users').doc(firebaseUser?.uid);

      await userRef.set(user.toFirebaseJson());

      return user;
    } catch (e) {
      rethrow;
    }
  }

  Future<UserModel?> getUser({required String? id}) async {
    try {
      final DocumentReference userRef =
          _dbFirestore.collection('users').doc(id);

      final DocumentSnapshot snapshot = await userRef.get();

      if (snapshot.data() == null) {
        return null;
      }

      final Map<String, dynamic> data = snapshot.data() as Map<String, dynamic>;

      final UserModel user = UserModel(
        id: snapshot.id,
        name: data['name'],
        email: data['email'],
        avatarUrl: data['avatarUrl'],
        createdAt: data['createdAt'],
      );

      return user;
    } catch (e) {
      rethrow;
    }
  }
}
