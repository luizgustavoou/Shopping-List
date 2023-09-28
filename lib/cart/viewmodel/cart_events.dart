import 'package:shopping_list_app/product._model.dart';

abstract class CartEvent {}

class LoadCartEvent extends CartEvent {}

class AddCartEvent extends CartEvent {
  ProductModel product;

  AddCartEvent({required this.product});
}

class RemoveCartEvent extends CartEvent {
  ProductModel product;

  RemoveCartEvent({required this.product});
}
