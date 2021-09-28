import 'dart:collection';

import 'package:flutter/foundation.dart';
import 'package:todoey_flutter/models/task.dart';

class TaskData extends ChangeNotifier {
  List<Task> _tasks = [
    Task(
      name: 'Buy milk',
    ),
    Task(
      name: 'Go to SpaceX',
    ),
    Task(
      name: 'Run 1000miles',
    ),
  ];

  // getter prevents private property from being accessed publicly
  // It can be only accessed by members of the class
  UnmodifiableListView<Task> get tasks{
    return UnmodifiableListView(_tasks);
  }

  int get taskCount {
    return _tasks.length;
  }

  void addTask(String newTaskTitle) {
    final task = Task(
      name: newTaskTitle,
    );
    _tasks.add(task);
    notifyListeners();
  }
}
