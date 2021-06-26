import 'package:flutter/material.dart';
import 'package:flutter1/services/sqlite_helper.dart';
import 'package:flutter1/todo_app/models/task_model.dart';
import 'package:string_validator/string_validator.dart';

class NewTaskPage extends StatefulWidget {
  @override
  _NewTaskPageState createState() => _NewTaskPageState();
}

class _NewTaskPageState extends State<NewTaskPage> {
  bool isCompleted = false;
  String taskName;
  String email;
  String date;
  TextEditingController controller = TextEditingController();
  GlobalKey<FormState> formKey = GlobalKey<FormState>();
  saveForm() async {
    bool isValidate = formKey.currentState.validate();
    if (isValidate == true) {
      formKey.currentState.save();
      Task task = Task(taskName, isCompleted);
      await SqliteHelper.sqliteHelper.insertNewTask(task);
      Navigator.pop(context);
    } else {
      print('error');
    }
  }

  @override
  Widget build(BuildContext context) {
    // TODO: implement build
    return Scaffold(
      appBar: AppBar(
        title: Text('New Task'),
      ),
      body: Container(
        padding: EdgeInsets.all(20),
        child: Form(
          key: formKey,
          child: Column(
            children: [
              TextFormField(
                validator: (value) {
                  if (value.length == 0 || value == null) {
                    return '* Required field';
                  }
                },
                onSaved: (v) {
                  this.taskName = v;
                },
                decoration: InputDecoration(
                    border: OutlineInputBorder(
                        borderRadius: BorderRadius.circular(20)),
                    labelText: 'Task name'),
              ),
              SizedBox(
                height: 20,
              ),
              TextFormField(
                validator: (value) {
                  if (value.length == 0 || value == null) {
                    return '* Required field';
                  } else if (!isEmail(value)) {
                    return 'Incorrect email address syntax';
                  }
                },
                onSaved: (v) {
                  this.email = v;
                },
                decoration: InputDecoration(
                    border: OutlineInputBorder(
                        borderRadius: BorderRadius.circular(20)),
                    labelText: 'Email'),
              ),
              SizedBox(
                height: 20,
              ),
              //String validator
              TextFormField(
                onTap: () async {
                  DateTime taskDate = await showDatePicker(
                      context: context,
                      initialDate: DateTime.now(),
                      firstDate: DateTime.now(),
                      lastDate: DateTime(2025));
                  this.controller.text =
                      '${taskDate.year}-${taskDate.month}-${taskDate.day}';
                },
                controller: this.controller,
                validator: (value) {
                  if (value.length == 0 || value == null) {
                    return '* Required field';
                  } else if (!value.contains('-')) {
                    return 'icvorrect date';
                  }
                },
                onSaved: (v) {
                  this.date = v;
                },
                decoration: InputDecoration(
                    border: OutlineInputBorder(
                        borderRadius: BorderRadius.circular(20)),
                    labelText: 'time'),
              ),
              CheckboxListTile(
                  title: Text('Is Completed'),
                  value: isCompleted,
                  onChanged: (v) {
                    this.isCompleted = v;
                    setState(() {});
                  }),
              ElevatedButton(
                  onPressed: () {
                    // controller.text = 'ahmed';
                    saveForm();
                  },
                  child: Text('Save'))
            ],
          ),
        ),
      ),
    );
  }
}
