import 'package:flutter/material.dart';
import 'package:go_router/go_router.dart';
import 'package:languagemaker/db/db.dart';
import 'package:languagemaker/ui/widgets/button.dart';

class MyHomePage extends StatefulWidget {
  const MyHomePage({
    super.key,
  });

  @override
  State<MyHomePage> createState() => _MyHomePageState();
}

class _MyHomePageState extends State<MyHomePage> {
  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(title: const Text('My languages'),actions: [IconButton(onPressed: (){context.go('/settings');}, icon: Icon(Icons.settings))],),
      body: Column(
        children: [
          Bigbutton('+ New language', () {
            context.go('/newlang');
          }),
          getlangs()
        ],
      ),
    );
  }
}

FutureBuilder getlangs() {
  return FutureBuilder(
    future: dobothtest(),
    builder: (context, snapshot) {
      if (!snapshot.hasData) {
        return CircularProgressIndicator();
      }
      if (snapshot.hasError) {
        return Text(snapshot.error.toString());
      }  if (snapshot.hasData) {
        List<Widget> children = [];
        for (final b in snapshot.data) {
          children.add(Bigbutton(b, (){
            context.go('/langpage/$b');
          }));
        }
        
        return Expanded(child: SingleChildScrollView(padding: EdgeInsets.all(15),child: Column(children: children),));
      } else {
        return Text('bug 💀💀🥲🥲');
      }
    },
  );
}
