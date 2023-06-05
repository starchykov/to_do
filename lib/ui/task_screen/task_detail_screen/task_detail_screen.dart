import 'package:flutter/material.dart';
import 'package:provider/provider.dart';
import 'package:to_do_list/domain/models/task_model.dart';
import 'package:to_do_list/ui/task_screen/task_detail_screen/task_detail_screen_state.dart';
import 'package:to_do_list/ui/task_screen/task_detail_screen/task_detail_view_model.dart';

class TaskDetailScreen extends StatelessWidget {
  const TaskDetailScreen({super.key});

  static Widget render() {
    return ChangeNotifierProvider(
      create: (context) => TaskDetailViewModel(context: context),
      child: const TaskDetailScreen(),
    );
  }

  @override
  Widget build(BuildContext context) {
    TaskDetailViewModel viewModel = context.read<TaskDetailViewModel>();
    TaskDetailState state = context.select((TaskDetailViewModel viewModel) => viewModel.state);
    return Scaffold(
      appBar: AppBar(
        leading: IconButton(
          onPressed: viewModel.goBack,
          icon: const Icon(Icons.close, size: 28.0),
        ),
        bottom: PreferredSize(
          preferredSize: const Size.fromHeight(32.0),
          child: Column(
            mainAxisSize: MainAxisSize.max,
            crossAxisAlignment: CrossAxisAlignment.start,
            children: [
              Container(
                width: MediaQuery.of(context).size.width,
                padding: const EdgeInsets.all(16.0),
                child: Text(
                  'Create new task',
                  style: Theme.of(context).textTheme.titleLarge?.merge(const TextStyle(color: Colors.white)),
                ),
              ),
            ],
          ),
        ),
        actions: [
          IconButton(onPressed: () {}, icon: const Icon(Icons.more_vert, size: 28.0)),
        ],
      ),
      body: SafeArea(
        child: Padding(
          padding: const EdgeInsets.all(16.0),
          child: Column(
            children: [
              Form(
                child: Column(
                  children: [
                    Padding(
                      padding: const EdgeInsets.symmetric(vertical: 8.0),
                      child: Column(
                        crossAxisAlignment: CrossAxisAlignment.start,
                        children: [
                          Text(
                            'Title',
                            style: Theme.of(context)
                                .textTheme
                                .titleMedium
                                ?.merge(const TextStyle(fontWeight: FontWeight.bold)),
                          ),
                          const SizedBox(height: 8.0),
                          TextField(
                            keyboardType: TextInputType.multiline,
                            maxLines: null,
                            controller: viewModel.titleTextController,
                            decoration: const InputDecoration(
                              filled: true,
                              fillColor: Color(0xFFFFFFFF),
                              hintText: 'Title',
                              border: OutlineInputBorder(
                                borderRadius: BorderRadius.all(Radius.circular(10.0)),
                                borderSide: BorderSide(color: Color(0xFF000000), width: 1.0),
                              ),
                              enabledBorder: OutlineInputBorder(
                                borderRadius: BorderRadius.all(Radius.circular(10.0)),
                                borderSide: BorderSide(color: Color(0xFF000000), width: 1.0),
                              ),
                              disabledBorder: OutlineInputBorder(
                                borderRadius: BorderRadius.all(Radius.circular(10.0)),
                                borderSide: BorderSide(color: Color(0xFF000000), width: 1.0),
                              ),
                              focusedBorder: OutlineInputBorder(
                                borderRadius: BorderRadius.all(Radius.circular(10.0)),
                                borderSide: BorderSide(color: Color(0xFF000000), width: 2.0),
                              ),
                              errorBorder: OutlineInputBorder(
                                borderRadius: BorderRadius.all(Radius.circular(10.0)),
                                borderSide: BorderSide(color: Color(0xFFD32F2F), width: 1.0),
                              ),
                              focusedErrorBorder: OutlineInputBorder(
                                borderRadius: BorderRadius.all(Radius.circular(10.0)),
                                borderSide: BorderSide(color: Color(0xFFD32F2F), width: 2.0),
                              ),
                            ),
                            onChanged: (value) {},
                          ),
                        ],
                      ),
                    ),
                    Padding(
                      padding: const EdgeInsets.symmetric(vertical: 8.0),
                      child: Column(
                        crossAxisAlignment: CrossAxisAlignment.start,
                        children: [
                          Text(
                            'Description',
                            style: Theme.of(context)
                                .textTheme
                                .titleMedium
                                ?.merge(const TextStyle(fontWeight: FontWeight.bold)),
                          ),
                          const SizedBox(height: 8.0),
                          TextField(
                            keyboardType: TextInputType.multiline,
                            maxLines: null,
                            controller: viewModel.descriptionTextController,
                            decoration: const InputDecoration(
                              filled: true,
                              fillColor: Color(0xFFFFFFFF),
                              hintText: 'Description',
                              border: OutlineInputBorder(
                                borderRadius: BorderRadius.all(Radius.circular(10.0)),
                                borderSide: BorderSide(color: Color(0xFF000000), width: 1.0),
                              ),
                              enabledBorder: OutlineInputBorder(
                                borderRadius: BorderRadius.all(Radius.circular(10.0)),
                                borderSide: BorderSide(color: Color(0xFF000000), width: 1.0),
                              ),
                              disabledBorder: OutlineInputBorder(
                                borderRadius: BorderRadius.all(Radius.circular(10.0)),
                                borderSide: BorderSide(color: Color(0xFF000000), width: 1.0),
                              ),
                              focusedBorder: OutlineInputBorder(
                                borderRadius: BorderRadius.all(Radius.circular(10.0)),
                                borderSide: BorderSide(color: Color(0xFF000000), width: 2.0),
                              ),
                              errorBorder: OutlineInputBorder(
                                borderRadius: BorderRadius.all(Radius.circular(10.0)),
                                borderSide: BorderSide(color: Color(0xFFD32F2F), width: 1.0),
                              ),
                              focusedErrorBorder: OutlineInputBorder(
                                borderRadius: BorderRadius.all(Radius.circular(10.0)),
                                borderSide: BorderSide(color: Color(0xFFD32F2F), width: 2.0),
                              ),
                            ),
                            onChanged: (value) {},
                          ),
                        ],
                      ),
                    ),
                    Padding(
                      padding: const EdgeInsets.symmetric(vertical: 8.0),
                      child: Column(
                        crossAxisAlignment: CrossAxisAlignment.start,
                        children: [
                          Text(
                            'Task setup',
                            style: Theme.of(context)
                                .textTheme
                                .titleMedium
                                ?.merge(const TextStyle(fontWeight: FontWeight.bold)),
                          ),
                          const SizedBox(height: 8.0),
                          TextField(
                            keyboardType: TextInputType.multiline,
                            maxLines: null,
                            controller: viewModel.expiresDateTextController,
                            decoration: const InputDecoration(
                              filled: true,
                              fillColor: Color(0xFFFFFFFF),
                              hintText: 'Expires',
                              border: OutlineInputBorder(
                                borderRadius: BorderRadius.all(Radius.circular(10.0)),
                                borderSide: BorderSide(color: Color(0xFF000000), width: 1.0),
                              ),
                              enabledBorder: OutlineInputBorder(
                                borderRadius: BorderRadius.all(Radius.circular(10.0)),
                                borderSide: BorderSide(color: Color(0xFF000000), width: 1.0),
                              ),
                              disabledBorder: OutlineInputBorder(
                                borderRadius: BorderRadius.all(Radius.circular(10.0)),
                                borderSide: BorderSide(color: Color(0xFF000000), width: 1.0),
                              ),
                              focusedBorder: OutlineInputBorder(
                                borderRadius: BorderRadius.all(Radius.circular(10.0)),
                                borderSide: BorderSide(color: Color(0xFF000000), width: 2.0),
                              ),
                              errorBorder: OutlineInputBorder(
                                borderRadius: BorderRadius.all(Radius.circular(10.0)),
                                borderSide: BorderSide(color: Color(0xFFD32F2F), width: 1.0),
                              ),
                              focusedErrorBorder: OutlineInputBorder(
                                borderRadius: BorderRadius.all(Radius.circular(10.0)),
                                borderSide: BorderSide(color: Color(0xFFD32F2F), width: 2.0),
                              ),
                            ),
                            readOnly: true,
                            onTap: viewModel.selectExpiresDate,
                            onChanged: (value) {},
                          ),
                          const SizedBox(height: 8.0),
                          Container(
                            height: 60,
                            margin: EdgeInsets.symmetric(vertical: 8.0),
                            child: ButtonTheme(
                              alignedDropdown: true,
                              child: DropdownButtonFormField(
                                value: state.task.priority,
                                decoration: const InputDecoration(
                                  filled: true,
                                  fillColor: Color(0xFFFFFFFF),
                                  hintText: 'Description',
                                  border: OutlineInputBorder(
                                    borderRadius: BorderRadius.all(Radius.circular(10.0)),
                                    borderSide: BorderSide(color: Color(0xFF000000), width: 1.0),
                                  ),
                                  enabledBorder: OutlineInputBorder(
                                    borderRadius: BorderRadius.all(Radius.circular(10.0)),
                                    borderSide: BorderSide(color: Color(0xFF000000), width: 1.0),
                                  ),
                                  disabledBorder: OutlineInputBorder(
                                    borderRadius: BorderRadius.all(Radius.circular(10.0)),
                                    borderSide: BorderSide(color: Color(0xFF000000), width: 1.0),
                                  ),
                                  focusedBorder: OutlineInputBorder(
                                    borderRadius: BorderRadius.all(Radius.circular(10.0)),
                                    borderSide: BorderSide(color: Color(0xFF000000), width: 2.0),
                                  ),
                                  errorBorder: OutlineInputBorder(
                                    borderRadius: BorderRadius.all(Radius.circular(10.0)),
                                    borderSide: BorderSide(color: Color(0xFFD32F2F), width: 1.0),
                                  ),
                                  focusedErrorBorder: OutlineInputBorder(
                                    borderRadius: BorderRadius.all(Radius.circular(10.0)),
                                    borderSide: BorderSide(color: Color(0xFFD32F2F), width: 2.0),
                                  ),
                                ),
                                onChanged: (value) => viewModel.setCurrentPriority(priority: value),
                                items: Priority.values
                                    .map((Priority value) => DropdownMenuItem(
                                          value: value,
                                          child: Row(
                                            children: [
                                              Container(
                                                width: 64.0,
                                                height: 18.0,
                                                decoration: BoxDecoration(
                                                  color: viewModel.getCurrentPriorityColor(priority: value),
                                                  borderRadius: const BorderRadius.all(Radius.circular(12)),
                                                ),
                                              ),
                                              SizedBox(width: 8.0),
                                              Text(value.name[0].toUpperCase() + value.name.substring(1)),
                                            ],
                                          ),
                                        ))
                                    .toList(),
                              ),
                            ),
                          ),
                        ],
                      ),
                    ),
                  ],
                ),
              ),
              const Spacer(),
              SizedBox(
                width: double.maxFinite,
                height: 48.0,
                child: FilledButton(
                  onPressed: viewModel.saveNewTask,
                  child: const Text('Save'),
                ),
              ),
            ],
          ),
        ),
      ),
    );
  }
}
