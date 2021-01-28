import 'package:flutter/material.dart';
import 'package:flutter_app/model/product_model.dart';
import 'package:flutter_app/pages/demo/shopping_list_item.dart';

class ShoppingList extends StatefulWidget {
  ShoppingList({Key key, this.products}) : super(key: key);

  final List<ProductModel> products;

  // The framework calls createState the first time a widget appears at a given
  // location in the tree. If the parent rebuilds and uses the same type of
  // widget (with the same key), the framework will re-use the State object
  // instead of creating a new State object.

  @override
  _ShoppingListState createState() => new _ShoppingListState();
}

class _ShoppingListState extends State<ShoppingList> {
  Set<ProductModel> _shoppingCart = new Set<ProductModel>();

  void _handleCartChanged(ProductModel product, bool inCart) {
    setState(() {
      // When user changes what is in the cart, we need to change _shoppingCart
      // inside a setState call to trigger a rebuild. The framework then calls
      // build, below, which updates the visual appearance of the app.

      if (inCart)
        _shoppingCart.add(product);
      else
        _shoppingCart.remove(product);
    });
  }

  @override
  Widget build(BuildContext context) {
    return new Scaffold(
      appBar: new AppBar(
        title: new Text('Shopping List ${_shoppingCart.length}'),
      ),
      body: new ListView(
        padding: new EdgeInsets.symmetric(vertical: 8.0),
        children: widget.products
            .map((product) => new ShoppingListItem(
                  productModel: product,
                  inCart: _shoppingCart.contains(product),
                  onCartChanged: _handleCartChanged,
                ))
            .toList(),
      ),
    );
  }
}
