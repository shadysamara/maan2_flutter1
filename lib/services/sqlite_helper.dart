import 'dart:io';

import 'package:flutter1/todo_app/models/task_model.dart';
import 'package:path_provider/path_provider.dart';
import 'package:sqflite/sqflite.dart';
import 'package:sqflite/sqlite_api.dart';

class SqliteHelper {
  //singleton
  static SqliteHelper sqliteHelper = SqliteHelper();
  Database database;
  initDatabase() async {
    if (database == null) {
      database = await createDatabase();
    } else {
      return database;
    }
  }

  Future<Database> createDatabase() async {
    Directory appDocDir = await getApplicationDocumentsDirectory();
    String appDocPath = appDocDir.path;
    String fullpath = appDocPath + '/tasks.db';
    Database database =
        await openDatabase(fullpath, version: 1, onCreate: (db, version) {
      print('this db has been created ${db.path}');
      db.execute('''CREATE TABLE tasks 
     (id INTEGER PRIMARY KEY, title TEXT, isComplete INTEGER)''');
    }, onOpen: (database) {
      print('this db has been opened ${database.path}');
      print(database.path);
    });
    return database;
  }

  insertNewTask(Task task) async {
    int rowNumber = await database.insert('tasks', {...task.toMap()});
    print(rowNumber);
  }

  Future<List<Task>> getAllTasks() async {
    List<Map<String, Object>> rows = await database.query('tasks');
    List<Task> tasks = rows.map((e) => Task.fromMap(e)).toList();
    return tasks;
  }

  Future<Task> getOneTask(int taskId) async {
    List<Map<String, Object>> rows =
        await database.query('tasks', where: 'id=?', whereArgs: [taskId]);
    Task task = Task.fromMap(rows.first);
    return task;
  }

  deleteTask(int taskId) async {
    int deletedTasks =
        await database.delete('tasks', where: 'id=?', whereArgs: [taskId]);
    print(deletedTasks);
  }

  updateTask(Task task) async {
    task.isComplete = !task.isComplete;
    int deletedTasks = await database
        .update('tasks', task.toMap(), where: 'id=?', whereArgs: [task.id]);
    print(deletedTasks);
  }
}
