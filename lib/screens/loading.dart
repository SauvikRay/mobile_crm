import 'package:flutter/material.dart';
import 'package:get_storage/get_storage.dart';
import 'package:mobile_crm/constants/app_constants.dart';
import 'package:mobile_crm/networks/api_acess.dart';
import 'package:mobile_crm/screens/dashboard_screen.dart';
import 'package:mobile_crm/screens/login_screen.dart';
import 'package:mobile_crm/screens/welcome_screen.dart';

import '../helpers/dio/dio.dart';
import '../home_navigation.dart';

class Loading extends StatefulWidget {
  Loading({Key? key}) : super(key: key);

  @override
  State<Loading> createState() => _LoadingState();
}

class _LoadingState extends State<Loading> {
  bool _isLoading = true;
  final appData = GetStorage();

  @override
  void initState() {
    // TODO: implement initState
    loadingInitialData();
    super.initState();
  }

  loadingInitialData() async {
    appData.writeIfNull(kKeyIsLoggedIn, false);

    if (appData.read(kKeyIsLoggedIn)) {
      String token = appData.read(kKeyAccessToken);
      DioSingleton.instance.update(token);

      await getSalesReportRXobj.fetcSalesReportData();
      await getDashBoardRXobj.fetchDashBoardData();
      getProductRXobj.fetchProductData();
    }
    setState(() {
      _isLoading = false;
    });
  }

  @override
  Widget build(BuildContext context) {
    if (_isLoading) {
      return const WelcomeScreen();
    } else {
      return appData.read(kKeyIsLoggedIn)
          ? const NavigationScreen()
          : const LogeinScreen();
    }
  }
}
