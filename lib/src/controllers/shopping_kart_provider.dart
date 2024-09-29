
import 'package:colonial/src/models/kart_item.dart';
import 'package:flutter/material.dart';

class ShoppingKartProvider extends ChangeNotifier {
  List<KartItem> _itens = [];

  List<KartItem> get itens => _itens;

  void addItem(KartItem kartItem) {
    _itens.add(kartItem);
    notifyListeners();
    print(_itens[0].name);
  }

  void removeItem(KartItem item) {
    _itens.remove(item);
    notifyListeners();
  }

  double get totalPrice {
    return _itens.fold(0, (sum, item) => sum + item.price);
  }
}