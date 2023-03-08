// Package imports:
import 'package:cloud_firestore/cloud_firestore.dart';

// Project imports:
import 'package:evita_ufg_app/app/data/database/db_firestore.dart';

class EditEvaluationRepository {
  final FirebaseFirestore _db = DBFirestore.get();

  Future<void> editEvaluation(String id, Map<String, dynamic> data) async {
    try {
      final DocumentReference<Map<String, dynamic>> commentRef =
          _db.collection('comments').doc(id);

      await commentRef.update({
        'content': data['content'],
        'rating': data['rating'],
      });
    } catch (e) {
      rethrow;
    }
  }

  Future<void> updateTeacherEvaluation(Map<String, dynamic> data) async {
    try {
      final DocumentReference teacherRef =
          _db.collection('teachers').doc(data['teacher']);

      return await teacherRef.update({
        'rating': data['rating'],
        'evaluations': data['evaluations'],
      });
    } catch (e) {
      rethrow;
    }
  }
}
