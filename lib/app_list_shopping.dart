import 'package:flutter/material.dart';
import 'package:shopping_list_app/shopping_list.dart';

class AppListShop extends StatelessWidget {
  const AppListShop({super.key});

  @override
  Widget build(BuildContext context) {
    return MaterialApp(
      title: 'Shopping App',
      theme: ThemeData(primarySwatch: Colors.red, brightness: Brightness.light),
      // home: ShoppingList(
      //   products: [
      //     Product(name: 'Eggs'),
      //     Product(name: 'Flour'),
      //     Product(name: 'Chocolate chips'),
      //   ],
      // ),
      initialRoute: '/add',
      routes: {
        '/': (context) => ShoppingList(
              products: [
                Product(name: 'Eggs'),
                Product(name: 'Flour'),
                Product(name: 'Chocolate chips'),
              ],
            ),
        '/add': (context) => Scaffold(
            appBar: AppBar(
              title: Text('Add product'),
            ),
            body: Container(
                width: double.infinity,
                height: double.infinity,
                child: Column(
                  children: [
                    Text('TODO ADD PRODUCT'),
                  ],
                )))
      },
    );
  }
}
