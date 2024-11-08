import 'package:colonial/src/controllers/shopping_kart_provider.dart';
import 'package:colonial/src/controllers/user_provider.dart';
import 'package:colonial/src/services/orders_api.dart';
import 'package:colonial/src/theme/colors.dart';
import 'package:colonial/src/utils/image_utils.dart';
import 'package:colonial/src/widgets/shopping_kart_item.dart';
import 'package:flutter/material.dart';
import 'package:provider/provider.dart';
import '../models/product.dart';

class ShoppingKart extends StatefulWidget {
  ShoppingKart({super.key});

  @override
  State<ShoppingKart> createState() => _ShoppingKartState();
}

class _ShoppingKartState extends State<ShoppingKart> {
  String? customerAddress;

  @override
  Widget build(BuildContext context) {
    return Consumer<ShoppingKartProvider>(
      builder: (context, shoppingKartProvider, child) {
        final itensDoCarrinho = shoppingKartProvider.itens;
        String? customerAddress;

        return Column(
          children: [
            Expanded(
              child: Card(
                color: secundaryColor,
                margin: const EdgeInsets.all(8.0),
                child: SizedBox.expand(
                    child: Center(
                  child: ListView.builder(
                      itemBuilder: (context, index) {
                        final item = itensDoCarrinho[index];
                        return ShoppingKartItem(
                          itemId: item.id,
                          productName: item.name,
                          productPrice: item.price,
                          quantity: item.quantity,
                        );
                      },
                      itemCount: itensDoCarrinho.length),
                )),
              ),
            ),
            Card(
              child: Padding(
                padding: const EdgeInsets.all(8.0),
                child: Row(
                  mainAxisAlignment: MainAxisAlignment.spaceBetween,
                  children: [
                    const Text(
                      'Valor total:',
                      style: TextStyle(fontSize: 20),
                    ),
                    Text(
                      'R\$ ${shoppingKartProvider.totalPrice.toStringAsFixed(2)}',
                      style: const TextStyle(
                          fontSize: 20, fontWeight: FontWeight.bold),
                    )
                  ],
                ),
              ),
            ),
            Padding(
              padding: const EdgeInsets.all(8.0),
              child: ElevatedButton(
                  style: const ButtonStyle(
                      padding: WidgetStatePropertyAll(
                          EdgeInsets.symmetric(vertical: 16.0))),
                  onPressed: () {
                    _finishOrder(context);
                    print(customerAddress);
                  },
                  child: const Row(
                    mainAxisAlignment: MainAxisAlignment.spaceEvenly,
                    children: [
                      Icon(
                        Icons.shopping_cart_checkout,
                        size: 36,
                      ),
                      Text(
                        'Finalizar Carrinho',
                        style: TextStyle(
                          color: Colors.white,
                          fontWeight: FontWeight.bold,
                          fontSize: 24,
                        ),
                      ),
                    ],
                  )),
            ),
          ],
        );
      },
    );
  }

  Future<void> _finishOrder(BuildContext context) async {
    customerAddress = await _showAddressDialog(context);

    final customerId = context.read<UserProvider>().getUserId();
    final cartItems = context.read<ShoppingKartProvider>().itens;

    if (customerId != null && cartItems != []) {
      final products = cartItems.map((item) {
        return OrderItem(
          id: item.id,
          amount: item.quantity,
        );
      }).toList();
      Future<bool> payed = _showPayment(context);

      if (await payed) {
        newOrder(customerId, customerAddress!, products);
      } else {
        print('Erro no pagamento');
      }
    }
  }
}

Future<String?> _showAddressDialog(BuildContext context) async {
  String? customerAddress;

  await showDialog<String>(
      context: context,
      builder: (BuildContext context) {
        return AlertDialog(
          title: const Text('Informe o endereço de entrega'),
          content: TextField(
            onChanged: (value) {
              customerAddress = value;
            },
            decoration: const InputDecoration(hintText: 'Endereço'),
          ),
          actions: <Widget>[
            TextButton(
                onPressed: () {
                  Navigator.of(context).pop();
                },
                child: const Text('Cancelar')),
            TextButton(
                onPressed: () {
                  Navigator.of(context).pop();
                },
                child: const Text('Confirmar')),
          ],
        );
      });

  if (customerAddress != null) {
    print('Endereço: $customerAddress');
    return customerAddress;
  } else {
    throw Exception('Erro no endereço de entrega');
  }
}

Future<bool> _showPayment(BuildContext context) async {
  bool payed = false;

  await showDialog(
      context: context,
      builder: (BuildContext context) {
        return AlertDialog(
          title: const Text('Pagamento'),
          content: SizedBox(
            height: 250,
            child: Column(
              children: [
                Image.asset(
                  getImagePath('qr-code-to-payment.png'),
                  height: 200,
                ),
                const Text('Pague com Pix'),
              ],
            ),
          ),
          actions: [
            TextButton(
                onPressed: () {
                  payed = false;
                  Navigator.of(context).pop();
                },
                child: const Text('Cancelar')),
            TextButton(
                onPressed: () {
                  payed = true;
                  Navigator.of(context).pop();
                },
                child: const Text('Realizado')),
          ],
        );
      });

  return payed;
}
