import 'package:flutter/material.dart';
import 'package:ravintola_diagonal/screens/task_tile.dart';
import 'Task.dart';
class TaskScreen extends StatefulWidget {
  const TaskScreen({super.key});

  @override
  State<TaskScreen> createState() => _TaskScreenState();
}

class _TaskScreenState extends State<TaskScreen> {


 List<Task> tasksList = [
   Task(name: "This is a first task", isDone: false), Task(name: "This is a second task", isDone: true)
 ];
 TextEditingController textController = TextEditingController();

  void addTask(String taskName) {

    setState(() {
      tasksList.add(Task(name: taskName, isDone: true));
    });
    textController.clear();

  }
 void toggleTask(int index) {
     setState(() {
       tasksList[index].isDone = !tasksList[index].isDone;
     });
 }


  @override
  Widget build(BuildContext context) {
    return Scaffold(
      body: SafeArea(
        child: Column(
          children: [
            TextField(
              decoration: InputDecoration(
                hintText: 'Enter text here',
                border: OutlineInputBorder(
                  borderRadius: BorderRadius.circular(10.0),
                ),
                contentPadding: const EdgeInsets.symmetric(
                  vertical: 12.0,
                  horizontal: 16.0,
                ),

              ),
              controller: textController,

              onChanged: (value) {
                // Handle text changes here
                print('Current text: $value');
              },
            ),
            TextButton(

              onPressed: () {
                //print('Button pressed!');
                addTask(textController.text);
              },
              child: const Text('Add'),
            ),
            const SizedBox(height: 16),
            Expanded(
              child: ListView.builder(
                itemCount: tasksList.length,
                itemBuilder: (context, index) {
                  return  TaskTile(
                    taskName: tasksList[index].name,
                    isChecked: tasksList[index].isDone,
                    onToggle: () => toggleTask(index),
                  );
                }
              ),
            ),


          ],

        ),
      ),
    );
  }






}