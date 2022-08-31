

import 'package:rxdart/rxdart.dart';


import 'api.dart';

class GetCustomerRangeRX {
  final api = GetCustomerRangeApi();
  Map empty = {};
  final BehaviorSubject _dataFetcher = BehaviorSubject<Map>();

  ValueStream get getCustomerRangeResData => _dataFetcher.stream;

  Future<void> fetchCustomerRageData() async {
    try {
      Map data = await api.getCustomerRangeData();
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
