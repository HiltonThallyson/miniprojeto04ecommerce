import 'package:f6_ecommerce/model/cart_model.dart';
import 'package:flutter/material.dart';
import 'package:flutter/src/foundation/key.dart';
import 'package:flutter/src/widgets/framework.dart';
import 'package:provider/provider.dart';
import '../components/display_chart_area.dart';
import '../components/display_total_area.dart';
import '../components/product_cart_item.dart';

class MyCart extends StatefulWidget {
  @override
  State<MyCart> createState() => _MyCartState();
}

class _MyCartState extends State<MyCart> {
  @override
  Widget build(BuildContext context) {
    return Scaffold(
        appBar: AppBar(
          title: Text('Meu Carrinho'),
        ),
        body: Column(
          children: [
            Expanded(
              flex: 5,
              child: DisplayProductsArea(),
            ),
            Expanded(
              flex: 1,
              child: DisplayTotal(),
            )
          ],
        ));
  }
}
