import 'package:flutter/material.dart';

class Langpage extends StatelessWidget {
  final String langname;

  // const Langpage({super.key});

  const Langpage(this.langname, {super.key});

  @override
  Widget build(BuildContext context) {
    return Scaffold(appBar: AppBar(title: Text(langname),),body: Text('Language name: $langname'));
  }
}
