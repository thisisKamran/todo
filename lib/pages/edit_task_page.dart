import 'package:flutter/material.dart';
import 'package:provider/provider.dart';
import 'package:todo/app_colors.dart';
import 'package:todo/models/task.dart';
import 'package:todo/view_models/task_vm.dart';

class EditTaskPage extends StatelessWidget {
  final Task task;
  final TextEditingController nameController;
  final TextEditingController descriptionController;
  final GlobalKey<FormState> _formKey = GlobalKey<FormState>();

  EditTaskPage({required this.task, super.key})
      : nameController = TextEditingController(text: task.name),
        descriptionController = TextEditingController(text: task.description);

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(
        iconTheme: const IconThemeData(color: Colors.white),
        surfaceTintColor: Colors.white,
        backgroundColor: AppColors.appBarColor,
        title: const Text(
          "Edit Task",
          style: TextStyle(
              color: Colors.white, fontSize: 27, fontWeight: FontWeight.w500),
        ),
      ),
      body: Container(
        padding: const EdgeInsets.all(30),
        child: Form(
          key: _formKey,
          child: Column(
            children: [
              TextFormField(
                controller: nameController,
                decoration: const InputDecoration(
                  labelText: "Title",
                ),
                validator: (value) {
                  if (value == null || value.trim().isEmpty) {
                    return 'Please enter a title';
                  }
                  return null;
                },
              ),
              TextFormField(
                controller: descriptionController,
                decoration: const InputDecoration(
                  labelText: "Details",
                ),
                validator: (value) {
                  if (value == null || value.trim().isEmpty) {
                    return 'Please enter the details';
                  }
                  return null;
                },
              ),
              Padding(
                padding: const EdgeInsets.only(top: 20),
                child: InkWell(
                  onTap: () {
                    if (_formKey.currentState!.validate()) {
                      context.read<TaskVm>().edit(
                            task,
                            nameController.text,
                            descriptionController.text,
                          );
                      Navigator.pop(context);
                    }
                  },
                  child: Container(
                    decoration: BoxDecoration(
                      borderRadius: BorderRadius.circular(20),
                      color: AppColors.addButtonColor,
                    ),
                    padding: const EdgeInsets.symmetric(
                        vertical: 15, horizontal: 30),
                    child: const Text(
                      "Update",
                      style: TextStyle(color: Colors.white),
                    ),
                  ),
                ),
              ),
            ],
          ),
        ),
      ),
    );
  }
}
