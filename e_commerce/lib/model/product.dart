import 'package:flutter/foundation.dart';

enum Category {
  all,
  accessories,
  clothing,
  home,
}

class Product {

  final Category category;
  final int id;
  final String name;
  final double price;

  const Product({
    @required this.category,
    @required this.id,
    @required this.name,
    @required this.price
    }) :  assert (category != null),
          assert (id != null),
          assert (name != null),
          assert (price != null);

  String get assetName => 'assets/img/$id-0.jpg';

  @override
  String toString() => '$name (id=$id)';

}