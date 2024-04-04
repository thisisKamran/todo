import 'package:uuid/uuid.dart';

abstract class BaseEntity {
  BaseEntity(String? id, {DateTime? createdAt})
      : id = id ?? const Uuid().v4(),
        createdAt = createdAt ?? DateTime.now();
  final String id;
  final DateTime createdAt;

  Map<String, dynamic> toMap();
}
