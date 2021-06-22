import 'package:flutter/material.dart';
import 'package:flutter1/todo_app/models/task_model.dart';

class TaskWidget extends StatelessWidget {
  Task task;
  Function updating;
  Function removing;
  TaskWidget(this.task, this.updating, this.removing);

  @override
  Widget build(BuildContext context) {
    // TODO: implement build
    return Container(
        margin: EdgeInsets.symmetric(horizontal: 5, vertical: 5),
        padding: EdgeInsets.symmetric(horizontal: 10, vertical: 10),
        decoration: BoxDecoration(
            color: task.isComplete ? Colors.greenAccent : Colors.redAccent,
            borderRadius: BorderRadius.circular(15)),
        child: ListTile(
          leading: IconButton(
              onPressed: () {
                removing(task);
              },
              icon: Icon(Icons.delete)),
          trailing: Checkbox(
              value: task.isComplete,
              onChanged: (v) {
                updating(task);
              }),
          title: Text(task.title),
        ));
  }
}
