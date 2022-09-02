import 'dart:convert';
import 'dart:developer';
import 'package:dio/dio.dart';
import 'package:get_storage/get_storage.dart';

import '../../constants/app_constants.dart';
import '../../helpers/dio/dio.dart';
import '../endpoints.dart';

class GetOutStandingReportApi {
  final storage = GetStorage();
  Future<Map> fetchOutStandingReportList(
      dynamic pCode, dynamic fDate, dynamic tDate) async {
    String token = storage.read(kKeyAccessToken);
    FormData formData = FormData.fromMap(
        {'token': token, 'Pcode': pCode, 'fdate': fDate, 'tdate': tDate});
    final response = await postHttp(Endpoints.getOutStandingReport(), formData);

    if (response.statusCode == 200) {
      Map data = json.decode(response.data);
      log(data.toString());
      return data;
    }

    Map empty = {};
    return empty;
  }
}
