import 'package:shopping_list_app/product._model.dart';

abstract class ProductEvent {}

class LoadProductEvent extends ProductEvent {}

class AddProductEvent extends ProductEvent {
  ProductModel product;

  AddProductEvent({required this.product});
}

class RemoveProductEvent extends ProductEvent {
  ProductModel product;

  RemoveProductEvent({required this.product});
}
