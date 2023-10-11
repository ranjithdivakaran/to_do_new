import 'package:flutter/material.dart';
import 'package:to_do/components/my_buttons.dart';

class AlertBox extends StatelessWidget {
  final controller;
  VoidCallback onsave;
  VoidCallback oncancel;

   AlertBox(
      {super.key,
      required this.controller,
      required this.onsave,
      required this.oncancel});

  @override
  Widget build(BuildContext context) {
    return AlertDialog(
      backgroundColor: Colors.yellow,
      content: Container(
        height: 150,
        child: Column(
          mainAxisAlignment: MainAxisAlignment.spaceEvenly,
          children: [
            TextField(
              controller: controller,
              decoration: InputDecoration(
                  hintText: "text", border: OutlineInputBorder()),
            ),
            Row(
              mainAxisAlignment: MainAxisAlignment.end,
              children: [
                MyButtons(text: "Save", onpressed: onsave),
                SizedBox(
                  width: 5,
                ),
                MyButtons(text: "Cancel", onpressed: oncancel),
              ],
            )
          ],
        ),
      ),
    );
  }
}
