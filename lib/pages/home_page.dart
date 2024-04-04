import 'package:flutter/cupertino.dart';
import 'package:flutter/material.dart';
import 'package:flutter_svg/svg.dart';
import 'package:provider/provider.dart';
import 'package:todo/app_colors.dart';
import 'package:todo/pages/add_task_page.dart';
import 'package:todo/pages/completed_tasks_page.dart';
import 'package:todo/view_models/task_vm.dart';
import 'package:todo/widgets/calendar.dart';
import 'package:todo/widgets/todo_task.dart';

class HomePage extends StatelessWidget {
  const HomePage({super.key});

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      bottomNavigationBar: BottomNavigationBar(
        items: <BottomNavigationBarItem>[
          BottomNavigationBarItem(
            icon: Padding(
              padding: const EdgeInsets.all(6),
              child: SvgPicture.asset(
                "assets/icons/All.svg",
                height: 16,
                width: 16,
              ),
            ),
            label: 'All',
          ),
          const BottomNavigationBarItem(
            icon: Icon(
              Icons.done,
              size: 30,
            ),
            label: 'Completed',
          ),
        ],
        onTap: (index) {
          if (index == 1) {
            Navigator.push(
                context,
                MaterialPageRoute(
                    builder: (context) => const CompletedTasksPage()));
          }
        },
      ),
      floatingActionButton: FloatingActionButton(
        backgroundColor: AppColors.addButtonColor,
        shape: const CircleBorder(),
        onPressed: () {
          Navigator.push(
              context, MaterialPageRoute(builder: (context) => AddTaskPage()));
        },
        child: const Icon(
          CupertinoIcons.add,
          color: Colors.white,
          size: 20,
        ),
      ),
      appBar: AppBar(
        backgroundColor: AppColors.appBarColor,
        actions: const [
          Padding(
            padding: EdgeInsets.only(left: 10),
            child: Text(
              "TODO APP",
              style: TextStyle(
                  color: Colors.white,
                  fontSize: 27,
                  fontWeight: FontWeight.w500),
            ),
          ),
          Spacer(),
          Padding(padding: EdgeInsets.only(right: 10), child: Calendar())
        ],
      ),
      body: Container(
        height: MediaQuery.of(context).size.height,
        color: AppColors.screenColor,
        child: ListView(
          children: context
              .watch<TaskVm>()
              .tasksToDo
              .map<TodoItem>((t) => TodoItem(
                    task: t,
                  ))
              .toList(),
        ),
      ),
    );
  }
}
