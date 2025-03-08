import 'package:flutter/material.dart';
import 'package:languagemaker/ui/theme/theme.dart';

class Bigbutton extends StatelessWidget {
  //const Bigbutton({super.key});

  const Bigbutton(this.title, this.onpressed, {super.key});
  final String title;
  final Function onpressed;

  @override
  Widget build(BuildContext context) {
    return Column(
      children: [
        OutlinedButton(
          onPressed: () {
            onpressed();
          },
          style: ButtonStyle(
              backgroundColor:
                  WidgetStateProperty.all<Color>(theme.colorScheme.onSecondary)),
          child: SizedBox(
            width: 350,
            height: 30,
            child: Center(
              child: Text(
                title,
                style: TextStyle(color: theme.colorScheme.onPrimaryContainer),
              ),
            ),
          ),
        ),
        Divider(height: 5,)
      ],
    );
  }
}
