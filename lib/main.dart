import 'package:ShopApp/providers/cart.dart';
import 'package:ShopApp/providers/products_provider.dart';
import 'package:ShopApp/screens/cartScreen.dart';
import 'package:ShopApp/screens/product_detail_screen.dart';
import 'package:ShopApp/screens/product_overview.dart';
import 'package:flutter/material.dart';
import 'package:provider/provider.dart';

void main() => runApp(MyApp());

class MyApp extends StatelessWidget {
  @override
  Widget build(BuildContext context) {
    return MultiProvider(
      providers: [
        ChangeNotifierProvider(
          create: (ctx) => Products(),
        ),
        ChangeNotifierProvider(
          create: (ctx) => Cart(),
        ),
      ],
      child: MaterialApp(
          title: 'MyShop',
          theme: ThemeData(
            primarySwatch: Colors.purple,
            accentColor: Colors.deepOrange,
            fontFamily: 'Lato',
          ),
          home: ProductsOverviewScreen(),
          routes: {CartScreen.routeName: (ctx) => CartScreen()}),
    );
  }
}
