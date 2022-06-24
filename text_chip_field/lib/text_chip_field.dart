// ignore_for_file: must_be_immutable
// Copyright 2014 The Flutter Authors. All rights reserved.
// Use of this source code is governed by a BSD-style license that can be
// found in the LICENSE file.
library text_chip_field;

import 'package:flutter/cupertino.dart';
import 'package:flutter/material.dart';

/// A Calculator.
class TextChipField extends StatefulWidget {
  static String platformVersion = "1.0.0";
  final String initialString;
  //Chip
  final String? seprator;
  final IconData deleteIcon;
  //TextFormField
  final InputDecoration? decoration;
  final TextStyle? style;
  void Function(String s) onChanged = (String f) {};
  final String? Function(String?)? validator;
  //Wrap
  final double runSpacing;
  final double spacing;
  final EdgeInsets chipsPadding;

  final chipColor;

  TextChipField({
    Key? key,
    this.initialString = "",
    required this.seprator,
    this.deleteIcon = CupertinoIcons.clear_thick_circled,
    required this.onChanged,
    this.decoration = const InputDecoration(),
    this.style,
    this.runSpacing = 2,
    this.spacing = 0,
    this.chipsPadding = EdgeInsets.zero,
    this.validator,
    this.chipColor,
  }) : super(key: key);

  @override
  State<TextChipField> createState() => _TextChipFieldState();
}

class _TextChipFieldState extends State<TextChipField> {
  final TextEditingController _textEditingController = TextEditingController();

  @override
  void initState() {
    super.initState();
    _textEditingController.text = widget.initialString;
  }

  @override
  Widget build(BuildContext context) {
    return Wrap(
      children: [
        TextFormField(
          enabled: true,
          validator: widget.validator,
          decoration: widget.decoration,
          style: widget.style,
          controller: _textEditingController,
          onChanged: (val) {
            setState(() {});
            print("! " + _textEditingController.text + " !");
            widget.onChanged(val);
          },
        ),
        const SizedBox(height: 8),
        Padding(
          padding: widget.chipsPadding,
          child: Wrap(
            spacing: widget.spacing,
            runSpacing: widget.runSpacing,
            children:
                _textEditingController.text.split(widget.seprator!).map((e) {
              return e.isNotEmpty
                  ? Chip(
                      label: Text(e),
                      backgroundColor: widget.chipColor,
                      deleteIcon: Icon(widget.deleteIcon),
                      onDeleted: () {
                        setState(() {
                          _textEditingController.text =
                              _textEditingController.text.replaceAll(e, "");
                          _textEditingController.selection =
                              TextSelection.fromPosition(TextPosition(
                                  offset: _textEditingController.text.length));
                        });
                        widget.onChanged(_textEditingController.text);
                      },
                    )
                  : const SizedBox.shrink();
            }).toList(),
          ),
        ),
      ],
    );
  }
}
