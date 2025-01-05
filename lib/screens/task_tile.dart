import 'package:flutter/material.dart';

class TaskTile extends StatefulWidget {
  @override
  State<TaskTile> createState() => _TaskTileState();
}

class _TaskTileState extends State<TaskTile> {
  bool isChecked = false;
  void toggleState() {
       setState(() {
         isChecked = !isChecked;
       });
  }

  @override
  Widget build(BuildContext context) {
    return ListTile(
      title: Text("This is a task"),
      trailing: TaskCheckBox(checkboxstate: isChecked, callback: toggleState),
    );
  }


}

class TaskCheckBox extends StatelessWidget {
  final checkboxstate;
  final callback;


  TaskCheckBox({this.checkboxstate, this.callback});



  @override
  Widget build(BuildContext context) {
    return Checkbox(value: checkboxstate, onChanged: (bool? value) {
           callback;
    },);
  }
}