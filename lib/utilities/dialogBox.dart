import 'package:flutter/material.dart';
import 'package:todoapp/utilities/myButtons.dart';

class DialogBox extends StatelessWidget {
  final controller;
  VoidCallback onSave;
  VoidCallback onCancel;

  DialogBox({
    super.key,
    required this.controller,
    required this.onSave,
    required this.onCancel,
  });

  @override
  Widget build(BuildContext context) {
    return AlertDialog(
      backgroundColor: Colors.orangeAccent,
      content: Container(
        height: 120,
        child: Column(
          mainAxisAlignment: MainAxisAlignment.spaceEvenly,
          children: [
            //Get the task
            TextField(
              controller: controller,
              decoration: InputDecoration(
                  hintText: "Add a New Task",
                  hintStyle: TextStyle(
                    fontStyle: FontStyle.italic,
                  ),
                  border: OutlineInputBorder(borderSide: BorderSide())),
            ),
            SizedBox(
              height: 12,
            ),

            Row(
              mainAxisAlignment: MainAxisAlignment.center,
              children: [
                //Save Button
                MyButtons(
                  name: "Save",
                  onpressed: onSave,
                  myColor: Color.fromARGB(255, 212, 111, 255),
                ),

                SizedBox(
                  width: 10,
                ),

                //Cancel Button
                MyButtons(
                  name: "Cancel",
                  onpressed: onCancel,
                  myColor: Color.fromARGB(255, 255, 21, 0),
                )
              ],
            ),
          ],
        ),
      ),
    );
  }
}
