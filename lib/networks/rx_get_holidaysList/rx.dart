import 'package:rxdart/rxdart.dart';
import '/networks/rx_get_holidaysList/api.dart';

class GetShopHolidaysRX {
  final api = GetShopHolidaysApi();
  Map empty = {};
  final BehaviorSubject _dataFetcher = BehaviorSubject<Map>();

  ValueStream get getShopHolidaysData => _dataFetcher.stream;

  Future<void> fetchShopHolidaysData({int? record, int? page}) async {
    try {
      Map data = await api.getShopHolidaysData(record: record, page: page);
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
