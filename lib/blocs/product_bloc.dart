import 'dart:async';

import 'package:shopping_list_app/blocs/product_events.dart';
import 'package:shopping_list_app/blocs/product_state.dart';
import 'package:shopping_list_app/product._model.dart';
import 'package:shopping_list_app/products_repository.dart';

import 'package:flutter_bloc/flutter_bloc.dart';

class ProductBloc extends Bloc<ProductEvent, ProductState> {
  final _productsRepository =
      ProductsRepository(); // iria carregar ele sando um provider

  // final StreamController<ProductEvent> _inputProductController =
  //     StreamController<ProductEvent>();

  // final StreamController<ProductState> _outputProductController =
  //     StreamController<ProductState>();

  // Sink<ProductEvent> get inputProduct => _inputProductController.sink;
  // Stream<ProductState> get stream => _outputProductController.stream;

  ProductBloc() : super(ProductInitialState()) {
    // _inputProductController.stream.listen(_mapEventToState);
    on<LoadProductEvent>((event, emit) => emit(
        ProductSuccessState(products:  _productsRepository.loadProducts())));

    on<AddProductEvent>((event, emit) => emit(ProductSuccessState(
        products: _productsRepository.addProduct(event.product))));

    on<RemoveProductEvent>((event, emit) => emit(ProductSuccessState(
        products: _productsRepository.removeProduct(event.product))));
  }

  // _mapEventToState(ProductEvent event) {
  //   // TODO: criar um ProductLoadingState, ProductErrorState

  //   List<ProductModel> products = [];

  //   if (event is LoadProductEvent) {
  //     products = _productsRepository.loadProducts();
  //   } else if (event is AddProductEvent) {
  //     products = _productsRepository.addProduct(event.product);
  //   } else if (event is RemoveProductEvent) {
  //     products = _productsRepository.removeProduct(event.product);
  //   }

  //   _outputProductController.add(ProductSuccessState(products: products));
  // }
}
