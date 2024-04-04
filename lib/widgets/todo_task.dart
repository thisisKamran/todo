import 'package:flutter/material.dart';
import 'package:provider/provider.dart';
import 'package:todo/app_colors.dart';
import 'package:todo/models/task.dart';
import 'package:todo/pages/edit_task_page.dart';
import 'package:todo/view_models/task_vm.dart';
import 'package:todo/widgets/app_icon_button.dart';

class TodoItem extends StatefulWidget {
  const TodoItem({required this.task, super.key});

  final Task task;

  @override
  State<TodoItem> createState() => _TodoItemState();
}

class _TodoItemState extends State<TodoItem> {
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
                      widget.task.name,
                      style: const TextStyle(
                          color: AppColors.titleColor, fontSize: 16),
                    ),
                    Text(widget.task.description),
                  ]),
            ),
          ),
          const Spacer(),
          Row(
            mainAxisAlignment: MainAxisAlignment.spaceBetween,
            children: [
              Padding(
                padding: const EdgeInsets.all(10),
                child: AppIconButton(
                  height: 27,
                  path: "assets/icons/Pencil.svg",
                  onTap: () {
                    Navigator.push(
                      context,
                      MaterialPageRoute(
                        builder: (context) => EditTaskPage(
                          task: widget.task,
                        ),
                      ),
                    );
                  },
                ),
              ),
              Padding(
                padding: const EdgeInsets.all(10),
                child: AppIconButton(
                  path: "assets/icons/Trash.svg",
                  onTap: () {
                    context.read<TaskVm>().delete(widget.task);
                  },
                  height: 27,
                ),
              ),
              Padding(
                padding: const EdgeInsets.all(10),
                child: AppIconButton(
                  height: 27,
                  path: "assets/icons/CheckCircle.svg",
                  onTap: () {
                    context.read<TaskVm>().complete(widget.task);
                  },
                ),
              ),
            ],
          ),
        ],
      ),
    );
  }
}
