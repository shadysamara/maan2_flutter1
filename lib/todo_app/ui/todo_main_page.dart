import 'package:flutter/material.dart';
import 'package:flutter1/todo_app/data/dummy_data.dart';
import 'package:flutter1/todo_app/models/task_model.dart';
import 'package:flutter1/todo_app/ui/pages/all_tasks_page.dart';
import 'package:flutter1/todo_app/ui/pages/complete_tasks_page.dart';
import 'package:flutter1/todo_app/ui/pages/incomplete_tasks_page.dart';

class TodoMainPage extends StatefulWidget {
  @override
  _TodoMainPageState createState() => _TodoMainPageState();
}

class _TodoMainPageState extends State<TodoMainPage> {
  updateTask(Task task) {
    int index = tasks.indexOf(task);
    tasks[index].isComplete = !tasks[index].isComplete;
    setState(() {});
  }

  removeTask(Task task) {
    tasks.remove(task);
    setState(() {});
  }

  @override
  Widget build(BuildContext context) {
    // TODO: implement build
    return DefaultTabController(
        length: 3,
        child: Scaffold(
          appBar: AppBar(
            title: Text('Todo App'),
            bottom: TabBar(tabs: [
              Tab(
                child: Text('All Tasks'),
              ),
              Tab(
                child: Text('Complete Tasks'),
              ),
              Tab(
                child: Text('InComplete Tasks'),
              ),
            ]),
          ),
          body: TabBarView(children: [
            AllTasks(updateTask, removeTask),
            CompleteTasks(updateTask, removeTask),
            InCompleteTasks(updateTask, removeTask)
          ]),
        ));
  }
}
