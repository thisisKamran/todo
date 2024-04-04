import 'package:flutter/foundation.dart';
import 'package:todo/data/firebase_repository.dart';
import 'package:todo/models/task.dart';

class TaskVm extends ChangeNotifier {
  late FirebaseRepository<Task> _taskRepo;
  List<Task> tasksToDo = [];
  List<Task> tasksCompleted = [];

  TaskVm() {
    _taskRepo = FirebaseRepository<Task>(
        collectionName: Task.collectionName, onData: _taskReceived);
  }

  _taskReceived(Map<String, dynamic> data) {
    final Task task = Task.fromMap(data);
    tasksToDo.removeWhere((element) => element.id == task.id);
    tasksCompleted.removeWhere((element) => element.id == task.id);
    if (task.isCompleted) {
      tasksCompleted.add(task);
    } else {
      tasksToDo.add(task);
    }
    notifyListeners();
  }

  Future create(String name, String description) async {
    var task = Task(name: name, description: description);
    await _taskRepo.save(task);
  }

  Future edit(Task task, String newName, String newDescription) async {
    task.name = newName;
    task.description = newDescription;
    await _taskRepo.save(task);
  }

  Future complete(Task task) async {
    task.isCompleted = true;
    _taskRepo.save(task);
  }

  Future delete(Task task) async {
    await _taskRepo.delete(task.id);
    tasksToDo.removeWhere((element) => element.id == task.id);
    notifyListeners();
  }
}
