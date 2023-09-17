import 'package:flutter/material.dart';

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
      // floatingActionButton: FloatingActionButton(
      //   child: Icon(Icons.add_shopping_cart_rounded),
      //   onPressed: null,
      // ),
      body: ListView(
        padding: EdgeInsets.symmetric(vertical: 8),
        children: widget.products.map((product) {
          return ListTile(
            onTap: () {
              _handleCartChanged(product, _shoppingCart.contains(product));
            },
            leading: CircleAvatar(
              backgroundColor: _shoppingCart.contains(product)
                  ? Colors.black54
                  : Theme.of(context).primaryColor,
              child: Text(product.name[0]),
            ),
            title: Text(
              product.name,
              style: _shoppingCart.contains(product)
                  ? TextStyle(
                      color: Colors.black54,
                      decoration: TextDecoration.lineThrough)
                  : null,
            ),
          );
        }).toList(),
      ),
    );
  }
}
