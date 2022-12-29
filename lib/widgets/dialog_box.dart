import 'package:flutter/material.dart';
import '../widgets/mybuttons.dart';

class DialogBox extends StatelessWidget {
  final controls;
  VoidCallback onSaved;
  VoidCallback onCancel;
  DialogBox(
      {required this.controls, required this.onSaved, required this.onCancel});

  @override
  Widget build(BuildContext context) {
    return AlertDialog(
      backgroundColor: const Color(0xffF0EBCE),
      content: Container(
        height: 120,
        child: Column(
          mainAxisAlignment: MainAxisAlignment.spaceEvenly,
          children: [
            TextField(
              controller: controls,
              decoration: InputDecoration(hintText: 'Enter your task!'),
            ),
            Row(
              mainAxisAlignment: MainAxisAlignment.end,
              children: [
                Mybuttons(text: 'Save', onPressed: onSaved),
                const SizedBox(
                  width: 10,
                ),
                Mybuttons(text: 'Cancel', onPressed: onCancel),
              ],
            ),
          ],
        ),
      ),
    );
  }
}
