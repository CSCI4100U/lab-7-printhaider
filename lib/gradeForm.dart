import 'package:cloud_firestore/cloud_firestore.dart';
import 'GradesModel.dart';
class GradesModel {
  final CollectionReference _gradesCollection =
  FirebaseFirestore.instance.collection('grades');

  // Get all grades from Firestore
  Future<List<Grade>> getGrades() async {
    final QuerySnapshot snapshot = await _gradesCollection.get();
    return snapshot.docs.map((doc) {
      return Grade.fromMap(doc.data() as Map<String, dynamic>, doc.reference);
    }).toList();
  }

  // Add a new grade to Firestore
  Future<void> addGrade(Grade grade) async {
    await _gradesCollection.add(grade.toMap());
  }

  // Update an existing grade in Firestore
  Future<void> updateGrade(Grade grade) async {
    await grade.reference!.update(grade.toMap());
  }

  // Delete a grade from Firestore
  Future<void> deleteGrade(Grade grade) async {
    await grade.reference!.delete();
  }
}


