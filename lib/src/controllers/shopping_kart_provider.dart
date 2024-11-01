import 'package:colonial/src/models/kart_item.dart';
import 'package:flutter/material.dart';

class ShoppingKartProvider extends ChangeNotifier {
  final List<KartItem> _itens = [];

  List<KartItem> get itens => _itens;

  void addItem(KartItem kartItem) {
    _itens.add(kartItem);
    notifyListeners();
    print(_itens[0].name);
  }

  void removeItem(int itemID) {
    final itemToRemove = _itens.firstWhere((item) => item.id == itemID, // tenta encontrar o item
        orElse: () => KartItem(id: 0, name: "", price: 0, quantity: 0)); // se não retorna um item vazio
    _itens.remove(itemToRemove); // remove o item, mesmo se vazio
    notifyListeners();
  }

  void updateQuantity(int itemID, int qtd){
    final itemUpdateQtd = _itens.firstWhere((item) => item.id == itemID);
    itemUpdateQtd.quantity = qtd;
    print(itemUpdateQtd.quantity);
    notifyListeners();
  }

  double get totalPrice {
    return _itens.fold(0, (sum, item) => sum + item.price);
  }
}
