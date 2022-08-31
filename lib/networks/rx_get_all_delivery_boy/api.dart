import 'dart:convert';

import '../../helpers/dio/dio.dart';
import '../endpoints.dart';

class GetDeliveyBoyApi {
  Future<Map> fetchDeliveyBoyList() async {
    final response = await getHttp(
      Endpoints.getDeliveryBoyList(),
    );

    if (response.statusCode == 200) {
      Map data = json.decode(json.encode(response.data));
      return data;
    }
    Map empty = {};
    return empty;
  }
}
