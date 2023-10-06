import 'package:flutter/material.dart';

class ToDoList extends StatelessWidget {
  final String taskName;
  final bool taskCompleted;
  Function(bool?)? onChanged;

  ToDoList(
      {super.key,
      required this.taskName,
      required this.taskCompleted,
      required this.onChanged});

  @override
  Widget build(BuildContext context) {
    return Padding(
      padding: const EdgeInsets.all(20.0),
      child: Container(
        padding: EdgeInsets.all(12),
        child: Row(
          children: [
            //Check box
            Checkbox(value: value, onChanged: onChanged),
            //Task name
            Text("Make the app",
                style: TextStyle(
                  fontSize: 18,
                  fontStyle: FontStyle.italic,
                )),
          ],
        ),
        decoration: BoxDecoration(
            color: Color.fromARGB(255, 235, 159, 54),
            borderRadius: BorderRadius.circular(12)),
      ),
    );
  }
}
