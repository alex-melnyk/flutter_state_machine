import 'package:flutter/material.dart';
import 'package:flutter_icons/flutter_icons.dart';
import 'package:flutter_state_machine/models/cart.dart';
import 'package:provider/provider.dart';

class CartScreen extends StatefulWidget {
  @override
  _CartScreenState createState() => _CartScreenState();
}

class _CartScreenState extends State<CartScreen> {
  @override
  Widget build(BuildContext context) {
    return Consumer<CartModel>(
      builder: (context, cart, child) {
        return Scaffold(
          appBar: AppBar(
            title: Text('Cart'),
          ),
          body: Container(
            padding: const EdgeInsets.symmetric(
              horizontal: 8,
            ),
            child: ListView.separated(
              itemBuilder: (context, index) {
                final item = cart.items[index];
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
                          MaterialCommunityIcons.minus,
                          size: 32,
                          color: Colors.redAccent,
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
              itemCount: cart.items.length,
            ),
          ),
        );
      },
    );
  }
}
