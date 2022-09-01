import 'package:rxdart/rxdart.dart';

import 'api.dart';

class GetSalesReportRX {
  final api = GetSalesReportApi();
  late Map empty;
  final BehaviorSubject _dataFetcher = BehaviorSubject<Map>();

  ValueStream get getSalesReport => _dataFetcher.stream;

  Future<void> fetcSalesReportData() async {
    try {
      Map faqData = await api.fetchSalesReportData();
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
