import 'package:shopping_list_app/shopping_list.dart';

class ProductsRepository {
  final List<Product> _products = [];

  List<Product> loadProducts() {
    _products.addAll([
      Product(name: 'item 1'),
      Product(name: 'item 2'),
      Product(name: 'item 3'),
    ]);

    return _products;
  }

  List<Product> addProduct(Product product) {
    _products.add(product);
    return _products;
  }

  List<Product> removeProduct(Product product) {
    _products.remove(product);

    return _products;
  }
}
