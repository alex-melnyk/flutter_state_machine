import 'package:flutter/material.dart';
import 'package:flutter_icons/flutter_icons.dart';
import 'package:flutter_state_machine/models/cart.dart';
import 'package:flutter_state_machine/models/catalog.dart';
import 'package:flutter_state_machine/screens/cart.dart';
import 'package:provider/provider.dart';

class CatalogScreen extends StatefulWidget {
  @override
  _CatalogScreenState createState() => _CatalogScreenState();
}

class _CatalogScreenState extends State<CatalogScreen> {
  @override
  Widget build(BuildContext context) {
    return Consumer<CartModel>(
      builder: (context, cart, child) {
        return Scaffold(
          appBar: AppBar(
            title: Text('Catalog'),
            actions: [
              IconButton(
                icon: Icon(MaterialCommunityIcons.cart_outline),
                onPressed: _handleCartPressed,
              ),
            ],
          ),
          body: Container(
            padding: const EdgeInsets.symmetric(
              horizontal: 8,
            ),
            child: Consumer<CatalogModel>(
              builder: (context, catalog, child) {
                return ListView.separated(
                  itemBuilder: (context, index) {
                    final item = catalog.items[index];
                    final colorHex = item.color.value.toRadixString(16).toUpperCase();
                    final inCart = cart.items.any((e) => e.color == item.color);

                    return Container(
                      height: 80,
                      child: Row(
                        mainAxisSize: MainAxisSize.max,
                        children: [
                          Container(
                            width: 50,
                            height: 50,
                            decoration: BoxDecoration(
                              color: item.color,
                            ),
                          ),
                          Expanded(
                            child: Padding(
                              padding: const EdgeInsets.symmetric(
                                horizontal: 16,
                              ),
                              child: Text(
                                '#$colorHex',
                                style: Theme.of(context).textTheme.headline5,
                              ),
                            ),
                          ),
                          IconButton(
                            icon: Icon(
                              inCart ? MaterialCommunityIcons.check : MaterialCommunityIcons.plus,
                              size: 32,
                              color: inCart ? Colors.lightGreen : Colors.black87,
                            ),
                            onPressed: () {
                              if (inCart) {
                                cart.remove(item);
                              } else {
                                cart.add(item);
                              }
                            },
                          ),
                        ],
                      ),
                    );
                  },
                  separatorBuilder: (context, index) => Divider(),
                  itemCount: catalog.items.length,
                );
              },
            ),
          ),
        );
      },
    );
  }

  void _handleCartPressed() {
    Navigator.of(context).push(MaterialPageRoute(
      builder: (context) => CartScreen(),
    ));
  }
}
