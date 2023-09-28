import 'dart:async';

import 'package:shopping_list_app/blocs/product_events.dart';
import 'package:shopping_list_app/blocs/product_state.dart';
import 'package:shopping_list_app/products_repository.dart';
import 'package:shopping_list_app/shopping_list.dart';

class ProductBloc {
  final _productsRepository =
      ProductsRepository(); // iria carregar ele sando um provider

  final StreamController<ProductEvent> _inputProductController =
      StreamController<ProductEvent>();

  final StreamController<ProductState> _outputProductController =
      StreamController<ProductState>();

  Sink<ProductEvent> get inputProduct => _inputProductController.sink;
  Stream<ProductState> get stream => _outputProductController.stream;

  ProductBloc() {
    _inputProductController.stream.listen(_mapEventToState);
  }

  _mapEventToState(ProductEvent event) {
    // TODO: criar um ProductLoadingState, ProductErrorState

    List<Product> products = [];

    if (event is LoadProductEvent) {
      products = _productsRepository.loadProducts();
    } else if (event is AddProductEvent) {
      products = _productsRepository.addProduct(event.product);
    } else if (event is RemoveProductEvent) {
      products = _productsRepository.removeProduct(event.product);
    }

    _outputProductController.add(ProductSuccessState(products: products));
  }
}
