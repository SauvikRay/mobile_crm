import 'dart:convert';
import 'dart:developer';

import 'package:dio/dio.dart';
import 'package:get_storage/get_storage.dart';

import '../../constants/app_constants.dart';
import '../../helpers/dio/dio.dart';
import '../endpoints.dart';

class GetLedgerReportApi {
  final storage = GetStorage();
  Future<Map> fetchLedgerReport(
    dynamic vDate,
    dynamic dCNo,
  ) async {
    String token = storage.read(kKeyAccessToken);
    String dpCode = storage.read(kKeydpCode);
    FormData formData = FormData.fromMap({
      "token": token,
      "DpCode": dpCode,
      "VDate": vDate,
      "DCNo": dCNo,
    });
    final response = await postHttp(Endpoints.getLedgerReport(), formData);

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
