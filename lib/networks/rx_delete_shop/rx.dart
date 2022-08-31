import 'package:rxdart/rxdart.dart';

import 'api.dart';

class DeleteShopRX {
  final api = DeleteShopApi();
  Map empty = {};
  final BehaviorSubject _dataFetcher = BehaviorSubject<Map>();

  ValueStream get getDeleteShopResdata => _dataFetcher.stream;

  Future<void> deleteShopData() async {
    try {
      Map data = await api.deleteShop();
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
