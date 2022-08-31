import 'package:rxdart/rxdart.dart';

import 'api.dart';

class DeleteProductOptionPriceRx {
  final api = DeleteProductOptionPriceApi();
  Map empty = {};
  final BehaviorSubject _dataFetcher = BehaviorSubject<Map>();

  ValueStream get getProductOptionPriceResdata => _dataFetcher.stream;

  Future<void> deleteProductOptionPrice(String optionId) async {
    try {
      Map data = {
        "id": optionId,
      };
      Map resData = await api.deleteProductOptionPrice(data);
      _dataFetcher.sink.add(resData);
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
