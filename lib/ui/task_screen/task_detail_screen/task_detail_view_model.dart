import 'package:flutter/cupertino.dart';
import 'package:flutter/material.dart';
import 'package:intl/intl.dart';
import 'package:to_do_list/data/repositories/task_repository.dart';
import 'package:to_do_list/domain/models/task_model.dart';
import 'package:to_do_list/ui/task_screen/task_detail_screen/task_detail_screen_state.dart';

class TaskDetailViewModel extends ChangeNotifier {
  final BuildContext context;
  final TaskRepository _taskRepository = TaskRepository();
  final TextEditingController _titleTextController = TextEditingController();
  final TextEditingController _descriptionTextController = TextEditingController();
  final TextEditingController _expiresDateTextController = TextEditingController();

  TaskDetailState _state = const TaskDetailState();

  TaskDetailState get state => _state;

  TextEditingController get titleTextController => _titleTextController;

  TextEditingController get descriptionTextController => _descriptionTextController;

  TextEditingController get expiresDateTextController => _expiresDateTextController;

  TaskDetailViewModel({required this.context}) {

  }

  void goBack() {
    Navigator.of(context).pop();
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

  setCurrentPriority({Priority? priority}) {
    _state = _state.copyWith(task: _state.task.copyWith(priority: priority));
    notifyListeners();
  }

  Future<void> selectExpiresDate() async {
    DateTime? expiresDate = await showDatePicker(
      context: context,
      initialDate: DateTime.now(), //get today's date
      firstDate: DateTime(2000), //DateTime.now() - not to allow to choose before today.
      lastDate: DateTime(2101),
    );
    final DateFormat formatter = DateFormat('dd MMM');
    if (expiresDate == null) return;
    final String formattedDate = formatter.format(expiresDate);
    _expiresDateTextController.text = 'Expires on $formattedDate';
    _state = _state.copyWith(task: _state.task.copyWith(createdDate: expiresDate));
    notifyListeners();
  }

  Future<void> saveNewTask() async {
    _state = _state.copyWith(isPending: true);
    notifyListeners();

    TaskModel task = TaskModel(
      id: DateTime.timestamp().hashCode,
      title: _titleTextController.text,
      priority: _state.task.priority,
      expiresDate: _state.task.expiresDate,
    );

    await _taskRepository.saveTask(task: task);
    Navigator.of(context).pop();
  }
}
