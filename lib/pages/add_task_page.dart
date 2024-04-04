import 'package:flutter/material.dart';
import 'package:provider/provider.dart';
import 'package:todo/app_colors.dart';
import 'package:todo/view_models/task_vm.dart';

class AddTaskPage extends StatelessWidget {
  AddTaskPage({super.key});

  final GlobalKey<FormState> _formKey = GlobalKey<FormState>();

  @override
  Widget build(BuildContext context) {
    final TextEditingController nameController = TextEditingController();
    final TextEditingController descriptionController = TextEditingController();

    return Scaffold(
      appBar: AppBar(
        iconTheme: const IconThemeData(color: Colors.white),
        surfaceTintColor: Colors.white,
        backgroundColor: AppColors.appBarColor,
        title: const Text(
          "Add Task",
          style: TextStyle(
              color: Colors.white, fontSize: 27, fontWeight: FontWeight.w500),
        ),
      ),
      body: SizedBox(
        width: MediaQuery.of(context).size.width,
        child: Form(
          key: _formKey,
          child: Column(children: [
            Container(
              padding: const EdgeInsets.all(30),
              child: Column(children: [
                TextFormField(
                  maxLength: 20,
                  controller: nameController,
                  decoration: const InputDecoration(
                    label: Text("Title"),
                  ),
                  validator: (value) {
                    if (value == null || value.isEmpty) {
                      return 'Please enter a title';
                    }
                    return null;
                  },
                ),
                TextFormField(
                  maxLength: 100,
                  controller: descriptionController,
                  decoration: const InputDecoration(
                    label: Text("Description"),
                  ),
                  validator: (value) {
                    if (value == null || value.isEmpty) {
                      return 'Please enter a description';
                    }
                    return null;
                  },
                ),
              ]),
            ),
            Padding(
              padding: const EdgeInsets.only(top: 20),
              child: Container(
                padding: const EdgeInsets.symmetric(horizontal: 10),
                width: MediaQuery.of(context).size.width,
                child: FloatingActionButton(
                  backgroundColor: AppColors.addButtonColor,
                  onPressed: () {
                    if (_formKey.currentState!.validate()) {
                      context.read<TaskVm>().create(
                          nameController.text, descriptionController.text);
                      Navigator.pop(context);
                    }
                  },
                  child: const Text(
                    "ADD",
                    style: TextStyle(color: Colors.white),
                  ),
                ),
              ),
            )
          ]),
        ),
      ),
    );
  }
}
