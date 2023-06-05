import 'package:flutter/material.dart';
import 'package:to_do_list/ui/task_screen/task_screen.dart';

class TaskApplication extends StatelessWidget {
  const TaskApplication({super.key});

  @override
  Widget build(BuildContext context) {
    return MaterialApp(
      debugShowCheckedModeBanner: false,
      theme: ThemeData(
        primaryColor: Colors.blueAccent
      ),
      home: TaskScreen.render(),
    );
  }
}
