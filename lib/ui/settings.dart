import 'package:flutter/material.dart';
import 'package:go_router/go_router.dart';
import 'package:languagemaker/ui/widgets/button.dart';

class Settings extends StatelessWidget {
  const Settings({super.key});

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(
        title: Text('Settings'),
      ),
      body: Column(
        children: [

          Bigbutton('Credits', (){context.go('/settings/credits');})
          // Text(
          //     'Credits:\nFont: Noto Sans\nhttps://fonts.google.com/noto/specimen/Noto+Sans\nhttps://openfontlicense.org/open-font-license-official-text/')
        ],
      ),
    );
  }
}
