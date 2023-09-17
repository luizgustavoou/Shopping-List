import 'package:flutter/material.dart';
import 'package:shopping_list_app/shopping_list.dart';

class AppListShop extends StatelessWidget {
  const AppListShop({super.key});

  @override
  Widget build(BuildContext context) {
    return MaterialApp(
      title: 'Shopping App',
      home: ShoppingList(
        products: [
          Product(name: 'Eggs'),
          Product(name: 'Flour'),
          Product(name: 'Chocolate chips'),
        ],
      ),
    );
  }
}
