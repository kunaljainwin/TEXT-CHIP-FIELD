import 'package:flutter/material.dart';
import 'dart:async';

import 'package:flutter/services.dart';
import 'package:get/get.dart';
import 'package:text_chip_field/text_chip_field.dart';
import 'package:text_chip_field_example/issue.dart';

void main() {
  runApp(const MyApp());
}

class MyApp extends StatefulWidget {
  const MyApp({Key? key}) : super(key: key);

  @override
  State<MyApp> createState() => _MyAppState();
}

class _MyAppState extends State<MyApp> {
  String _platformVersion = 'Unknown';

  @override
  void initState() {
    super.initState();
    // initPlatformState();
  }

  // Platform messages are asynchronous, so we initialize in an async method.
  // Future<void> initPlatformState() async {
  //   String platformVersion;
  //   // Platform messages may fail, so we use a try/catch PlatformException.
  //   // We also handle the message potentially returning null.
  //   try {
  //     platformVersion = TextChipField.platformVersion;
  //   } on PlatformException {
  //     platformVersion = 'Failed to get platform version.';
  //   }

  //   // If the widget was removed from the tree while the asynchronous platform
  //   // message was in flight, we want to discard the reply rather than calling
  //   // setState to update our non-existent appearance.
  //   if (!mounted) return;

  //   setState(() {
  //     _platformVersion = platformVersion;
  //   });
  // }

  @override
  Widget build(BuildContext context) {
    Get.put(SearchFormController());
    var ctrl = Get.find<SearchFormController>(); // GetX
    return GetMaterialApp(
      home: Scaffold(
          appBar: AppBar(
            centerTitle: true,
            title: const Text('Text Chip Field example app'),
          ),
          body: Padding(
            padding: const EdgeInsets.all(8.0),
            child: ListView(
              children: [
                TextChipField(
                  initialString: ctrl.purchaseNumbers,
                  seprator: " ",
                  decoration: InputDecoration(
                    hintText: "First Name",
                    border: OutlineInputBorder(
                      borderRadius: BorderRadius.circular(10),
                    ),
                  ),
                  onChanged: (val) {
                    ctrl.purchaseNumbers = val;
                    print('data: ${ctrl.purchaseNumbers}');
                  },
                ),
                SizedBox(
                  height: 18,
                ),
                TextChipField(
                  initialString: "Initial string",
                  seprator: " ",
                  decoration: InputDecoration(
                    border: OutlineInputBorder(
                      borderSide: BorderSide(color: Colors.green),
                      borderRadius: BorderRadius.circular(0),
                    ),
                  ),
                  onChanged: (val) {
                    print(val); //"changed string"
                  },
                ),
                SizedBox(
                  height: 18,
                ),
                TextChipField(
                  initialString: "Circular and colored border Initial string",
                  seprator: " ",
                  spacing: 4,
                  chipsPadding: EdgeInsets.all(10),
                  decoration: InputDecoration(
                    focusedBorder: OutlineInputBorder(
                      borderRadius: BorderRadius.circular(25.0),
                      borderSide: BorderSide(
                        color: Colors.blue,
                      ),
                    ),
                    enabledBorder: OutlineInputBorder(
                      borderRadius: BorderRadius.circular(25.0),
                      borderSide: BorderSide(
                        color: Colors.red,
                        width: 2.0,
                      ),
                    ),
                  ),
                  onChanged: (val) {
                    print(val); //"changed string"
                  },
                ),
                SizedBox(
                  height: 18,
                ),
                TextChipField(
                  initialString: "Chip padding",
                  seprator: " ",
                  spacing: 4,
                  chipsPadding: EdgeInsets.symmetric(horizontal: 50),
                  decoration: InputDecoration(
                    enabledBorder: OutlineInputBorder(
                      borderRadius: BorderRadius.circular(25.0),
                      borderSide: BorderSide(
                        color: Colors.green,
                        width: 2.0,
                      ),
                    ),
                  ),
                  onChanged: (val) {
                    print(val); //"changed string"
                  },
                ),
                SizedBox(
                  height: 18,
                ),
                TextChipField(
                  initialString: "Chip padding given to place chips",
                  seprator: " ",
                  spacing: 4,
                  runSpacing: 4,
                  deleteIcon: Icons.clear,
                  chipsPadding: EdgeInsets.all(10),
                  decoration: InputDecoration(
                    fillColor: Colors.cyan,
                    filled: true,
                  ),
                  onChanged: (val) {
                    print(val); //"changed string"
                  },
                ),
              ],
            ),
          )),
    );
  }
}
