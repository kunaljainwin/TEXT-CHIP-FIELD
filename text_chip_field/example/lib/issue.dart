import 'package:flutter/material.dart';
import 'package:get/get.dart';
import 'package:get/get_state_manager/src/simple/get_controllers.dart';

class SearchFormController extends GetxController {
  List<String> purchaseNumbersList = [];
  String get purchaseNumbers =>
      purchaseNumbersList.join(); // because widget need string

  set purchaseNumbers(String str) {
    purchaseNumbersList = str.split(' ');
  }
}
