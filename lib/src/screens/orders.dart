import 'package:colonial/src/controllers/user_provider.dart';
import 'package:flutter/material.dart';
import 'package:intl/intl.dart';
import 'package:provider/provider.dart';

import '../services/orders_api.dart';

class Orders extends StatefulWidget {
  const Orders({super.key});

  @override
  State<Orders> createState() => _OrdersState();
}

class _OrdersState extends State<Orders> {
  late Future<List<Map<String, dynamic>>> _ordersFuture;

  @override
  void initState() {
    super.initState();
  }

  @override
  void didChangeDependencies() {
    super.didChangeDependencies();

    final userProvider = Provider.of<UserProvider>(context);
    _ordersFuture = getOrders(userProvider.getUserId()!);
  }

  @override
  Widget build(BuildContext context) {
    return FutureBuilder<List<Map<String, dynamic>>>(
      future: _ordersFuture,
      builder: (context, snapshot) {
        if (snapshot.hasData) {
          final orders = snapshot.data!;
          return ListView.builder(
            itemCount: orders.length,
            itemBuilder: (context, index) {
              final order = orders[index];
              String status = '';

              if (order['status'] == 'pending') {
                status = 'A entregar';
              } else if (order['status'] == 'completed') {
                status = 'Entregue';
              }

              return Card(
                  child: ListTile(
                      title: Text('Pedido ${order['id']}'),
                      subtitle: Column(
                          crossAxisAlignment: CrossAxisAlignment.start,
                          children: [
                      Text('Endereço: ${order['address']}'),
                      Text('Total: ${order['total']}'),
                      Text('Status: $status'),
              Text('Data do pedido: ${DateFormat('dd/MM/yyyy HH:mm').format(DateTime.parse(order['createdAt'] as String))}'),
              ],
              ),
              ),
              );
            },
          );
        } else if (snapshot.hasError) {
          return Center(child: Text('Erro: ${snapshot.error}'));
        } else {
          return const Center(child: CircularProgressIndicator());
        }
      },
    );
  }
}

