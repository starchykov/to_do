import 'package:flutter/material.dart';
import 'package:intl/intl.dart';
import 'package:to_do_list/data/repositories/task_repository.dart';
import 'package:to_do_list/domain/models/task_model.dart';
import 'package:to_do_list/ui/task_screen/task_detail_screen/task_detail_screen.dart';
import 'package:to_do_list/ui/task_screen/task_screen_state.dart';

class TaskViewModel extends ChangeNotifier {
  final BuildContext context;
  final TaskRepository _taskRepository = TaskRepository();

  TaskState _state = const TaskState();

  TaskState get state => _state;

  TaskViewModel({required this.context}) {
    _initialize();
  }

  void _initialize() async {
    await getTasks();
  }

  Future<void> getTasks() async {
    List<TaskModel> tasks = await _taskRepository.getTask();
    _state = _state.copyWith(tasks: tasks);
    notifyListeners();
  }

  Future<void> crateNewTask() async {
    await Navigator.push(
      context,
      MaterialPageRoute(builder: (context) => TaskDetailScreen.render()),
    );
    await getTasks();
  }

  Color getCurrentPriorityColor({required Priority priority}) {
    Color color = switch (priority) {
      Priority.high => Colors.red,
      Priority.medium => Colors.orange,
      Priority.low => Colors.lightGreen,
      _ => Colors.grey
    };
    return color;
  }

  String getCurrentDate({required DateTime? taskDate}) {
    if (taskDate == null) return '';
    final DateFormat formatter = DateFormat('dd MMM');
    final String formattedDate = formatter.format(taskDate);
    return formattedDate;
  }
}
