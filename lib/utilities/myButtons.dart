import 'package:flutter/material.dart';

class MyButtons extends StatelessWidget {
  final String name;
  final Color myColor;
  final VoidCallback onpressed;

  MyButtons({
    super.key,
    required this.name,
    required this.onpressed,
    required this.myColor,
  });

  @override
  Widget build(BuildContext context) {
    return ElevatedButton(
      style: ElevatedButton.styleFrom(
        primary: myColor,
      ),
      onPressed: onpressed,
      child: Text(name),
    );
  }
}
