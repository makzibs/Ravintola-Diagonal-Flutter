import 'package:flutter/material.dart';
import 'Task.dart';

class TaskTile extends StatelessWidget {

final String taskName;
final bool isChecked;
final Function onToggle;
final Function deleteTask;


TaskTile({
  super.key, required this.taskName, required this.isChecked, required this.onToggle, required this.deleteTask
});

  @override
  Widget build(BuildContext context) {
    return Padding(
      padding: const EdgeInsets.all(8.0),
      child: ListTile(
        leading: InkWell(
          onTap: () => deleteTask(),
            child: Icon(
              Icons.delete, color: Colors.red.shade400,
            )
        ),
        tileColor: Colors.green,

        title: isChecked? Text(taskName, style: TextStyle(decoration: TextDecoration.lineThrough) ,) : Text(taskName),

        trailing: TaskCheckBox(checkboxstate: isChecked, callback: onToggle),
      ),
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