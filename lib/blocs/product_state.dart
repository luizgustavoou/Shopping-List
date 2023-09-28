import 'package:shopping_list_app/shopping_list.dart';

abstract class ProductState {
  List<Product> products;

  ProductState({required this.products});
}

class ProductInitialState extends ProductState {
  ProductInitialState() : super(products: []);
}

class ProductSuccessState extends ProductState {
  ProductSuccessState({required List<Product> products})
      : super(products: products);


}

// Deveria criar um ProductErrorState.