import 'package:ShopApp/providers/cart.dart';
import 'package:ShopApp/providers/product.dart';
import 'package:ShopApp/providers/products_provider.dart';
import 'package:ShopApp/widgets/cartItemtile.dart';
import 'package:flutter/material.dart';
import 'package:provider/provider.dart';

class CartScreen extends StatelessWidget {
  static final routeName = '/cart';

  @override
  Widget build(BuildContext context) {
    final cart = Provider.of<Cart>(context);
    return Scaffold(
        appBar: AppBar(
          title: Text('Your Cart'),
        ),
        body: Column(
          children: [
            Card(
              elevation: 6,
              margin: EdgeInsets.all(15),
              child: Padding(
                padding: EdgeInsets.all(8),
                child: Row(
                  mainAxisAlignment: MainAxisAlignment.spaceBetween,
                  children: [
                    Text('Total', style: TextStyle(fontSize: 20)),
                    Spacer(),
                    Chip(
                      label: Text('\$${cart.totalAmt.toString()}'),
                      backgroundColor: Theme.of(context).primaryColor,
                    ),
                    FlatButton(
                        onPressed: null,
                        child: Text(
                          'ORDER NOW',
                          style:
                              TextStyle(color: Theme.of(context).primaryColor),
                        ))
                  ],
                ),
              ),
            ),
            SizedBox(
              height: 10,
            ),
            Expanded(
                child: ListView.builder(
                    itemCount: cart.itemCount,
                    itemBuilder: (ctx, i) {
                      var item = cart.items.values.toList()[i];
                      return CartItemTile(
                        id: item.id,
                        prodId: cart.items.keys.toList()[i],
                        image: item.imageUrl,
                        price: item.price,
                        quantity: item.quantity,
                        title: item.title,
                      );
                    }))
          ],
        ));
  }
}
