import 'dart:convert';
import 'package:flutter/material.dart';
import 'package:http/http.dart' as http;

Future<void> newUserAPI(
    String name, String contact, String password, BuildContext context) async {
  final url = Uri.parse('http://10.0.2.2:3000/customers');

  final headers = {'Content-Type': 'application/json'};

  final body =
      jsonEncode({'name': name, 'contact': contact, 'password': password});

  final response = await http.post(url, headers: headers, body: body);

  if (response.statusCode == 200) {
    print('Usuário Cadastrado!');
    showDialog(
        context: context,
        builder: (BuildContext context) {
          return AlertDialog(
            title: const Text('Sucesso'),
            content: const Text('Usuário Casdastrado'),
            actions: <Widget>[
              TextButton(
                onPressed: () {
                  Navigator.of(context).pop(); // Fecha o Dialog

                  Navigator.of(context).pop(); // Retorna a Tela de Login
                },
                child: const Text('OK'),
              ),
            ],
          );
        });
  } else if (response.statusCode == 400) {
    print('Erro 400: Bad Request');
    showDialog(
        context: context,
        builder: (BuildContext context) {
          return AlertDialog(
            title: const Text('Erro 400'),
            content: const Text(
                'Houve um erro de Requisição. Tente novamente mais tarde ou contate o suporte'),
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
    print('Não foi possivel se conectar ao servidor');

    showDialog(
        context: context,
        builder: (BuildContext context) {
          return AlertDialog(
            title: const Text('Erro'),
            content: const Text(
                'Não foi possivel se conectar ao servidor. Tente novamente mais tarde.'),
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
  }
}
