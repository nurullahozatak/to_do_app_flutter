import 'package:flutter/material.dart';
import 'package:todoapp/utilities/myButtons.dart';

class DeleteDialogBox extends StatelessWidget {
  final VoidCallback onDelete;
  final VoidCallback onCancel;

  DeleteDialogBox({
    super.key,
    required this.onCancel,
    required this.onDelete,
  });

  @override
  Widget build(BuildContext context) {
    return AlertDialog(
      backgroundColor: const Color.fromARGB(255, 236, 216, 191),
      content: Container(
        child: Column(
          mainAxisAlignment: MainAxisAlignment.spaceEvenly,
          children: [
            Text("Are you sure you want to delete ?"),
            Row(
              mainAxisAlignment: MainAxisAlignment.center,
              children: [
                MyButtons(
                  name: "Cancel",
                  onpressed: onCancel,
                  myColor: Color.fromARGB(221, 0, 72, 255),
                ),
                SizedBox(
                  width: 25,
                ),
                MyButtons(
                  name: "Yes",
                  onpressed: onDelete,
                  myColor: Color.fromARGB(255, 255, 0, 0),
                ),
              ],
            )
          ],
        ),
        height: 120,
      ),
    );
  }
}
