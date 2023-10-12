import 'package:flutter/material.dart';
import 'package:todoapp/utilities/myButtons.dart';

class DialogBox extends StatelessWidget {
  final controller;
  final VoidCallback onSave;
  final VoidCallback onCancel;

  DialogBox({
    super.key,
    required this.controller,
    required this.onSave,
    required this.onCancel,
  });

  @override
  Widget build(BuildContext context) {
    return AlertDialog(
      backgroundColor: Color.fromARGB(255, 236, 216, 191),
      content: Container(
        decoration: BoxDecoration(
            borderRadius: BorderRadius.all(
          Radius.circular(12),
        )),
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
                //Cancel Button
                MyButtons(
                  name: "Cancel",
                  onpressed: onCancel,
                  myColor: Color.fromARGB(255, 255, 21, 0),
                ),

                SizedBox(
                  width: 10,
                ),

                //Save Button
                MyButtons(
                  name: "Save",
                  onpressed: onSave,
                  myColor: Color.fromARGB(255, 212, 111, 255),
                ),
              ],
            ),
          ],
        ),
      ),
    );
  }
}
