import 'dart:collection';

import 'package:flutter/widgets.dart';

import 'item.dart';

class CartModel extends ChangeNotifier {
  final List<Item> _items = [];

  UnmodifiableListView<Item> get items => UnmodifiableListView(_items);

  void add(Item item) {
    _items.add(item);

    notifyListeners();
  }

  void remove(Item item) {
    _items.remove(item);

    notifyListeners();
  }

  void removeAll() {
    _items.clear();

    notifyListeners();
  }
}
