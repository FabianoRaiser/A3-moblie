import 'package:colonial/src/theme/colors.dart';
import 'package:flutter/material.dart';

class ProductCard extends StatefulWidget {
  final String name;
  final String imageLink;
  final double value;
  final String expirationTime;

  const ProductCard(this.name, this.imageLink, this.value, this.expirationTime,{super.key});

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
              padding: const EdgeInsets.symmetric(vertical: 8.0, horizontal: 16.0),
              child: Row(
                mainAxisAlignment: MainAxisAlignment.spaceBetween,
                children: [
                  Column(
                    crossAxisAlignment: CrossAxisAlignment.start,
                    children: [
                      Text(widget.name , style: const TextStyle(fontWeight: FontWeight.w700, fontSize: 20),),
                      Text("R\$ ${widget.value.toString()}", style: const TextStyle(fontSize: 16),),
                      Text("Validade: ${widget.expirationTime}", style: const TextStyle(fontSize: 12, color: Colors.black54),),
                    ],
                  ),
                  ElevatedButton(
                      onPressed: () {},
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
