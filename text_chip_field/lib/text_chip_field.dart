// ignore_for_file: must_be_immutable

library text_chip_field;

import 'package:flutter/cupertino.dart';
import 'package:flutter/material.dart';

/// A Calculator.
class TextChipField extends StatefulWidget {
  static String platformVersion = "1.0.0";
  List<String>? strings;
  final String? joinWith;
  final IconData deleteIcon;
  final onChanged;
  TextChipField(
      {Key? key,
      this.strings = const [""],
      this.joinWith = ",",
      this.deleteIcon = CupertinoIcons.clear_thick_circled,
      this.onChanged})
      : super(key: key);

  @override
  State<TextChipField> createState() => _TextChipFieldState();
}

class _TextChipFieldState extends State<TextChipField> {
  final TextEditingController _textEditingController = TextEditingController();
  @override
  Widget build(BuildContext context) {
    return Wrap(
      children: [
        TextFormField(
          controller: _textEditingController,
          onEditingComplete: () {
            setState(() {
              widget.strings = _textEditingController.text.split(",");
            });
          },
          onChanged: widget.onChanged,
        ),
        const SizedBox(height: 8),
        Wrap(
          runSpacing: 2,
          children: widget.strings!.map((e) {
            return Chip(
              label: Text(e.trim()),
              deleteIcon: Icon(widget.deleteIcon),
              onDeleted: () {
                setState(() {
                  widget.strings!.remove(e);
                  _textEditingController.text =
                      widget.strings!.join(widget.joinWith!);
                });
              },
            );
          }).toList(),
        ),
      ],
    );
  }
}
