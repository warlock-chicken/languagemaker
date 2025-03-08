import 'package:flutter/material.dart';
// import 'package:languagemaker/ui/widgets/checkbox.dart';

class ipacheckbox extends StatefulWidget {
  final String sound;
  final bool initused;
  final Function onchecked;
  const ipacheckbox(this.sound, this.initused,this.onchecked, {super.key});

  @override
  State<ipacheckbox> createState() => _ipacheckboxState();
}

class _ipacheckboxState extends State<ipacheckbox> {
  late bool used = widget.initused;

  @override
  Widget build(BuildContext context) {
    return SizedBox(
      child: Row(
        children: [
          Text(widget.sound),
          Checkbox(
              value: used,
              onChanged: (value) {
                setState(() {
                  used=value!;
                });
                widget.onchecked(value);
              })
        ],
      ),
    );
  }
}
