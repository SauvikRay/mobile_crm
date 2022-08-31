import 'package:rxdart/rxdart.dart';

import 'api.dart';

class ShowPostProductAddonRx {
  final api = ShowPostProductAddonApi();
  Map empty = {};
  final BehaviorSubject _dataFetcher = BehaviorSubject<Map>();
  ValueStream get getShowPostProductAddonData => _dataFetcher.stream;

  Future<void> fetchShowPostProductAddon(String foodId,
      {int? record, int? page}) async {
    try {
      Map data =
          await api.showPostProductaddon(foodId, record: record, page: page);
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
