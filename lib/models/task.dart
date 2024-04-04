import 'package:todo/models/base_entity.dart';

class Task extends BaseEntity {
  static const collectionName = "tasks";
  String name;
  String description;
  bool isCompleted;

  Task(
      {String? id,
      required this.name,
      required this.description,
      this.isCompleted = false,
      DateTime? createdAt})
      : super(id, createdAt: createdAt);

  @override
  Map<String, dynamic> toMap() {
    return {
      'id': id,
      'name': name,
      'description': description,
      'isCompleted': isCompleted,
      'createdAt': createdAt.toString(),
    };
  }

  factory Task.fromMap(Map<String, dynamic> map) {
    return Task(
      id: map["id"],
      name: map["name"],
      description: map["description"],
      isCompleted: map["isCompleted"],
      createdAt: DateTime.parse(map['createdAt']),
    );
  }

  @override
  String toString() {
    return "$name , $id";
  }
}
