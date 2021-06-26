import 'package:flutter/material.dart';
import 'package:flutter1/todo_app/data/dummy_data.dart';
import 'package:flutter1/todo_app/models/task_model.dart';
import 'package:flutter1/todo_app/ui/widgets/task_widget.dart';

class CompleteTasks extends StatelessWidget {
  Function updating;
  Function removing;
  List<Task> tasks;
  CompleteTasks(this.tasks, this.updating, this.removing);
  @override
  Widget build(BuildContext context) {
    // TODO: implement build
    return tasks == null
        ? Center(
            child: CircularProgressIndicator(),
          )
        : ListView.builder(
            itemCount: tasks.where((element) => element.isComplete).length,
            itemBuilder: (context, index) {
              return TaskWidget(
                  tasks.where((element) => element.isComplete).toList()[index],
                  updating,
                  removing);
            });
  }
}
