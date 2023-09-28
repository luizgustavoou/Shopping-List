import 'package:shopping_list_app/product._model.dart';

abstract class ProductState {
  List<ProductModel> products;

  ProductState({required this.products});
}

class ProductInitialState extends ProductState {
  ProductInitialState() : super(products: []);
}

class ProductSuccessState extends ProductState {
  ProductSuccessState({required List<ProductModel> products})
      : super(products: products);


}

// Deveria criar um ProductErrorState.