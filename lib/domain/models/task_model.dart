import 'package:flutter/cupertino.dart';

enum Priority {high, medium, low, none}

@immutable
class TaskModel {
  final int id;
  final String title;
  final Priority priority;
  final String description;
  final DateTime? expiresDate;
  final String creatorName;

  const TaskModel({
    this.id = -1,
    this.title = '',
    this.priority = Priority.none,
    this.description = '',
    this.expiresDate,
    this.creatorName = '',
  });

  TaskModel copyWith({
    int? id,
    String? title,
    Priority? priority,
    String? description,
    DateTime? createdDate,
    String? creatorName,
  }) {
    return TaskModel(
      id: id ?? this.id,
      title: title ?? this.title,
      priority: priority ?? this.priority,
      description: description ?? this.description,
      expiresDate: createdDate ?? this.expiresDate,
      creatorName: creatorName ?? this.creatorName,
    );
  }

  @override
  String toString() {
    return 'TaskModel{id: $id, title: $title, priority: $priority, description: $description, createdDate: $expiresDate, creatorName: $creatorName}';
  }
}