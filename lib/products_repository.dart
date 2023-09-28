import 'package:shopping_list_app/product._model.dart';

class ProductsRepository {
  final List<ProductModel> _products = [];

  List<ProductModel> loadProducts() {
    _products.addAll([
      ProductModel(name: 'item 1'),
      ProductModel(name: 'item 2'),
      ProductModel(name: 'item 3'),
    ]);

    return _products;
  }

  List<ProductModel> addProduct(ProductModel product) {
    _products.add(product);
    return _products;
  }

  List<ProductModel> removeProduct(ProductModel product) {
    _products.remove(product);

    return _products;
  }
}
