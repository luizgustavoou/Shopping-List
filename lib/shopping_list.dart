import 'package:flutter/material.dart';
import 'package:flutter_bloc/flutter_bloc.dart';
import 'package:shopping_list_app/blocs/product_bloc.dart';
import 'package:shopping_list_app/blocs/product_events.dart';
import 'package:shopping_list_app/blocs/product_state.dart';
import 'package:shopping_list_app/product._model.dart';
import 'package:shopping_list_app/shopping_item.dart';

class ShoppingList extends StatefulWidget {
  const ShoppingList({super.key});

  @override
  State<ShoppingList> createState() => _ShoppingListState();
}

class _ShoppingListState extends State<ShoppingList> {
  final List<ProductModel> products = [
    ProductModel(name: 'Eggs'),
    ProductModel(name: 'Flour'),
    ProductModel(name: 'Chocolate chips'),
  ];
  final _shoppingCart = <ProductModel>{};

  late final ProductBloc productBloc;

  @override
  void initState() {
    // TODO: implement initState
    super.initState();
    productBloc = ProductBloc();
    productBloc.add(LoadProductEvent());
  }

  @override
  void dispose() {
    // TODO: implement dispose
    super.dispose();
    productBloc.close();
  }

  void _handleCartChanged(ProductModel product, bool inCart) {
    setState(() {
      if (!inCart) {
        _shoppingCart.add(product);
      } else {
        _shoppingCart.remove(product);
      }
    });
  }

  void _handleCartRemove(ProductModel product) {
    productBloc.add(RemoveProductEvent(product: product));
  }

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(title: Text('Shopping List')),
      floatingActionButton: FloatingActionButton(
        child: const Icon(Icons.add_shopping_cart_rounded),
        onPressed: () {
          // Navigator.of(context).pushNamed('/add');
          productBloc
              .add(AddProductEvent(product: ProductModel(name: 'blabla')));
        },
      ),
      body: BlocBuilder<ProductBloc, ProductState>(
        bloc: productBloc,
        builder: (context, state) {
          if (state is ProductInitialState) {
            return const Center(
              child: CircularProgressIndicator(),
            );
          } else if (state is ProductSuccessState) {
            final productList = state.products;

            return ListView.separated(
              itemCount: productList.length,
              itemBuilder: (context, index) {
                return ShoppingItem(
                  product: productList[index],
                  inCart: _shoppingCart.contains(productList[index]),
                  onCartChanged: _handleCartChanged,
                  onCartRemove: _handleCartRemove,
                );
              },
              separatorBuilder: (BuildContext context, int index) {
                return const Divider();
              },
            );
          }

          return Container();
        },
      ),
    );
  }
}
