import 'package:flutter/material.dart';
import 'package:flutter1/forms/new_task.dart';
import 'package:flutter1/services/router_service.dart';
import 'package:flutter1/services/sqlite_helper.dart';
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
  List<Task> tasks;

  updateTask(Task task) async {
    await SqliteHelper.sqliteHelper.updateTask(task);
    getAllTasks();
  }

  removeTask(Task task) async {
    await SqliteHelper.sqliteHelper.deleteTask(task.id);
    getAllTasks();
  }

  getAllTasks() async {
    tasks = await SqliteHelper.sqliteHelper.getAllTasks();
    setState(() {});
  }

  @override
  void initState() {
    // TODO: implement initState
    super.initState();
    getAllTasks();
  }

  @override
  Widget build(BuildContext context) {
    // TODO: implement build
    return DefaultTabController(
        length: 3,
        child: Scaffold(
          appBar: AppBar(
            actions: [
              IconButton(
                icon: Icon(Icons.add),
                onPressed: () async {
                  await Navigator.push(context,
                      MaterialPageRoute(builder: (context) {
                    return NewTaskPage();
                  }));
                  getAllTasks();
                },
              )
            ],
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
            AllTasks(tasks, updateTask, removeTask),
            CompleteTasks(tasks, updateTask, removeTask),
            InCompleteTasks(tasks, updateTask, removeTask)
          ]),
        ));
  }
}
