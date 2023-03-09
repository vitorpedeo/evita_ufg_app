// Package imports:
import 'package:cloud_firestore/cloud_firestore.dart';
import 'package:intl/intl.dart';

// Project imports:
import 'package:evita_ufg_app/app/data/database/db_firestore.dart';
import 'package:evita_ufg_app/app/data/models/comment.dart';
import 'package:evita_ufg_app/app/data/models/department.dart';
import 'package:evita_ufg_app/app/data/models/teacher.dart';
import 'package:evita_ufg_app/app/data/repositories/auth.dart';

class TeacherRepository {
  final FirebaseFirestore _db = DBFirestore.get();
  final AuthRepository _authRepository = AuthRepository();

  Future<TeacherModel> getTeacher(String id) async {
    try {
      final DocumentReference<Map<String, dynamic>> teacherRef =
          _db.doc('teachers/$id');
      final DocumentSnapshot<Map<String, dynamic>> teacherSnapshot =
          await teacherRef.get();
      final Map<String, dynamic> data =
          teacherSnapshot.data() as Map<String, dynamic>;

      final Map<String, dynamic> json = <String, dynamic>{
        'id': teacherSnapshot.id,
        'name': data['name'],
        'email': data['email'],
        'imageUrl': data['imageUrl'],
        'rating': data['rating'],
        'evaluations': data['evaluations'],
      };

      final TeacherModel teacher = TeacherModel.fromJson(json);

      final DepartmentModel department = await getTeacherDepartment(
          data['department'] as DocumentReference<Map<String, dynamic>>);
      final List<CommentModel> comments = await getTeacherComments(teacherRef);

      teacher.department = department;
      teacher.comments = comments;

      return teacher;
    } catch (e) {
      rethrow;
    }
  }

  Future<DepartmentModel> getTeacherDepartment(
      DocumentReference<Map<String, dynamic>> departmentRef) async {
    try {
      final DocumentSnapshot<Map<String, dynamic>> departmentSnapshot =
          await departmentRef.get();
      final Map<String, dynamic>? data = departmentSnapshot.data();

      if (data == null) {
        throw Exception('Department not found');
      }

      final Map<String, dynamic> json = <String, dynamic>{
        'id': departmentSnapshot.id,
        'name': data['name'],
        'regional': data['regional'],
      };

      final DepartmentModel department = DepartmentModel.fromJson(json);

      return department;
    } catch (e) {
      rethrow;
    }
  }

  Future<List<CommentModel>> getTeacherComments(
      DocumentReference<Map<String, dynamic>> teacherRef) async {
    try {
      final CollectionReference<Map<String, dynamic>> commentsRef =
          _db.collection('comments');
      final QuerySnapshot<Map<String, dynamic>> commentsSnapshot =
          await commentsRef
              .where(
                'teacher',
                isEqualTo: teacherRef,
              )
              .orderBy('updatedAt')
              .get();

      final List<CommentModel> comments = await Future.wait(
        commentsSnapshot.docs.map<Future<CommentModel>>(
          (snapshot) async {
            final Map<String, dynamic> data = snapshot.data();
            final Map<String, dynamic> json = <String, dynamic>{
              'id': snapshot.id,
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

  Future<void> deleteComment(String id) async {
    try {
      final DocumentReference<Map<String, dynamic>> commentRef =
          _db.collection('comments').doc(id);

      await commentRef.delete();
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
