import 'package:flutter/material.dart';
import 'package:shopping_list_app/shopping_item.dart';

class Product {
  Product({required this.name});
  final String name;
}

class ShoppingList extends StatefulWidget {
  const ShoppingList({super.key, required this.products});

  final List<Product> products;

  @override
  State<ShoppingList> createState() => _ShoppingListState();
}

class _ShoppingListState extends State<ShoppingList> {
  final _shoppingCart = <Product>{};

  void _handleCartChanged(Product product, bool inCart) {
    // print('${product.name} e $inCart');
    setState(() {
      if (!inCart) {
        _shoppingCart.add(product);
      } else {
        _shoppingCart.remove(product);
      }
    });
  }

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(title: Text('Shopping List')),
      floatingActionButton: FloatingActionButton(
        child: Icon(Icons.add_shopping_cart_rounded),
        onPressed: () {
          Navigator.of(context).pushNamed('/add');
        },
      ),
      body: ListView(
        padding: EdgeInsets.symmetric(vertical: 8),
        children: widget.products.map((product) {
          return ShoppingItem(
              product: product,
              inCart: _shoppingCart.contains(product),
              onCartChanged: _handleCartChanged);
        }).toList(),
      ),
    );
  }
}
