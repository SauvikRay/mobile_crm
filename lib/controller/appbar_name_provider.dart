import 'package:flutter/material.dart';

class AppbarNameProvider extends ChangeNotifier {
  // String accountType = "Admin";
  String val = "";
  String iconName = '';

  String get appBarname => val;
  // String get account => accountType;
  String get assetIcon => iconName;

  changeNameIcon(String title, String icon) async {
    val = title;
    // accountType = type;

    iconName = icon;

    notifyListeners();
  }
}
