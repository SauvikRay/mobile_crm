import 'dart:convert';
import 'dart:developer';

import 'package:dio/dio.dart';
import 'package:flutter/foundation.dart';
import 'package:get_storage/get_storage.dart';

import '../../constants/app_constants.dart';
import '../../helpers/dio/dio.dart';
import '../endpoints.dart';

class GetAppStockApi {
  final storage = GetStorage();
  Future<Map> fetcAppStockData(String groupName, String dateValue) async {
    String token = storage.read(kKeyAccessToken);
    String dpCode = storage.read(kKeydpCode);

    FormData formData = FormData.fromMap({
      "token": token,
      "DpCode": dpCode,
      "GroupName": groupName,
      "DateValue": dateValue,
    });
    final response = await postHttp(Endpoints.getAppStock(), formData);

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
