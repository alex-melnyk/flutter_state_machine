import 'dart:collection';

import 'package:flutter/material.dart';

import 'item.dart';

class CatalogModel {
  final _colors = Colors.accents;
  final List<Item> _items = [];

  UnmodifiableListView<Item> get items => UnmodifiableListView(_items);

  void preFill() {
    _items.addAll(List<Item>.generate(
      _colors.length,
      (index) {
        return Item(
          'Item #$index',
          _colors[index],
        );
      },
    ));
  }
}
