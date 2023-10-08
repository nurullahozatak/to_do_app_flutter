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
      padding: const EdgeInsets.only(left: 20.0, right: 20.0, top: 20.0),
      child: Container(
        padding: EdgeInsets.all(12),
        child: Row(
          children: [
            //Check box
            Checkbox(
              value: taskCompleted,
              onChanged: onChanged,
              activeColor: Colors.red,
            ),
            //Task name
            Text(taskName,
                style: TextStyle(
                  fontSize: 18,
                  fontStyle: FontStyle.italic,
                  decoration: taskCompleted
                      ? TextDecoration.lineThrough
                      : TextDecoration.none,
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
