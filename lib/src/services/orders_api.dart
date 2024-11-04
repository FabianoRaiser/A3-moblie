import 'dart:convert';

import 'package:colonial/src/models/product.dart';
import 'package:http/http.dart' as http;

Future<void> newOrder(int customerId, String customerAddress,
    List<OrderItem> products) async {
  final url = Uri.parse("http://10.0.2.2:3000/orders");

  final headers = {'Content-Type': 'application/json'};



  final body = jsonEncode({
    'address': customerAddress,
    'customerId': customerId,
    'products': products
  });

  print(body);

  final response = await http.post(url, headers: headers, body: body);
  
  if (response.statusCode == 201) {
    print('Sucesso');
  } else {
    print("deu erro");
  }
}
