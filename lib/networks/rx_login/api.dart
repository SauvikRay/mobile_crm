import 'dart:convert';
import 'dart:developer';

import '/helpers/dio/dio.dart';
import '/networks/endpoints.dart';

class LoginApi {
  Future<Map> login(
      String mobNumber, String acessPin, String macAddress) async {
    Map data = {
      "MobileNo": mobNumber,
      "AcessPin": acessPin,
      "macAddress": macAddress,
    };

    final response = await postHttp(Endpoints.postlogin(), data);

    if (response.statusCode == 200) {
      log(response.statusCode.toString());
      Map data = json.decode(json.encode(response.data));

      return data;
    }

    log(response);

    Map empty = {};
    return empty;
  }
}
