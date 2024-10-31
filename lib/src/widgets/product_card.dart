import 'package:colonial/src/controllers/shopping_kart_provider.dart';
import 'package:colonial/src/theme/colors.dart';
import 'package:flutter/material.dart';
import 'package:provider/provider.dart';

import '../models/kart_item.dart';

class ProductCard extends StatefulWidget {
  final String id;
  final String name;
  final String imageLink;
  final double price;
  final String expirationTime;

  const ProductCard(
      {required this.id,
      required this.name,
      required this.imageLink,
      required this.price,
      required this.expirationTime,
      super.key});

  @override
  State<ProductCard> createState() => _ProductCardState();
}

class _ProductCardState extends State<ProductCard> {
  @override
  Widget build(BuildContext context) {
    return Card(
      margin: const EdgeInsets.symmetric(vertical: 8.0, horizontal: 16.0),
      color: cardColor,
      child: SizedBox(
        height: 270,
        child: Column(
          children: [
            SizedBox(
              height: 180,
              child: Image.asset(
                widget.imageLink,
                fit: BoxFit.cover,
              ),
            ),
            Padding(
              padding:
                  const EdgeInsets.symmetric(vertical: 8.0, horizontal: 16.0),
              child: Row(
                mainAxisAlignment: MainAxisAlignment.spaceBetween,
                children: [
                  Column(
                    crossAxisAlignment: CrossAxisAlignment.start,
                    children: [
                      Text(
                        widget.name,
                        style: const TextStyle(
                            fontWeight: FontWeight.w700, fontSize: 20),
                      ),
                      Text(
                        "R\$ ${widget.price.toStringAsFixed(2)}",
                        style: const TextStyle(fontSize: 16),
                      ),
                    ],
                  ),
                  ElevatedButton(
                      onPressed: () {
                        final kartProvider = Provider.of<ShoppingKartProvider>(
                            context,
                            listen: false);
                        kartProvider.addItem(KartItem(id: widget.id, name: widget.name, price: widget.price, quantity: 1));
                      },
                      child: const Icon(
                        Icons.add_shopping_cart,
                      ))
                ],
              ),
            )
          ],
        ),
      ),
    );
  }
}
