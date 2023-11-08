import 'package:cloud_firestore/cloud_firestore.dart';

class Grade {
  String id;
  String grade;
  DocumentReference? reference;

  Grade(this.id, this.grade, this.reference);

  Grade.fromMap(Map<String, dynamic> map, this.reference)
      : id = map['id'],
        grade = map['grade'];

  Map<String, dynamic> toMap() {
    return {
      'id': id,
      'grade': grade,
    };
  }
}

class GradesModel {
  final CollectionReference _gradesCollection =
  FirebaseFirestore.instance.collection('grades');

  Stream<List<Grade>> streamGrades() {
    return _gradesCollection.snapshots().map((querySnapshot) => querySnapshot.docs
        .map((doc) => Grade.fromMap(doc.data() as Map<String, dynamic>, doc.reference))
        .toList());
  }

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
