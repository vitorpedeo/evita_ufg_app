// Package imports:
import 'package:cloud_firestore/cloud_firestore.dart';
import 'package:evita_ufg_app/app/data/database/db_firestore.dart';
import 'package:evita_ufg_app/app/data/models/comment.dart';
import 'package:intl/intl.dart';

class CreateEvaluationRepository {
  final FirebaseFirestore _db = DBFirestore.get();

  Future<DocumentReference<Map<String, dynamic>>> postNewComment(
      Map<String, dynamic> data) async {
    try {
      final DocumentReference teacherRef =
          _db.collection('teachers').doc(data['teacher']);
      final DocumentReference userRef =
          _db.collection('users').doc(data['user']);

      return await _db.collection('comments').add({
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

  Future<CommentModel> getComment(
      DocumentReference<Map<String, dynamic>> commentRef) async {
    try {
      final DocumentSnapshot<Map<String, dynamic>> commentsSnapshot =
          await commentRef.get();
      final Map<String, dynamic>? data = commentsSnapshot.data();

      if (data == null) {
        throw Exception('Comment not found');
      }

      final Map<String, dynamic> json = <String, dynamic>{
        'id': commentsSnapshot.id,
        'content': data['content'],
        'rating': data['rating'],
        'updatedAt': data['updatedAt'] != null
            ? DateFormat('dd/MM/yyyy').format(
                DateTime.parse(
                  data['updatedAt'],
                ),
              )
            : null,
      };

      final CommentModel comment = CommentModel.fromJson(json);

      return comment;
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
