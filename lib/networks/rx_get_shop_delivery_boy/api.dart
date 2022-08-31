import 'dart:convert';

import '../../helpers/dio/dio.dart';
import '../endpoints.dart';

class GetShopDeliveyBoyApi {
  Future<Map> fetchShopDeliveyBoyList() async {
    final response = await getHttp(
      Endpoints.getShopDeliveryBoyList(),
    );

    if (response.statusCode == 200) {
      Map data = json.decode(json.encode(response.data));
      return data;
    }

    Map empty = {};
    return empty;
  }
}
