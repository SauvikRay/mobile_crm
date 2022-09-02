import 'dart:convert';
import 'dart:developer';

import 'package:dio/dio.dart';
import 'package:get_storage/get_storage.dart';

import '../../constants/app_constants.dart';
import '../../helpers/dio/dio.dart';
import '../endpoints.dart';

class GetPartyNameListApi {
  final storage = GetStorage();

  Future<Map> fetchPartyNameList(dynamic listNo, dynamic mOPName) async {
    String token = storage.read(kKeyAccessToken);
    String dpCode = storage.read(kKeydpCode);
    FormData formData = FormData.fromMap({
      "token": token,
      "DpCode": dpCode,
      "ListNo": listNo,
      "MOPName": mOPName,
    });

    final response = await postHttp(Endpoints.getPartyNameList(), formData);

    if (response.statusCode == 200) {
      log(response.statusCode.toString());
      Map data = json.decode(response.data);
      log(data.toString());
      return data;
    }

    Map empty = {};
    return empty;
  }
}
