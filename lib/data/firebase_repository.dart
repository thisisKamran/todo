import 'package:cloud_firestore/cloud_firestore.dart';
import 'package:todo/models/base_entity.dart';

class FirebaseRepository<T extends BaseEntity> {
  final db = FirebaseFirestore.instance;
  final String collectionName;

  FirebaseRepository(
      {required this.collectionName,
      required Function(Map<String, dynamic>) onData}) {
    db.collection(collectionName).snapshots().listen((snapshot) {
      for (var change in snapshot.docChanges) {
        onData(change.doc.data() as Map<String, dynamic>);
      }
    });
  }

  Future<dynamic> save(T entity) async {
    final collection = db.collection(collectionName);
    return collection.doc(entity.id).set(entity.toMap());
  }

  Future delete(String id) async {
    final collection = db.collection(collectionName);
    return collection.doc(id).delete();
  }
}
