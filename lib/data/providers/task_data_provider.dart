import 'package:to_do_list/domain/models/task_model.dart';

class TaskDataProvider {
  TaskDataProvider._privateConstructor();

  static TaskDataProvider _instance = TaskDataProvider._privateConstructor();

  factory TaskDataProvider() {
    return _instance;
  }

  List<TaskModel> _tasksMockup = <TaskModel>[];

  List<TaskModel> get tasks => _tasksMockup;

  Future<void> saveTask({required TaskModel task}) async {
    await Future.delayed(Duration(seconds: 3));
    _tasksMockup = [..._tasksMockup, task];
  }

  Future<void> deleteTask({required TaskModel task}) async {
    _tasksMockup.remove(task);
  }

}
