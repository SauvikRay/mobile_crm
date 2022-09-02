import 'package:rxdart/rxdart.dart';
import 'api.dart';

class GetOutStandingReportRX {
  final api = GetOutStandingReportApi();
  late Map empty;
  final BehaviorSubject _dataFetcher = BehaviorSubject<Map>();

  ValueStream get getOutStandingReportData => _dataFetcher.stream;

  Future<void> fetchOutStandingReportData(
      dynamic pCode, dynamic fDate, dynamic tDate) async {
    try {
      Map data = await api.fetchOutStandingReportList(pCode, fDate, tDate);
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
