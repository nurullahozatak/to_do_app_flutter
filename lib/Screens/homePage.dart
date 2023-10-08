import 'package:flutter/material.dart';
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

  //Save new task button
  void saveNewTask() {
    setState(() {
      toDoList.add([_controller.text, false]);
    });
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
    Navigator.of(context).pop();
  }

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

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      backgroundColor: const Color.fromARGB(255, 49, 43, 43),
      appBar: AppBar(
        shape: RoundedRectangleBorder(
            borderRadius: BorderRadius.only(
                bottomLeft: Radius.circular(20),
                bottomRight: Radius.circular(20))),
        backgroundColor: Color.fromARGB(255, 203, 87, 15),
        leading: Icon(Icons.blur_on_rounded),
        title: Text("My To Do"),
        centerTitle: true,
        actions: [
          Icon(Icons.blur_on_rounded),
        ],
      ),
      floatingActionButton: FloatingActionButton(
          onPressed: createNewTasks,
          backgroundColor: Color.fromARGB(255, 235, 159, 54),
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
          );
        },
      ),
    );
  }
}
