import 'dart:collection';

import 'package:flutter/material.dart';
import 'package:uts_eric_inzaghi_firdaus_2020110015/models/cart_item.dart';

class Cart extends ChangeNotifier {
  final _items = <CartItem>[];

  UnmodifiableListView<CartItem> get items => UnmodifiableListView(_items);

  int get totalItem => _items.length;

  int get totalPayment {
    int total = 0;
    for (var item in _items) {
      total += item.qty * item.product.price;
    }
    return total;
  }

  void add(CartItem item) {
    _items.add(item);

    notifyListeners();
  }

  void removeItem(int index) {
    _items.removeAt(index);

    notifyListeners();
  }
}
