import 'package:rxdart/rxdart.dart';
import 'api.dart';

class GetDashBoardRX {
  final api = GetDashBoardApi();
  Map empty = {};
  final BehaviorSubject _dataFetcher = BehaviorSubject<Map>();

  ValueStream get getDashBoardData => _dataFetcher.stream;

  Future<void> fetchDashBoardData() async {
    try {
      Map dashBoardData = await api.fetchDashBoardData();
      _dataFetcher.sink.add(dashBoardData);
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
