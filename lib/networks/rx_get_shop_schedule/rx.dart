import 'package:rxdart/rxdart.dart';

import 'api.dart';

class GetShopHolidaysListApiRX {
  final api = GetShopHolidaysListApi();
  Map empty = {};
  final BehaviorSubject _dataFetcher = BehaviorSubject<Map>();

  ValueStream get getShopHolidayResData => _dataFetcher.stream;

  Future<void> getShopHolidayListData() async {
    try {
      Map data = await api.getShopHolidaysList();
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
