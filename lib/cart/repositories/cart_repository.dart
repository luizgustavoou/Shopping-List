import 'package:shopping_list_app/product._model.dart';

class CartRepository {
  final List<ProductModel> _cart = [];

  Future<List<ProductModel>> loadCart() async {
    _cart.addAll([
      ProductModel(name: 'item 1'),
      ProductModel(name: 'item 2'),
      ProductModel(name: 'item 3'),
    ]);

    // await Future.delayed(const Duration(seconds: 2));

    return _cart;
  }

  Future<List<ProductModel>> addProduct(ProductModel product) async {
    _cart.add(product);
    return _cart;
  }

  Future<List<ProductModel>> removeProduct(ProductModel product) async {
    _cart.remove(product);

    return _cart;
  }
}
