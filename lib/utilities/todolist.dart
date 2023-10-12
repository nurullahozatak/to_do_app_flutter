import 'package:flutter/material.dart';
import 'package:flutter_slidable/flutter_slidable.dart';

class ToDoList extends StatelessWidget {
  final String taskName;
  final bool taskCompleted;
  final Function(bool?)? onChanged;
  final Function(BuildContext)? deleteTask;

  ToDoList({
    super.key,
    required this.taskName,
    required this.taskCompleted,
    required this.onChanged,
    required this.deleteTask,
  });

  @override
  Widget build(BuildContext context) {
    return Padding(
      padding: const EdgeInsets.only(left: 20.0, right: 20.0, top: 20.0),
      child: Slidable(
        endActionPane: ActionPane(
          motion: StretchMotion(),
          children: [
            SlidableAction(
              onPressed: deleteTask,
              icon: Icons.delete,
              backgroundColor: Color.fromARGB(255, 4, 0, 212),
              label: "Delete",
            ),
          ],
        ),
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
              color: taskCompleted
                  ? Colors.red
                  : Color.fromARGB(255, 94, 224, 200),
              borderRadius: BorderRadius.circular(12)),
        ),
      ),
    );
  }
}
