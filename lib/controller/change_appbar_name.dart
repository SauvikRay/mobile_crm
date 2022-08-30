import 'package:flutter/material.dart';
import 'package:mobile_crm/controller/appbar_name_provider.dart';
import 'package:provider/provider.dart';

appbarName(String appBartitle, String icon, BuildContext context) {
  AppbarNameProvider appbarNameProvider =
      Provider.of<AppbarNameProvider>(context, listen: false);
  // WidgetsBinding.instance.addPersistentFrameCallback((timeStamp) {
  //   appbarNameProvider.changeNameIcon(appBartitle, icon);
  // });
  appbarNameProvider.changeNameIcon(appBartitle, icon);
}
