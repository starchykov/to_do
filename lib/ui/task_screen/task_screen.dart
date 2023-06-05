import 'package:flutter/material.dart';
import 'package:provider/provider.dart';
import 'package:to_do_list/domain/models/task_model.dart';
import 'package:to_do_list/ui/task_screen/task_screen_state.dart';
import 'package:to_do_list/ui/task_screen/task_view_model.dart';

class TaskScreen extends StatelessWidget {
  const TaskScreen({super.key});

  static Widget render() {
    return ChangeNotifierProvider(
      create: (context) => TaskViewModel(context: context),
      child: const TaskScreen(),
    );
  }

  @override
  Widget build(BuildContext context) {
    TaskViewModel viewModel = context.read<TaskViewModel>();
    TaskState state = context.select((TaskViewModel viewModel) => viewModel.state);
    return Scaffold(
      appBar: AppBar(
        leading: const BackButton(),
        centerTitle: false,
        title: Column(
          crossAxisAlignment: CrossAxisAlignment.start,
          children: [
            const Text(
              'Trello app redesign',
            ),
            Text(
              'Design team',
              style: Theme.of(context).textTheme.labelLarge?.merge(const TextStyle(color: Colors.white)),
            ),
          ],
        ),
        actions: [
          IconButton(onPressed: () {}, icon: const Icon(Icons.search, size: 28.0)),
          IconButton(onPressed: () {}, icon: const Icon(Icons.add_alert, size: 28.0)),
          IconButton(onPressed: () {}, icon: const Icon(Icons.more_vert, size: 28.0)),
        ],
      ),
      body: SafeArea(
        child: Padding(
          padding: const EdgeInsets.all(12.0),
          child: Column(
            crossAxisAlignment: CrossAxisAlignment.start,
            mainAxisSize: MainAxisSize.max,
            children: [
              Text(
                'Need to do',
                style: Theme.of(context).textTheme.headlineLarge?.merge(const TextStyle(fontWeight: FontWeight.bold)),
              ),
              Expanded(
                child: ListView(
                  children: state.tasks.map((TaskModel task) => _TaskItem(task: task)).toList(),
                ),
              ),
            ],
          ),
        ),
      ),
      floatingActionButtonLocation: FloatingActionButtonLocation.centerDocked,
      floatingActionButton: Padding(
        padding: const EdgeInsets.all(24.0),
        child: FloatingActionButton(
          onPressed: viewModel.crateNewTask,
          child: const Icon(Icons.add),
        ),
      ),
    );
  }
}

class _TaskItem extends StatelessWidget {
  const _TaskItem({required this.task});

  final TaskModel task;

  @override
  Widget build(BuildContext context) {
    TaskViewModel viewModel = context.read<TaskViewModel>();
    return Card(
      child: Padding(
        padding: const EdgeInsets.all(12.0),
        child: Column(
          crossAxisAlignment: CrossAxisAlignment.start,
          children: [
            Container(
              width: 64.0,
              height: 18.0,
              decoration: BoxDecoration(
                color: viewModel.getCurrentPriorityColor(priority: task.priority),
                borderRadius: const BorderRadius.all(Radius.circular(12)),
              ),
            ),
            const SizedBox(height: 8.0),
            Text(
              task.title,
              style: Theme.of(context).textTheme.titleMedium?.merge(const TextStyle(fontWeight: FontWeight.bold)),
            ),
            const SizedBox(height: 8.0),
            Row(
              children: [
                const Icon(Icons.access_time, size: 18.0),
                const SizedBox(width: 8.0),
                Text(
                  viewModel.getCurrentDate(taskDate: task.expiresDate),
                  style: Theme.of(context).textTheme.titleSmall?.merge(const TextStyle(fontWeight: FontWeight.bold)),
                ),
                const SizedBox(width: 8.0),
                const Icon(Icons.align_horizontal_left_sharp, size: 18.0),
                const Spacer(),
                const CircleAvatar(radius: 16.0, backgroundColor: Colors.grey)
              ],
            )
          ],
        ),
      ),
    );
  }
}
