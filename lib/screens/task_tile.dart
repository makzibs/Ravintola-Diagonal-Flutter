import 'package:flutter/material.dart';
import 'Task.dart';

class TaskTile extends StatelessWidget {

final String taskName;
final bool isChecked;
final Function onToggle;


TaskTile({
  super.key, required this.taskName, required this.isChecked, required this.onToggle
});

  @override
  Widget build(BuildContext context) {
    return ListTile(
      title: Text(taskName),
      trailing: TaskCheckBox(checkboxstate: isChecked, callback: onToggle),
    );
  }


}

class TaskCheckBox extends StatelessWidget {
  final bool checkboxstate;
  final Function callback;

  TaskCheckBox({
    super.key, required this.checkboxstate, required this.callback
  });



  @override
  Widget build(BuildContext context) {
    return Checkbox(value: checkboxstate, onChanged: (bool? value) {
      callback();
    },);
  }
}