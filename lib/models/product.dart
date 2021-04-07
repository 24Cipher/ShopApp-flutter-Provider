import 'package:flutter/cupertino.dart';

class Product {
  final String id;
  final String title;
  final double price;
  final String description;
  final String picUrl;
  bool isFavourite;
  Product(
      {@required this.id,
      this.isFavourite = false,
      this.description,
      @required this.title,
      @required this.picUrl,
      @required this.price});
}
