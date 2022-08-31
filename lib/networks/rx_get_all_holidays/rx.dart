import 'package:rxdart/rxdart.dart';

import 'api.dart';

class GetAllShopHolidaysRX {
  final api = GetAllShopHolidaysApi();
  Map empty = {};
  final BehaviorSubject _dataFetcher = BehaviorSubject<Map>();

  ValueStream get getAllShopHolidaysData => _dataFetcher.stream;

  Future<void> fetchAllShopHolidaysData({int? record, int? page}) async {
    try {
      Map data = await api.getAllShopHolidaysData();
      _dataFetcher.sink.add(data);
    } catch (e) {
      _dataFetcher.sink.addError(e);
    }
  }

  void clean() {
    _dataFetcher.sink.add(empty);
  }

  void dispose() {
    _dataFetcher.close();
  }
}
