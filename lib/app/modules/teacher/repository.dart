// Package imports:
import 'package:cloud_firestore/cloud_firestore.dart';
import 'package:dio/dio.dart';
import 'package:evita_ufg_app/app/data/database/db_firestore.dart';
import 'package:evita_ufg_app/app/data/models/comment.dart';
import 'package:evita_ufg_app/app/data/repositories/auth.dart';

// Project imports:
import 'package:evita_ufg_app/app/data/services/api.dart';

class TeacherRepository {
  final FirebaseFirestore _db = DBFirestore.get();
  final ApiService _apiService = ApiService();
  final AuthRepository _authRepository = AuthRepository();

  Future<List<CommentModel>> getTeacherComments(String teacherId) async {
    try {
      final DocumentReference<Map<String, dynamic>> teacherRef =
          _db.doc('teachers/$teacherId');

      final CollectionReference<Map<String, dynamic>> commentsRef =
          _db.collection('comments');
      final QuerySnapshot commentsSnapshot = await commentsRef
          .where(
            'teacher',
            isEqualTo: teacherRef,
          )
          .orderBy('updatedAt')
          .get();

      final List<CommentModel> comments = await Future.wait(
        commentsSnapshot.docs.map<Future<CommentModel>>(
          (snapshot) async {
            final Map<String, dynamic> data =
                snapshot.data() as Map<String, dynamic>;
            final Map<String, dynamic> json = <String, dynamic>{
              'id': snapshot.id,
              'content': data['content'],
              'rating': data['rating'],
              'updatedAt': data['updatedAt'],
            };

            final CommentModel comment = CommentModel.fromJson(json);
            comment.user = await _authRepository.getUser(
                ref: data['user'] as DocumentReference<Map<String, dynamic>>);

            return comment;
          },
        ),
      );

      return comments;
    } catch (e) {
      rethrow;
    }
  }

  Future<void> deleteComment(int id) async {
    try {
      await _apiService
          .getApi(
            needTokenAuth: true,
          )
          .delete('/comment/$id');
    } on DioError catch (e) {
      if (e.response != null) {
        throw e.response!.data['message'];
      } else {
        throw e.message;
      }
    }
  }
}
