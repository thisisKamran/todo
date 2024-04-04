import 'package:flutter/material.dart';
import 'package:todo/app_colors.dart';
import 'package:todo/models/task.dart';

class CompletedTodoItem extends StatelessWidget {
  const CompletedTodoItem({required this.task, super.key});
  final Task task;

  @override
  Widget build(BuildContext context) {
    return Container(
      padding: const EdgeInsets.all(10),
      margin: const EdgeInsets.all(10),
      decoration: BoxDecoration(
        color: Colors.white,
        borderRadius: BorderRadius.circular(10),
        boxShadow: const [
          BoxShadow(
            color: Color.fromARGB(255, 179, 172, 172),
            blurRadius: 7,
            offset: Offset(0, 4),
          ),
        ],
      ),
      width: MediaQuery.of(context).size.width,
      height: 82,
      child: Row(
        mainAxisAlignment: MainAxisAlignment.start,
        crossAxisAlignment: CrossAxisAlignment.center,
        children: [
          SizedBox(
            width: MediaQuery.of(context).size.width * 0.50,
            child: Padding(
              padding: const EdgeInsets.only(left: 11),
              child: Column(
                  crossAxisAlignment: CrossAxisAlignment.start,
                  mainAxisAlignment: MainAxisAlignment.center,
                  children: [
                    Text(
                      task.name,
                      style: const TextStyle(
                          color: AppColors.titleColor, fontSize: 16),
                    ),
                    Text(task.description),
                  ]),
            ),
          ),
        ],
      ),
    );
  }
}
