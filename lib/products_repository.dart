import 'package:shopping_list_app/product._model.dart';

class ProductsRepository {
  final List<ProductModel> _products = [];

  Future<List<ProductModel>> loadProducts() async {
    _products.addAll([
      ProductModel(name: 'item 1'),
      ProductModel(name: 'item 2'),
      ProductModel(name: 'item 3'),
    ]);

    // await Future.delayed(const Duration(seconds: 2));

    return _products;
  }

  Future<List<ProductModel>> addProduct(ProductModel product) async {
    _products.add(product);
    return _products;
  }

  Future<List<ProductModel>> removeProduct(ProductModel product) async {
    _products.remove(product);

    return _products;
  }
}
