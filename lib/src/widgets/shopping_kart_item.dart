import 'package:colonial/src/controllers/shopping_kart_provider.dart';
import 'package:flutter/material.dart';
import 'package:provider/provider.dart';

class ShoppingKartItem extends StatefulWidget {
  final String itemId;
  final String productName;
  final double productPrice;
  int quantity;

  ShoppingKartItem({
    required this.itemId,
    required this.productName,
    required this.productPrice,
    this.quantity = 1,
    super.key,
  });

  @override
  State<ShoppingKartItem> createState() => _ShoppingKartItemState();
}

class _ShoppingKartItemState extends State<ShoppingKartItem> {
  int qtd = 1;

  @override
  Widget build(BuildContext context) {
    return Consumer<ShoppingKartProvider>(
        builder: (context, shoppingKartProvider, child) {
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
                      style: const TextStyle(
                          fontWeight: FontWeight.bold,
                          overflow: TextOverflow.ellipsis),
                    ),
                    Column(
                      crossAxisAlignment: CrossAxisAlignment.start,
                      children: [
                        Text(
                          widget.productName,
                          style: const TextStyle(fontWeight: FontWeight.bold),
                        ),
                        Text('R\$ ${widget.productPrice.toStringAsFixed(2)}'),
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
                            shoppingKartProvider.updateQuantity(widget.itemId, qtd);
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
                          shoppingKartProvider.updateQuantity(widget.itemId, qtd);
                        });
                      },
                      style: const ButtonStyle(
                          backgroundColor: WidgetStatePropertyAll(Colors.white),
                          iconColor: WidgetStatePropertyAll(Colors.black),
                          padding: WidgetStatePropertyAll(
                              EdgeInsets.symmetric(horizontal: 0.0))),
                      child: const Icon(Icons.add)),
                  ElevatedButton(
                      onPressed: () {
                        final carrinhoProvider =
                            Provider.of<ShoppingKartProvider>(context,
                                listen: false);

                        carrinhoProvider.removeItem(widget.itemId);
                      },
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
    });
  }
}
