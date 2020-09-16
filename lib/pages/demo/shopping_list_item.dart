import 'package:flutter/material.dart';
import 'package:flutter_app/model/product_model.dart';
typedef void CartChangedCallback(ProductModel productModel, bool inCart);

class ShoppingListItem extends StatelessWidget {
  ShoppingListItem({ProductModel productModel, this.inCart, this.onCartChanged})
      : productModel = productModel,
        super(key: new ObjectKey(productModel));

  final ProductModel productModel;
  final bool inCart;
  final CartChangedCallback onCartChanged;

  Color _getColor(BuildContext context) {
    // The theme depends on the BuildContext because different parts of the tree
    // can have different themes.  The BuildContext indicates where the build is
    // taking place and therefore which theme to use.
    return inCart ? Colors.black54 : Theme.of(context).primaryColor;
  }

  TextStyle _getTextStyle(BuildContext context) {
    if (!inCart) return null;

    return new TextStyle(
      color: Colors.black54,
      decoration: TextDecoration.lineThrough,
    );
  }

  @override
  Widget build(BuildContext context) {
    return new ListTile(
      onTap: () {
        onCartChanged(productModel, !inCart);
      },
      leading: new CircleAvatar(
        backgroundColor: _getColor(context),
        child: new Text(productModel.name[0]),
      ),
      title: new Text(productModel.name, style: _getTextStyle(context)),
    );
  }
}