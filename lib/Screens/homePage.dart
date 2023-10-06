import 'package:flutter/material.dart';

import '../utilities/todolist.dart';

class HomePage extends StatefulWidget {
  const HomePage({super.key});

  @override
  State<StatefulWidget> createState() => _HomePageState();
}

class _HomePageState extends State<HomePage> {
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
      body: ListView(
        children: [
          ToDoList(),
        ],
      ),
    );
  }
}
