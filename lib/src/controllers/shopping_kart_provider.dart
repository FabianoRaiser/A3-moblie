import 'package:colonial/src/models/kart_item.dart';
import 'package:flutter/material.dart';

class ShoppingKartProvider extends ChangeNotifier {
  final List<KartItem> _itens = [];

  List<KartItem> get itens => _itens;

  void addItem(KartItem kartItem) {
    final index = _itens.indexWhere((item) => item.id == kartItem.id);

    if (index != -1) {
      updateQuantity(_itens[index].id, _itens[index].quantity + 1);
    } else {
      _itens.add(kartItem);
    }
    notifyListeners();
    print(_itens[0].name);
  }

  void removeItem(int itemID) {
    final itemToRemove = _itens.firstWhere((item) => item.id == itemID,
        // tenta encontrar o item
        orElse: () => KartItem(
            id: 0,
            name: "",
            price: 0,
            quantity: 0)); // se não retorna um item vazio
    _itens.remove(itemToRemove); // remove o item, mesmo se vazio
    notifyListeners();
  }

  void cleanCart() {
    _itens.clear();
    notifyListeners();
  }

  void updateQuantity(int itemID, int qtd) {
    final itemUpdateQtd = _itens.firstWhere((item) => item.id == itemID);
    itemUpdateQtd.quantity = qtd;
    print(itemUpdateQtd.quantity);
    notifyListeners();
  }

  double get totalPrice {
    return _itens.fold(0, (sum, item) => sum + (item.price * item.quantity));
  }

  int get itemCount {
    return _itens.fold(0, (sum, item) => sum + item.quantity);
  }
}
