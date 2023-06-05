import 'package:flutter/cupertino.dart';
import 'package:to_do_list/domain/models/task_model.dart';

@immutable
class TaskDetailState {
  final TaskModel task;
  final bool isPending;

  const TaskDetailState({
    this.task = const TaskModel(),
    this.isPending = false,
  });

  TaskDetailState copyWith({
    TaskModel? task,
    bool? isPending,
  }) {
    return TaskDetailState(
      task: task ?? this.task,
      isPending: isPending ?? this.isPending,
    );
  }
}