// ignore_for_file: public_member_api_docs, sort_constructors_first
import 'package:shopping_list_app/product._model.dart';

abstract class CartState {
  List<ProductModel> cart;
  CartState({
    required this.cart,
  });
}

class CartInitialState extends CartState {
  CartInitialState() : super(cart: []);
}

class CartSuccessState extends CartState {
  CartSuccessState({required List<ProductModel> cart}) : super(cart: cart);
}
