import 'package:rxdart/rxdart.dart';
import 'api.dart';

class GetIgRX {
  final api = GetIgListApi();
  late Map empty;
  final BehaviorSubject _dataFetcher = BehaviorSubject<Map>();

  ValueStream get getIgData => _dataFetcher.stream;

  Future<void> fetcIgDataData() async {
    try {
      Map faqData = await api.fetchIgData();
      _dataFetcher.sink.add(faqData);
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
