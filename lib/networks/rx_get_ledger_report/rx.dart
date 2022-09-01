import 'package:rxdart/rxdart.dart';
import 'api.dart';

class GetLedgerReportRx {
  final api = GetLedgerReportApi();
  late Map empty;
  final BehaviorSubject _dataFetcher = BehaviorSubject<Map>();

  ValueStream get getLedgerReportData => _dataFetcher.stream;

  Future<void> fetchLedgerReportData(dynamic vDate, dynamic dCNo) async {
    try {
      Map data = await api.fetchLedgerReport(vDate, dCNo);
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
