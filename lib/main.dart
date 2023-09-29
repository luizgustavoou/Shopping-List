import 'package:flutter/material.dart';
import 'package:shopping_list_app/app_list_shopping.dart';
import 'package:flutter_bloc/flutter_bloc.dart';
import 'package:shopping_list_app/blocs/product_bloc.dart';

void main() {
  runApp(BlocProvider(
    create: (context) => ProductBloc(),
    child: const AppListShop(),
  ));
}
