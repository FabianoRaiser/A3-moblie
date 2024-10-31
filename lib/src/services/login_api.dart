import 'dart:convert';

import 'package:colonial/main.dart';
import 'package:colonial/src/controllers/user_provider.dart';
import 'package:colonial/src/models/user.dart';
import 'package:flutter/cupertino.dart';
import 'package:flutter/material.dart';
import 'package:http/http.dart' as http;
import 'package:provider/provider.dart';

Future<void> loginAPI(String contact, String password,
    BuildContext context) async {
  final url = Uri.parse("http://10.0.2.2:3000/customer/login");

  final headers = {'Content-Type': 'application/json'};

  final body = jsonEncode({'contact': contact, 'password': password});

  final response = await http.post(url, headers: headers, body: body);

  if (response.statusCode == 200) {
    print(response.body);

    final Map<String, dynamic> dataCustomer = jsonDecode(response.body);

    final user = User(
        id: dataCustomer['customer']['id'],
        name: dataCustomer['customer']['name'],
        contact: dataCustomer['customer']['contact']);

    Provider.of<UserProvider>(context, listen: false).setUser(user);

    Navigator.pushReplacement(
      context, MaterialPageRoute(builder: (context) => const HomePage()),);
  } else if (response.statusCode == 401) {
    print('Usuário ou senha incorretos');

    showDialog(
        context: context,
        builder: (BuildContext context) {
          return AlertDialog(
            title: const Text('Erro de Login'),
            content: const Text('Usuário ou Senha inválidos'),
            actions: <Widget>[
              TextButton(
                onPressed: () {
                  Navigator.of(context).pop();
                },
                child: const Text('OK'),
              ),
            ],
          );
        });
  } else {
    showDialog(
        context: context,
        builder: (BuildContext context) {
          return AlertDialog(
            title: const Text('Erro de conexão'),
            content: const Text('Não foi possivel se conectar ao serviço. Tente novamente mais tarde.'),
            actions: <Widget>[
              TextButton(
                onPressed: () {
                  Navigator.of(context).pop();
                },
                child: const Text('OK'),
              ),
            ],
          );
        });

    throw Exception('Falha ao enviar os dados');


  }
}
