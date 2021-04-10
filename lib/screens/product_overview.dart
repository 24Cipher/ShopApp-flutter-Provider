import 'package:ShopApp/providers/cart.dart';
import 'package:ShopApp/providers/products_provider.dart';
import 'package:ShopApp/screens/cartScreen.dart';
import 'package:ShopApp/widgets/badge.dart';
import 'package:flutter/material.dart';
import 'package:provider/provider.dart';
import '../widgets/product_item.dart';

enum filterOptions { favs, all }

class ProductsOverviewScreen extends StatefulWidget {
  @override
  _ProductsOverviewScreenState createState() => _ProductsOverviewScreenState();
}

class _ProductsOverviewScreenState extends State<ProductsOverviewScreen> {
  bool onlyFav = false;
  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(
        title: Text('MyShop'),
        actions: <Widget>[
          Consumer<Cart>(
            builder: (_, cart, ch) =>
                Badge(child: ch, value: cart.itemCount.toString()),
            child: IconButton(
                icon: Icon(
                  Icons.shopping_cart,
                  color: Colors.white,
                ),
                onPressed: () {
                  Navigator.of(context).pushNamed(CartScreen.routeName);
                }),
          ),
          PopupMenuButton(
              onSelected: (filterOptions selectedVal) {
                setState(() {
                  if (selectedVal == filterOptions.favs) {
                    onlyFav = true;
                  } else {
                    onlyFav = false;
                  }
                });
                print(selectedVal);
              },
              itemBuilder: (_) => [
                    PopupMenuItem(
                      child: Text('Favourites'),
                      value: filterOptions.favs,
                    ),
                    PopupMenuItem(child: Text('All'), value: filterOptions.all),
                  ])
        ],
      ),
      body: ProductsGrid(onlyFav),
    );
  }
}

class ProductsGrid extends StatelessWidget {
  final bool showFavs;
  ProductsGrid(this.showFavs);
  @override
  Widget build(BuildContext context) {
    final prodsProvider = Provider.of<Products>(context);
    final loadedProducts =
        showFavs ? prodsProvider.favItems : prodsProvider.items;

    return GridView.builder(
      padding: const EdgeInsets.all(10.0),
      itemCount: loadedProducts.length,
      itemBuilder: (ctx, i) => ChangeNotifierProvider.value(
        value: loadedProducts[i],
        // create: (c) => loadedProducts[i],
        child: ProductItem(),
      ),
      gridDelegate: SliverGridDelegateWithFixedCrossAxisCount(
        crossAxisCount: 2,
        childAspectRatio: 3 / 2,
        crossAxisSpacing: 10,
        mainAxisSpacing: 10,
      ),
    );
  }
}
