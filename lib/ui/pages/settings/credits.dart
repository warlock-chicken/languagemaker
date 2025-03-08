import 'package:flutter/material.dart';
import 'package:languagemaker/ui/theme/linktexttheme.dart';
import 'package:url_launcher/url_launcher_string.dart';

class Credits extends StatelessWidget {
  const Credits({super.key});

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(title: Text('Credits'),),
      body: Column(children:[
        const Text('Credits:'),
        InkWell(
          child: Text('Font: Noto Sans',style: linktexttheme,),
          onTap: () => launchUrlString(
            "https://fonts.google.com/noto/specimen/Noto+Sans",
            mode: LaunchMode.externalApplication,
          ),
        ),
        InkWell(
          child: Text('Font licence',style: linktexttheme,),
          onTap: () => launchUrlString(
            "https://openfontlicense.org/open-font-license-official-text/",
            mode: LaunchMode.externalApplication,
          ),
        ),
      ],)
    );
  }
}
