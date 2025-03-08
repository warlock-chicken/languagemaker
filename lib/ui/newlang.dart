
import 'package:flutter/material.dart';
import 'package:go_router/go_router.dart';
import 'package:languagemaker/db/db.dart';
import 'package:languagemaker/ui/theme/theme.dart';

class newlang extends StatefulWidget {
  const newlang({super.key});

  @override
  State<newlang> createState() => _newlangState();
}

class _newlangState extends State<newlang> {
  String langname = '';
  //String notallowedcharsstring="#,%,&,{,},\\,<,>,*,?,/,\$,!,',\",:,@,+,`,|,=";
  List<String> notallowedchars = [
    '#',
    '%',
    '&',
    '{',
    '}',
    '\\',
    '<',
    '>',
    '*',
    '?',
    '/',
    '\$',
    '!',
    "'",
    '"',
    ':',
    '@',
    '+',
    '`',
    '|',
    '=',
    '.'
  ]; //formatter L
  final formkey = GlobalKey<FormState>();

  @override
  Widget build(BuildContext context) {
    return Scaffold(
        appBar: AppBar(title: Text('New language')),
        body: FutureBuilder(
          future: getlangsdb(),
          builder: (context, snapshot) {
            if (snapshot.hasData) {
              return Column(
                children: [
                  Padding(
                    padding: const EdgeInsets.all(8.0),
                    child: Form(
                      key: formkey,
                      child: TextFormField(
                        decoration: const InputDecoration(
                          border: UnderlineInputBorder(),
                          labelText: 'Enter new language name',
                        ),
                        onChanged: (newValue) =>
                            setState(() => langname = newValue),
                        //maxLength: 20,
                        validator: (value) {
                          if (value == null || value.isEmpty) {
                            return "Please enter new language name";
                          }
                          for (String ch in notallowedchars) {
                            if (value.contains(ch)) {
                              return "Cannot contain character '$ch' (sorry 😥)";
                            }
                          }
                          for (final lang in snapshot.data!){
                            if (lang==value){
                              return "Name already used for another language";
                            }
                          }
                          if (value.length>50){return "Please make it have less than 50 characters.";}
                          return null;
                        },
                      ),
                    ),
                  ),
                  Padding(
                    padding: const EdgeInsets.only(top: 10),
                    child:
                        Text('Coming soon tm: custom alphabet, custom grammer'),
                  ),
                  Padding(
                    padding: const EdgeInsets.all(10.0),
                    child: Align(
                      alignment: Alignment.bottomRight,
                      child: ElevatedButton(
                        onPressed: () {
                          final isvalid = formkey.currentState?.validate();
                          if (isvalid!) {
                            context.go('/newlang/soundsselect/$langname');
                          }
                        },
                        style: ButtonStyle(
                            backgroundColor: WidgetStateProperty.all<Color>(
                                theme.colorScheme.inversePrimary)),
                        child: Text('Next'),
                      ),
                    ),
                  )
                ],
              );
            }
            return CircularProgressIndicator();
          },
        ));
  }
}

//   @override
//   Widget build(BuildContext context) {
//     return Scaffold(
//       appBar: AppBar(title: Text('New language')),
//       body: Column(
//         children: [
//           Padding(
//             padding: const EdgeInsets.all(8.0),
//             child: Form(
//               key: formkey,
//               child: TextFormField(
//                 decoration: const InputDecoration(
//                   border: UnderlineInputBorder(),
//                   labelText: 'Enter new language name',
//                 ),
//                 onChanged: (newValue) => setState(() => langname = newValue),
//                 maxLength: 20,
//                 validator: (value) {
//                   if (value == null || value.isEmpty) {
//                     return "Please enter new language name";
//                   }
//                   for (String ch in notallowedchars) {
//                     if (value.contains(ch)) {
//                       return "Cannot contain character '$ch' (sorry 😥)";
//                     }
//                   }
//                   return null;
//                 },
//               ),
//             ),
//           ),
//           Padding(
//             padding: const EdgeInsets.only(top: 10),
//             child: Text('Coming soon tm: custom alphabet, custom grammer'),
//           ),
//           Padding(
//             padding: const EdgeInsets.all(10.0),
//             child: Align(
//               alignment: Alignment.bottomRight,
//               child: ElevatedButton(
//                 onPressed: () {
//                   final isvalid = formkey.currentState?.validate();
//                   if (isvalid!) {
//                     context.go('/newlang/soundsselect/langname');
//                   }
//                 },
//                 style: ButtonStyle(
//                     backgroundColor: WidgetStateProperty.all<Color>(
//                         theme.colorScheme.inversePrimary)),
//                 child: Text('Next'),
//               ),
//             ),
//           )
//         ],
//       ),
//     );
//   }
// }
