import 'dart:convert';

import 'package:flutter/foundation.dart';
import 'package:get_storage/get_storage.dart';

import '../../constants/app_constants.dart';
import '../../helpers/dio/dio.dart';
import '../endpoints.dart';

class GetBalanceRecApi {
  Future<Map> fetchBalanceRecData({int? record, int? page}) async {
    final storage = GetStorage();
    String userID = storage.read(kKeyUserID);
    final response = await postHttp(
      Endpoints.getBalanceRecord(userID, record: record ?? 10, page: page ?? 1),
    );

    if (response.statusCode == 200) {
      Map data = json.decode(json.encode(response.data));
      return data;
    }
    if (kDebugMode) {
      print(response.toString);
    }
    Map empty = {};
    return empty;
  }
}
