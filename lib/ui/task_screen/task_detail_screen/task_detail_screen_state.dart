import 'package:flutter/cupertino.dart';
import 'package:to_do_list/domain/models/task_model.dart';

@immutable
class TaskDetailState {
  final TaskModel task;

  const TaskDetailState({
    this.task = const TaskModel(),
  });

  TaskDetailState copyWith({
    TaskModel? task,
  }) {
    return TaskDetailState(
      task: task ?? this.task,
    );
  }
}