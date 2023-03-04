// Package imports:
import 'package:cloud_firestore/cloud_firestore.dart';
import 'package:evita_ufg_app/app/data/database/db_firestore.dart';

class CreateEvaluationRepository {
  final FirebaseFirestore _db = DBFirestore.get();

  Future<void> postNewEvaluation(Map<String, dynamic> data) async {
    try {
      final DocumentReference teacherRef =
          _db.collection('teachers').doc(data['teacher']);
      final DocumentReference userRef =
          _db.collection('users').doc(data['user']);

      await _db.collection('comments').add({
        'content': data['content'],
        'rating': data['rating'],
        'updatedAt': DateTime.now().toIso8601String(),
        'teacher': teacherRef,
        'user': userRef,
      });
    } catch (e) {
      rethrow;
    }
  }
}
