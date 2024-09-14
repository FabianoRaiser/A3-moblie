import 'package:colonial/src/theme/colors.dart';
import 'package:flutter/material.dart';

class ProductCard extends StatelessWidget {
  const ProductCard({super.key});

  @override
  Widget build(BuildContext context) {
    return Card(
      margin: EdgeInsets.symmetric(vertical: 8.0, horizontal: 16.0),
      color: cardColor,
      child: Container(
        height: 270,
        child: Column(
          children: [
            Container(
              height: 180,
              child: Image.network(
                '',
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
                      Text("Produto", style: TextStyle(fontWeight: FontWeight.w700, fontSize: 20),),
                      Text("R\$ 00,00", style: TextStyle(fontSize: 16),),
                      Text("Validade: 0 dias", style: TextStyle(fontSize: 12, color: Colors.black54),),
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
