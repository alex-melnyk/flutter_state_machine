import 'package:flutter/material.dart';
import 'package:flutter_state_machine/models/cart.dart';
import 'package:flutter_state_machine/models/catalog.dart';
import 'package:flutter_state_machine/screens/screens.dart';
import 'package:provider/provider.dart';

void main() {
  runApp(MultiProvider(
    providers: [ChangeNotifierProvider(create: (_) => CartModel()), Provider(create: (_) => CatalogModel()..preFill())],
    child: MyApp(),
  ));
}

class MyApp extends StatelessWidget {
  @override
  Widget build(BuildContext context) {
    return MaterialApp(
      title: 'Flutter Demo',
      theme: ThemeData(
        primarySwatch: Colors.blue,
        visualDensity: VisualDensity.adaptivePlatformDensity,
      ),
      home: CatalogScreen(),
    );
  }
}
