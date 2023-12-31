import 'package:flutter/material.dart';
import 'package:shopping_list_app/product._model.dart';

class ShoppingItem extends StatelessWidget {
  const ShoppingItem(
      {super.key,
      required this.product,
      required this.inCart,
      required this.onCartChanged,
      required this.onCartRemove});

  final ProductModel product;
  final bool inCart;
  final void Function(ProductModel product, bool inCart) onCartChanged;
  final void Function(ProductModel productModel) onCartRemove;

  TextStyle? _getTextStyle(BuildContext context) {
    if (!inCart) return null;

    return TextStyle(
        color: Colors.black54, decoration: TextDecoration.lineThrough);
  }

  Color? _getColor(BuildContext context) {
    if (!inCart) return Theme.of(context).primaryColor;

    return Colors.black54;
  }

  @override
  Widget build(BuildContext context) {
    return ListTile(
      onTap: () {
        onCartChanged(product, inCart);
      },
      leading: CircleAvatar(
        backgroundColor: _getColor(context),
        child: Text(product.name[0]),
      ),
      title: Text(product.name, style: _getTextStyle(context)),
      trailing: IconButton(
          onPressed: () {
            onCartRemove(product);
          },
          icon: const Icon(Icons.delete)),
    );
  }
}
