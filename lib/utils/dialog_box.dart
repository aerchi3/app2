import 'package:flutter/material.dart';

class DialogBox extends StatelessWidget {
  final String comment;
  const DialogBox({super.key, required this.comment});

  @override
  Widget build(BuildContext context) {
    return AlertDialog(
      backgroundColor: Colors.white,
      content: SizedBox(
        height: 160,
        child: Column(
          children: [
            const Text(
              'Comments:',
              style: TextStyle(fontSize: 20),
            ),
            Text(
              comment,
              style: const TextStyle(fontSize: 18),
            )
          ],
        ),
      ),
    );
  }
}
