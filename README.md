# TEXT CHIP FIELD
A Fluter package for taking text input and converting them to chips/tags

<!--
This README describes the package. If you publish this package to pub.dev,
this README's contents appear on the landing page for your package.

For information about how to write a good package README, see the guide for
[writing package pages](https://dart.dev/guides/libraries/writing-package-pages).

For general information about developing packages, see the Dart guide for
[creating packages](https://dart.dev/guides/libraries/create-library-packages)
and the Flutter guide for
[developing packages and plugins](https://flutter.dev/developing-packages).
-->
##Flutter
A Fluter package for taking text input and converting them to chips/tags . [Kunal jain](https://www.linkedin.com/in/kunal-jain-32bbb418a)

Pub.dev [link](https://pub.dev/packages/text_chip_field)

## Features

![](https://github.com/kunaljainwin/Flutter/blob/master/ss_13May_2022_1746.jpg)

Beautiful Tags input field

## Getting started

With Dart:

```
dart pub add text_chip_field
```

With Flutter:

```
flutter pub add text_chip_field
```

Pubspec.yaml:

```
dependencies:
  text_chip_field: ^0.0.5
```

Import it:
`import 'package:text_chip_field/text_chip_field.dart';`

## Usage

Frontend

```dart
TextChipField(
              initialString: s,
              seprator: " ",
              decoration: InputDecoration(
                border: OutlineInputBorder(
                  borderRadius: BorderRadius.circular(30),
                ),
              ),
              onChanged: (val) {
                print(val); //"changed string"
              },
            ),
```
