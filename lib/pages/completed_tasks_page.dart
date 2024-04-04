import 'package:flutter/material.dart';

import 'package:provider/provider.dart';
import 'package:todo/app_colors.dart';
import 'package:todo/view_models/task_vm.dart';

import 'package:todo/widgets/completed_task.dart';

class CompletedTasksPage extends StatelessWidget {
  const CompletedTasksPage({super.key});

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      backgroundColor: AppColors.screenColor,
      appBar: AppBar(
        iconTheme: const IconThemeData(color: Colors.white),
        surfaceTintColor: Colors.white,
        backgroundColor: AppColors.appBarColor,
        title: const Text(
          "Completed Tasks",
          style: TextStyle(
              color: Colors.white, fontSize: 27, fontWeight: FontWeight.w500),
        ),
      ),
      body: ListView(
        children: context
            .watch<TaskVm>()
            .tasksCompleted
            .map<CompletedTodoItem>((t) => CompletedTodoItem(
                  task: t,
                ))
            .toList(),
      ),
    );
  }
}
