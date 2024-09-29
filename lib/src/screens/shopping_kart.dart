
import 'package:colonial/src/models/product.dart';
import 'package:colonial/src/theme/colors.dart';
import 'package:colonial/src/widgets/shopping_kart_item.dart';
import 'package:flutter/material.dart';

class ShoppingKart extends StatefulWidget {

  const ShoppingKart({super.key});

  @override
  State<ShoppingKart> createState() => _ShoppingKartState();
}

class _ShoppingKartState extends State<ShoppingKart> {
  @override
  Widget build(BuildContext context) {
    return Card(
      color: secundaryColor,
      margin: EdgeInsets.all(8.0),
      child: SizedBox.expand(
        child: Center(
          child: ListView(
            children: [
              ShoppingKartItem('produto1', 'Valor'),
              ShoppingKartItem('Produto2', 'Valor'),
              ShoppingKartItem('Produto3', 'valor'),
              ShoppingKartItem('produto4', 'valor'),
            ],
          ),
        ),
      ),
    );
  }
}
