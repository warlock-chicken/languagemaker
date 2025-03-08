import 'package:flutter/material.dart';

class Questionbutton extends StatelessWidget {
  final String content;

  // const Questionbutton({super.key});
  const Questionbutton(this.content, {super.key});

  @override
  Widget build(BuildContext context) {
    return Expanded(
        child: Align(
      alignment: Alignment.bottomRight,
      child: IconButton(
        onPressed: () {
          showDialog(
              context: context,
              builder: (context) {
                return AlertDialog(
                  content: Text(content),
                );
              });
        },
        icon: Icon(Icons.question_mark_outlined),
        style: ButtonStyle(),
      ),
    ));
  }
}
