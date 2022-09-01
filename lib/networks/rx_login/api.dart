import 'dart:convert';
import 'dart:developer';

import 'package:dio/dio.dart';

import '/helpers/dio/dio.dart';
import '/networks/endpoints.dart';

class LoginApi {
  Future<Map> login(
      String mobNumber, String acessPin, String macAddress) async {
    FormData formData = FormData.fromMap({
      "MobileNo": mobNumber,
      "AcessPin": acessPin,
      "macAddress": macAddress,
    });

    final response = await postHttp(Endpoints.postlogin(), formData);

    if (response.statusCode == 200) {
      Map data = json.decode(response.data);
      log(data.toString());
      return data;
    }

    log(response);

    Map empty = {};
    return empty;
  }
}
