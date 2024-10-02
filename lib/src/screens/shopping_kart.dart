import 'package:colonial/src/controllers/shopping_kart_provider.dart';
import 'package:colonial/src/theme/colors.dart';
import 'package:colonial/src/widgets/shopping_kart_item.dart';
import 'package:flutter/material.dart';
import 'package:provider/provider.dart';

class ShoppingKart extends StatefulWidget {

  ShoppingKart({super.key});

  @override
  State<ShoppingKart> createState() => _ShoppingKartState();
}

class _ShoppingKartState extends State<ShoppingKart> {
  @override
  Widget build(BuildContext context) {
    return Consumer<ShoppingKartProvider>(
      builder: (context, shoppingKartProvider, child) {
        final itensDoCarrinho = shoppingKartProvider.itens;

        return Card(
          color: secundaryColor,
          margin: EdgeInsets.all(8.0),
          child: SizedBox.expand(
            child: Center(
                child: ListView.builder(
                  itemBuilder: (context, index){
                    final item = itensDoCarrinho[index];
                    return ShoppingKartItem(
                      itemId: item.id,
                      productName: item.name,
                      productPrice: item.price,

                    );
                  }, itemCount: itensDoCarrinho.length),
                )
            ),
          );
      },

    );
  }
}
