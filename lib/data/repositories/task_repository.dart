import 'package:to_do_list/data/providers/task_data_provider.dart';
import 'package:to_do_list/domain/models/task_model.dart';

class TaskRepository {
  final TaskDataProvider _taskDataProvider = TaskDataProvider();

  Future<List<TaskModel>> getTask() async {
    return _taskDataProvider.tasks;
  }

  Future<void> saveTask({required TaskModel task}) async {
    await _taskDataProvider.saveTask(task: task);
  }

  Future<void> deleteTask({required TaskModel task}) async {
    await _taskDataProvider.deleteTask(task: task);
  }

}