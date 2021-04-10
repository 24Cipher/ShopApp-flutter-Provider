import 'package:ShopApp/providers/cart.dart';
import 'package:ShopApp/providers/product.dart';
import 'package:flutter/material.dart';
import 'package:provider/provider.dart';

class ProductItem extends StatelessWidget {
  @override
  Widget build(BuildContext context) {
    final prdct = Provider.of<Product>(context);
    final cart = Provider.of<Cart>(context);
    return ClipRRect(
      borderRadius: BorderRadius.circular(10),
      child: GridTile(
        child: Image.network(
          prdct.imageUrl,
          fit: BoxFit.cover,
        ),
        footer: GridTileBar(
          backgroundColor: Colors.black87,
          leading: IconButton(
            icon: Icon(
                prdct.isFavourite ? Icons.favorite : Icons.favorite_border),
            color: Theme.of(context).accentColor,
            onPressed: () {
              prdct.toggleFav();
            },
          ),
          title: Text(
            prdct.title,
            textAlign: TextAlign.center,
          ),
          trailing: IconButton(
            icon: Icon(
              Icons.shopping_cart,
            ),
            onPressed: () {
              cart.addItemToCart(
                  prdct.id, prdct.price, prdct.title, prdct.imageUrl);
            },
            color: Theme.of(context).accentColor,
          ),
        ),
      ),
    );
  }
}
