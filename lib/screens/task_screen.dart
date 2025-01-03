import 'package:flutter/material.dart';
import 'package:ravintola_diagonal/screens/task_tile.dart';

class TaskScreen extends StatelessWidget {
  const TaskScreen({super.key});

  @override
  Widget build(BuildContext context) {
    return Container(
      child: ListView(
        children: [
          TaskTile(),
          TaskTile(),

        ],
      
      ),
    );
  }
}




