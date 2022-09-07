import 'dart:convert';
import 'dart:developer';

import 'package:dio/dio.dart';
import 'package:flutter/foundation.dart';
import 'package:get_storage/get_storage.dart';

import '../../constants/app_constants.dart';
import '../../helpers/dio/dio.dart';
import '../endpoints.dart';

class GetDashBoardApi {
  final storage = GetStorage();
  Future<Map> fetchDashBoardData() async {
    String token = storage.read(kKeyAccessToken);
    String logCode = storage.read(kKeyLogCode);
    String logType = storage.read(kKeylogType);
    String dpCode = storage.read(kKeydpCode);

    FormData formData = FormData.fromMap({
      "token": token,
      "LogCode": logCode,
      "LogType": logType,
      'DpCode': dpCode,
    });

    final response = await postHttp(Endpoints.getDashBoard(), formData);

    if (response.statusCode == 200) {
      Map data = json.decode(response.data);
      log(data.toString());
      return data;
    }
    if (kDebugMode) {
      print(response.toString);
    }
    Map empty = {};
    return empty;
  }
}
