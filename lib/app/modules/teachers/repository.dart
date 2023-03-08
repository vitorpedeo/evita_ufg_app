// Package imports:
import 'package:cloud_firestore/cloud_firestore.dart';

// Project imports:
import 'package:evita_ufg_app/app/data/database/db_firestore.dart';
import 'package:evita_ufg_app/app/data/models/teacher.dart';

class TeachersRepository {
  final FirebaseFirestore _db = DBFirestore.get();

  Future<List<TeacherModel>> getTeacherByDepartmentId(
      String departmentId) async {
    try {
      final DocumentReference<Map<String, dynamic>> departmentRef =
          _db.doc('departments/$departmentId');

      final CollectionReference<Map<String, dynamic>> teachersRef =
          _db.collection('teachers');
      final QuerySnapshot teachersSnapshot = await teachersRef
          .where(
            'department',
            isEqualTo: departmentRef,
          )
          .orderBy('name')
          .get();

      final List<TeacherModel> teachers =
          teachersSnapshot.docs.map<TeacherModel>((snapshot) {
        final Map<String, dynamic> data =
            snapshot.data() as Map<String, dynamic>;
        final Map<String, dynamic> json = <String, dynamic>{
          'id': snapshot.id,
          'name': data['name'],
          'email': data['email'],
          'imageUrl': data['imageUrl'],
          'rating': data['rating'],
          'evaluations': data['evaluations'],
        };

        return TeacherModel.fromJson(json);
      }).toList();

      return teachers;
    } catch (e) {
      rethrow;
    }
  }
}
