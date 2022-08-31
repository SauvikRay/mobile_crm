import 'dart:convert';

import '../../helpers/dio/dio.dart';
import '../endpoints.dart';

class GetOrderCountApi {
  Future<Map> fetchOrderCountData() async {
    final response = await getHttp(
      Endpoints.getOrderCount(),
    );

    if (response.statusCode == 200) {
      Map data = json.decode(json.encode(response.data));
      return data;
    }

    Map empty = {};
    return empty;
  }
}
