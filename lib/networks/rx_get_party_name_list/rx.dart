import 'package:rxdart/rxdart.dart';

import 'api.dart';

class GetPartyNameListRx {
  final api = GetPartyNameListApi();
  late Map empty;
  final BehaviorSubject _dataFetcher = BehaviorSubject<Map>();
  ValueStream get getPartyNameListData => _dataFetcher.stream;

  Future<void> fetchPartyNameListData(dynamic listNo, dynamic mOPName) async {
    try {
      Map data = await api.fetchPartyNameList(listNo, mOPName);
      _dataFetcher.sink.add(data);
    } catch (e) {
      // print(e);
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
