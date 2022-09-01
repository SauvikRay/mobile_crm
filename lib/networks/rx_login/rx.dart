import 'dart:developer';

import 'package:flutter/material.dart';
import 'package:get_storage/get_storage.dart';
import 'package:rxdart/rxdart.dart';
import '../../helpers/navigation-services.dart';
import '../../widgets/loading_indicators.dart';
import '/helpers/all_routes.dart';

import '../../constants/app_constants.dart';
import '../../helpers/dio/dio.dart';

import 'api.dart';

class GetLoginRX {
  final api = LoginApi();
  Map empty = {};
  bool status = false;
  final BehaviorSubject _dataFetcher = BehaviorSubject<Map>();

  ValueStream get getFileData => _dataFetcher.stream;
  Future<void> login(
    String mobNumber,
    String acessPin,
    String macAddress,
  ) async {
    try {
      showDialog(
        context: NavigationService.context,
        builder: (context) => loadingIndicatorCircle(context: context),
      );
      Map data = await api.login(mobNumber, acessPin, macAddress);
      _dataFetcher.sink.add(data);
      final storage = GetStorage();
      status = data["status"];
      String logCode = data['data']['LogCode'];
      String logID = data['data']['LogID'];
      String mobileNo = data['data']['MobileNo'];
      String logType = data['data']['LogType'].toString();
      String dpCode = data['data']['DpCode'];
      String displayName = data['data']['DisplayName'];
      String accesstoken = data['data']['token'];

      storage.write(kKeyLogCode, logCode);
      storage.write(kKeyLoggedId, logID);
      storage.write(kKeyPhone, mobileNo);
      storage.write(kKeylogType, logType);
      storage.write(kKeydpCode, dpCode);
      storage.write(kKeyDisplayName, displayName);
      storage.write(kKeyToken, accesstoken);
      storage.write(kKeyIsLoggedIn, true);

      DioSingleton.instance.update(accesstoken);

      NavigationService.goBack;

      NavigationService.navigateToReplacement(Routes.homeNavigation);
    } catch (e) {
      log(e.toString());
      NavigationService.goBack;
      _dataFetcher.sink.addError(e);
    } finally {
      ScaffoldMessenger.of(NavigationService.context).showSnackBar(SnackBar(
        content: Text(status.toString()),
      ));
    }
  }

  void clean() {
    _dataFetcher.sink.add(empty);
  }

  void dispose() {
    _dataFetcher.close();
  }
}
