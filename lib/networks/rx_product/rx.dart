import 'package:mobile_crm/networks/rx_product/api.dart';
import 'package:rxdart/rxdart.dart';

class GetProductRX {
  final api = GetProductApi();
  Map empty = {};
  final BehaviorSubject _dataFetcher = BehaviorSubject<Map>();

  ValueStream get getProductyData => _dataFetcher.stream;

  Future<void> fetchProductData() async {
    try {
      Map productData = await api.getProducts();
      _dataFetcher.sink.add(productData);
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
