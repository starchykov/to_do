import 'package:flutter/cupertino.dart';
import 'package:to_do_list/domain/models/task_model.dart';

@immutable
class TaskState {
  final List<TaskModel> tasks;

  const TaskState({
    this.tasks = const [],
  });

  TaskState copyWith({
    List<TaskModel>? tasks,
  }) {
    return TaskState(
      tasks: tasks ?? this.tasks,
    );
  }
}
