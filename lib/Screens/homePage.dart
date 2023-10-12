import 'package:flutter/material.dart';
import 'package:todoapp/utilities/deleteCheckBox.dart';
import 'package:todoapp/utilities/dialogBox.dart';

import '../utilities/todolist.dart';

class HomePage extends StatefulWidget {
  const HomePage({super.key});

  @override
  State<StatefulWidget> createState() => _HomePageState();
}

class _HomePageState extends State<HomePage> {
  //text controller
  final _controller = TextEditingController();
  final bool anyTaskOnBoard = false;

  //Save new task button
  void saveNewTask() {
    setState(() {
      toDoList.add([_controller.text, false]);
      _controller.clear();
    });
    Navigator.of(context).pop();
  }

  //the list of to do
  List toDoList = [
    ["Make this app", false],
    ["Finish it", false]
  ];

  //check box
  void checkBoxChanged(bool? value, int index) {
    setState(() {
      toDoList[index][1] = !toDoList[index][1];
    });
  }

  //Create a new task
  void createNewTasks() {
    showDialog(
        context: context,
        builder: ((context) {
          return DialogBox(
            onSave: saveNewTask,
            onCancel: () => Navigator.of(context).pop,
            controller: _controller,
          );
        }));
  }

  //Delete the task dialog
  void deleteTask(int index) {
    showDialog(
      context: context,
      builder: (context) {
        return DeleteDialogBox(
          onDelete: () => deleteButton(index),
          onCancel: () => Navigator.of(context).pop(),
        );
      },
    );
  }

  //Delete function
  void deleteButton(int index) {
    setState(() {
      toDoList.removeAt(index);
    });
    Navigator.of(context).pop();
  }

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      backgroundColor: Color.fromARGB(255, 83, 72, 72),
      appBar: AppBar(
        shape: RoundedRectangleBorder(
            borderRadius: BorderRadius.only(
                bottomLeft: Radius.circular(20),
                bottomRight: Radius.circular(20))),
        backgroundColor: Color.fromARGB(255, 49, 49, 49),
        leading: Icon(Icons.blur_on_rounded),
        title: Text("My To Do"),
        centerTitle: true,
        actions: [
          Icon(Icons.blur_on_rounded),
        ],
      ),
      floatingActionButton: FloatingActionButton(
          onPressed: createNewTasks,
          backgroundColor: Color.fromARGB(255, 209, 204, 198),
          child: Icon(
            Icons.add,
            color: Colors.black,
            size: 25,
          )),
      body: ListView.builder(
        itemCount: toDoList.length,
        itemBuilder: (context, index) {
          return ToDoList(
              taskName: toDoList[index][0],
              taskCompleted: toDoList[index][1],
              onChanged: (value) {
                checkBoxChanged(value, index);
              },
              deleteTask: (context) => deleteTask(index));
        },
      ),
    );
  }
}
