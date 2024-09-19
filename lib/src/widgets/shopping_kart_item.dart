import 'package:flutter/material.dart';

class ShoppingKartItem extends StatefulWidget {
  final String productName;
  final String productPrice;

    const ShoppingKartItem(this.productName, this.productPrice, {super.key});
  @override
  State<ShoppingKartItem> createState() => _ShoppingKartItemState();
}

class _ShoppingKartItemState extends State<ShoppingKartItem> {
  int qtd = 1;



  @override
  Widget build(BuildContext context) {
    return Card(
      child: Padding(
        padding: const EdgeInsets.all(16.0),
        child: Row(
          mainAxisAlignment: MainAxisAlignment.spaceBetween,
          children: [
            Container(
              width: 96,
              child: Row(
                mainAxisAlignment: MainAxisAlignment.spaceBetween,
                children: [
                  Text(
                    '$qtd',
                    style: const TextStyle(fontWeight: FontWeight.bold, overflow: TextOverflow.ellipsis)
                    ,
                  ),
                  Column(
                    crossAxisAlignment: CrossAxisAlignment.start,
                    children: [
                      Text(
                        widget.productName,
                        style: const TextStyle(fontWeight: FontWeight.bold),
                      ),
                      Text(widget.productPrice),
                    ],
                  ),
                ],
              ),
            ),
            Row(
              children: [
                Visibility(
                  visible: qtd >= 2,
                  child: ElevatedButton(
                      onPressed: () {
                        setState(() {
                          qtd--;
                        });
                      },
                      style: const ButtonStyle(
                        backgroundColor: WidgetStatePropertyAll(Colors.white),
                        iconColor: WidgetStatePropertyAll(Colors.black),
                        padding: WidgetStatePropertyAll(
                            EdgeInsets.symmetric(horizontal: 0.0)),
                      ),
                      child: const Icon(Icons.remove)),
                ),
                ElevatedButton(
                    onPressed: () {
                      setState(() {
                        qtd++;
                      });
                    },
                    style: const ButtonStyle(
                        backgroundColor: WidgetStatePropertyAll(Colors.white),
                        iconColor: WidgetStatePropertyAll(Colors.black),
                        padding: WidgetStatePropertyAll(
                            EdgeInsets.symmetric(horizontal: 0.0))),
                    child: const Icon(Icons.add)),
                ElevatedButton(
                    onPressed: () {},
                    style: const ButtonStyle(
                        backgroundColor:
                            WidgetStatePropertyAll(Colors.redAccent),
                        padding: WidgetStatePropertyAll(
                            EdgeInsets.symmetric(horizontal: 0.0))),
                    child: const Icon(Icons.delete_forever_outlined)),
              ],
            )
          ],
        ),
      ),
    );
  }
}
