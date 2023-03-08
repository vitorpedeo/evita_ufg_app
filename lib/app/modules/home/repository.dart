// Package imports:
import 'package:cloud_firestore/cloud_firestore.dart';

// Project imports:
import 'package:evita_ufg_app/app/data/database/db_firestore.dart';
import 'package:evita_ufg_app/app/data/models/department.dart';

class HomeRepository {
  final FirebaseFirestore _db = DBFirestore.get();

  Future<List<DepartmentModel>> getAllDepartments() async {
    try {
      final CollectionReference<Map<String, dynamic>> departmentsRef =
          _db.collection('departments');
      final QuerySnapshot departmentsSnapshot =
          await departmentsRef.orderBy('name').get();

      final List<DepartmentModel> departments =
          departmentsSnapshot.docs.map<DepartmentModel>((snapshot) {
        final Map<String, dynamic> data =
            snapshot.data() as Map<String, dynamic>;
        final Map<String, dynamic> json = <String, dynamic>{
          'id': snapshot.id,
          'name': data['name'],
          'regional': data['regional'],
        };

        return DepartmentModel.fromJson(json);
      }).toList();

      return departments;
    } catch (e) {
      rethrow;
    }
  }
}
