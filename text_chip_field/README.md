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

A Fluter package for taking text input and converting them to chips/tags .

## Features
![](https://github.com/kunaljainwin/Flutter/blob/master/ss_13May_2022_1746.jpg ="360x640")

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
  text_chip_field: ^0.0.3
```

Import it:
```import 'package:text_chip_field/text_chip_field.dart';```

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

<!-- ## Additional information

TODO: Tell users more about the package: where to find more information, how to 
contribute to the package, how to file issues, what response they can expect 
from the package authors, and more. -->
