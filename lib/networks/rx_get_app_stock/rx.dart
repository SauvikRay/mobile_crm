import 'package:get_storage/get_storage.dart';
import 'package:rxdart/rxdart.dart';

import '/constants/app_constants.dart';
import 'api.dart';

class GetAppStockRX {
  final api = GetAppStockApi();
  late Map empty;
  final BehaviorSubject _dataFetcher = BehaviorSubject<Map>();

  ValueStream get getAppStockData => _dataFetcher.stream;

  Future<void> fetchAppStockData(String groupName, String dateValue) async {
    try {
      Map data = await api.fetcAppStockData(groupName, dateValue);
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
