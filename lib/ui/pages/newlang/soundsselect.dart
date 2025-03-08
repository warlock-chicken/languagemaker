import 'package:flutter/material.dart';
//import 'package:languagemaker/ui/widgets/checkbox.dart';
import 'package:languagemaker/ui/widgets/checkboxcard.dart';
import 'package:languagemaker/ui/widgets/questionbutton.dart';

class soundsselect extends StatefulWidget {
  //const soundsselect({super.key});
  final String langname;
  // List<String> get currentconsonants {
  //   List<String> a = [];
  //   for (final s in ipaconsonants) {
  //     a.add(s);
  //   }
  //   return a;
  // }

  // List<String> get currentvowels {
  //   List<String> a = [];
  //   for (final s in ipavowels) {
  //     a.add(s);
  //   }
  //   return a;
  // }
  const soundsselect(this.langname, {super.key});

  @override
  State<soundsselect> createState() => _soundsselectState();
}

class _soundsselectState extends State<soundsselect> {
  Widget makesoundselect(BuildContext context, bool enabled) {
    if (enabled) {
      return Column(
        children: [
          Text(
              'huzzah, thou hast picking a custom inventory $currentconsonants'),
          SizedBox(
              height: 400,
              child: ListView.builder(
                  itemCount: ipaconsonants.length,
                  itemBuilder: (context, index) {
                    return ipacheckbox(ipaconsonants[index],
                        currentconsonants.contains(ipaconsonants[index]), (newval) {
                      print('$newval');
                      setState(() {
                        if (newval) {
                          if (!currentconsonants
                              .contains(ipaconsonants[index])) {
                            currentconsonants.add(ipaconsonants[index]);
                          }
                        } else {
                          // if (currentconsonants
                          //     .contains(ipaconsonants[index])) {
                          currentconsonants.remove(ipaconsonants[index]);
                          // }
                        }
                      });
                    });
                  }))
        ],
      );
    } else {
      return Text('Thou hast chose a preset. unforunetly not implemented yet');
    }
  }

  List<String> currentconsonants = [];
  List<String> currentvowels = [];

  bool custom = false;
  // List<String> get currentconsonants {
  //   List<String> a = [];
  //   for (final s in ipaconsonants) {
  //     a.add(s);
  //   }
  //   return a;
  // }

  // List<String> get currentvowels {
  //   List<String> a = [];
  //   for (final s in ipavowels) {
  //     a.add(s);
  //   }
  //   return a;
  // }
//////////////////////////////////////////////////////????????????????????
  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(
        title: Text('Select sounds inventory'),
      ),
      body: Padding(
        padding: const EdgeInsets.all(8.0),
        child: Column(
          children: [
            Row(
              children: [
                Text('Select sounds that will be in ${widget.langname}'),
                Questionbutton("todo ")
              ],
            ),
            Row(
              children: [
                Text('From existing language'),
                Checkbox(
                    onChanged: (newval) {
                      setState(() {
                        custom = !newval!;
                      });
                    },
                    value: !custom),
              ],
            ),
            Row(
              children: [
                Text('Custom'),
                Checkbox(
                    onChanged: (newval) {
                      setState(() {
                        custom = newval!;
                      });
                    },
                    value: custom),
              ],
            ),
            //inventoryselect(custom)
            makesoundselect(context, custom)
          ],
        ),
      ),
    );
  }
}

const List<String> ipaconsonants = [
  'm̥',
  'm',
  'ɱ̊',
  'ɱ',
  'n̼',
  'n̥',
  'n',
  'ɳ̊',
  'ɳ',
  'ɲ̊',
  'ɲ',
  'ŋ̊',
  'ŋ',
  'ɴ̥',
  'ɴ',
  'p',
  'b',
  'p̪',
  'b̪',
  't̼',
  'd̼',
  't̪',
  'd̪',
  't',
  'd',
  'ʈ',
  'ɖ',
  'c',
  'ɟ',
  'k',
  'ɡ',
  'q',
  'ɢ',
  'ʡ',
  'ʔ',
  't̪s̪',
  'd̪z̪',
  'ts',
  'dz',
  't̠ʃ',
  'd̠ʒ',
  'tʂ',
  'dʐ',
  'tɕ',
  'dʑ',
  'pɸ',
  'bβ',
  'p̪f',
  'b̪v',
  't̪θ',
  'd̪ð',
  'tɹ̝̊',
  'dɹ̝',
  't̠ɹ̠̊˔',
  'd̠ɹ̠˔',
  'cç',
  'ɟʝ',
  'kx',
  'ɡɣ',
  'qχ',
  'ɢʁ',
  'ʡʜ',
  'ʡʢ',
  'ʔh',
  's',
  'z',
  'ʃ',
  'ʒ',
  'ʂ',
  'ʐ',
  'ɕ',
  'ʑ',
  'ɸ',
  'β',
  'f',
  'v',
  'θ̼',
  'ð̼',
  'θ',
  'ð',
  'θ̠',
  'ð̠',
  'ɹ̠̊˔',
  'ɹ̠˔',
  'ɻ̊˔',
  'ɻ˔',
  'ç',
  'ʝ',
  'x',
  'ɣ',
  'χ',
  'ʁ',
  'ħ',
  'ʕ',
  'h',
  'ɦ',
  'β̞',
  'ʋ',
  'ð̞',
  'ɹ',
  'ɹ̠',
  'ɻ',
  'j',
  'ɰ',
  'ʁ̞',
  'ʔ̞',
  'ⱱ̟',
  'ⱱ',
  'ɾ̼',
  'ɾ̥',
  'ɾ',
  'ɽ̊',
  'ɽ',
  'ɢ̆',
  'ʡ̆',
  'ʙ̥',
  'ʙ',
  'r̥',
  'r',
  'r̠',
  'ɽ̊r̥',
  'ɽr',
  'ʀ̥',
  'ʀ',
  'ʜ',
  'ʢ',
  'tɬ',
  'dɮ',
  'tꞎ',
  'd𝼅',
  'c𝼆',
  'ɟʎ̝',
  'k𝼄',
  'ɡʟ̝',
  'ɬ',
  'ɮ',
  'ꞎ',
  '𝼅',
  '𝼆',
  'ʎ̝',
  '𝼄',
  'ʟ̝',
  'l̪',
  'l',
  'l̠',
  'ɭ',
  'ʎ',
  'ʟ',
  'ʟ̠',
  'ɺ̥',
  'ɺ',
  '𝼈̥',
  '𝼈',
  'ʎ̆',
  'ʟ̆'
];

const List<String> ipavowels = [
  'i',
  'y',
  'ɨ',
  'ʉ',
  'ɯ',
  'u',
  'ɪ',
  'ʏ',
  'ʊ',
  'e',
  'ø',
  'ɘ',
  'ɵ',
  'ɤ',
  'o',
  'e̞',
  'ø̞',
  'ə',
  'ɤ̞',
  'o̞',
  'ɛ',
  'œ',
  'ɜ',
  'ɞ',
  'ʌ',
  'ɔ',
  'æ',
  'ɐ',
  'a',
  'ɶ',
  'ä',
  'ɑ',
  'ɒ'
];
