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
        '/': (context) => const ShoppingList(),
        '/add': (context) => Scaffold(
            appBar: AppBar(
              title: const Text('Add product'),
            ),
            body: Container(
                width: double.infinity,
                height: double.infinity,
                child: const Column(
                  children: [
                    Text('TODO ADD PRODUCT'),
                  ],
                )))
      },
    );
  }
}
