import 'package:flutter/material.dart';
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
    productBloc.inputProduct.add(LoadProductEvent());
  }

  @override
  void dispose() {
    // TODO: implement dispose
    super.dispose();
    productBloc.inputProduct.close();
  }

  void _handleCartChanged(ProductModel product, bool inCart) {
    // print('${product.name} e $inCart');
    setState(() {
      if (!inCart) {
        _shoppingCart.add(product);
      } else {
        _shoppingCart.remove(product);
      }
    });
  }

  void _handleCartRemove(ProductModel product) {
    productBloc.inputProduct.add(RemoveProductEvent(product: product));
  }

  @override
  Widget build(BuildContext context) {
    return Scaffold(
        appBar: AppBar(title: Text('Shopping List')),
        floatingActionButton: FloatingActionButton(
          child: Icon(Icons.add_shopping_cart_rounded),
          onPressed: () {
            // Navigator.of(context).pushNamed('/add');
            productBloc.inputProduct
                .add(AddProductEvent(product: ProductModel(name: 'blabla')));
          },
        ),
        body: StreamBuilder<ProductState>(
            stream: productBloc.stream,
            builder: (context, AsyncSnapshot<ProductState> snapshot) {
              final productsList = snapshot.data?.products ?? [];

              return ListView.separated(
                itemCount: productsList.length,
                itemBuilder: (context, index) {
                  return ShoppingItem(
                    product: productsList[index],
                    inCart: _shoppingCart.contains(productsList[index]),
                    onCartChanged: _handleCartChanged,
                    onCartRemove: _handleCartRemove,
                  );
                },
                separatorBuilder: (BuildContext context, int index) {
                  return const Divider();
                },
              );
            }));
  }
}
