import 'package:flutter/foundation.dart';

class CartItem {
  final String title;
  final String id;
  final int quantity;
  final double price;
  final String imageUrl;
  // final double totalAmt;
  CartItem(
      {@required this.imageUrl,
      @required this.id,
      @required this.price,
      @required this.quantity,
      @required this.title});
}

class Cart with ChangeNotifier {
  Map<String, CartItem> _items = {};

  Map<String, CartItem> get items {
    return {..._items};
  }

  int get itemCount {
    return _items.length;
  }

  double get totalAmt {
    var total = 0.0;
    _items.forEach((key, cartItem) {
      total += cartItem.price * cartItem.quantity;
    });
    return total;
  }

  void removeItem(String id) {
    _items.remove(id);
    notifyListeners();
  }

  void addItemToCart(String prodId, double price, String title, String image) {
    if (_items.containsKey(prodId)) {
      _items.update(
          prodId,
          (existingProd) => CartItem(
              id: existingProd.id,
              imageUrl: image,
              price: price,
              quantity: existingProd.quantity + 1,
              title: title));
    } else {
      _items.putIfAbsent(
          prodId,
          () => CartItem(
              imageUrl: image,
              id: DateTime.now().toString(),
              price: price,
              quantity: 1,
              title: title));
    }
    notifyListeners();
  }
}
