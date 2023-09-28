

import 'package:flutter_bloc/flutter_bloc.dart';
import 'package:shopping_list_app/cart/repositories/cart_repository.dart';
import 'package:shopping_list_app/cart/viewmodel/cart_events.dart';
import 'package:shopping_list_app/cart/viewmodel/cart_state.dart';

class CartBlock extends Bloc<CartEvent, CartState> {
  final CartRepository _cartRepository = CartRepository();

  CartBlock() : super(CartInitialState()) {
    on<LoadCartEvent>((event, emit) async =>
        emit(CartSuccessState(cart: await _cartRepository.loadCart())));

    on<AddCartEvent>((event, emit) async => emit(CartSuccessState(
        cart: await _cartRepository.addProduct(event.product))));

    on<RemoveCartEvent>((event, emit) async => emit(CartSuccessState(
        cart: await _cartRepository.removeProduct(event.product))));
  }
}
