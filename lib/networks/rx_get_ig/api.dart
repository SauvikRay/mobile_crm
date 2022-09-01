import 'dart:convert';

import 'package:dio/dio.dart';
import 'package:flutter/foundation.dart';
import 'package:get_storage/get_storage.dart';

import '../../constants/app_constants.dart';
import '../../helpers/dio/dio.dart';
import '../endpoints.dart';

class GetIgListApi {
  final storage = GetStorage();
  Future<Map> fetchIgData() async {
    String token = storage.read(kKeyToken);
    FormData formData = FormData.fromMap({
      "token": token,
    });
    final response = await postHttp(Endpoints.getIgList(), formData);

    if (response.statusCode == 200) {
      Map data = json.decode(response.data);
      return data;
    }
    if (kDebugMode) {
      print(response.toString);
    }
    Map empty = {};
    return empty;
  }
}
