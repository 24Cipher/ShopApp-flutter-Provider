import 'package:ShopApp/providers/cart.dart';
import 'package:flutter/material.dart';
import 'package:provider/provider.dart';

class CartItemTile extends StatelessWidget {
  final String image;
  final String id;
  final String prodId;
  final String title;
  final int quantity;
  final double price;

  const CartItemTile({
    Key key,
    @required this.image,
    @required this.id,
    @required this.prodId,
    @required this.title,
    @required this.quantity,
    @required this.price,
  }) : super(key: key);

  @override
  Widget build(BuildContext context) {
    return Dismissible(
      direction: DismissDirection.endToStart,
      onDismissed: (direction) {
        Provider.of<Cart>(context, listen: false).removeItem(prodId);
      },
      key: ValueKey(id),
      background: Container(
        color: Colors.red,
        child: Icon(
          Icons.delete,
          color: Colors.white,
          size: 40,
        ),
        alignment: Alignment.centerRight,
        padding: EdgeInsets.only(right: 20),
      ),
      child: Padding(
        padding: const EdgeInsets.all(10.0),
        child: Card(
          child: ListTile(
            leading: CircleAvatar(
              backgroundImage: NetworkImage(image),
            ),
            title: Text(title),
            subtitle: Text('Total : \$$price'),
            trailing: Text('x$quantity'),
          ),
        ),
      ),
    );
  }
}
