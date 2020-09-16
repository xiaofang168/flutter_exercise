import 'package:flutter/material.dart';
import 'package:flutter_app/model/product_model.dart';
import 'package:flutter_app/pages/gjj/gjj_home_page.dart';
import 'package:flutter_app/pages/demo/shopping_list.dart';
import 'package:flutter_app/pages/demo/shopping_list_item.dart';

void main()=>runApp(MyApp());

class MyApp extends StatelessWidget {
  // This widget is the root of your application.
  @override
  Widget build(BuildContext context) {
    return MaterialApp(
      theme: ThemeData(
        primaryColor: Colors.white,
        // This makes the visual density adapt to the platform that you run
        // the app on. For desktop platforms, the controls will be smaller and
        // closer together (more dense) than on mobile platforms.
        visualDensity: VisualDensity.adaptivePlatformDensity,
      ),
      title: 'Shopping App',
      home: new ShoppingList(
        products: <ProductModel>[
          new ProductModel(name: 'Eggs'),
          new ProductModel(name: 'Flour'),
          new ProductModel(name: 'Chocolate chips'),
        ],
      ),
    );
  }
}

