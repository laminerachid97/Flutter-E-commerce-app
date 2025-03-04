import 'package:flutter/material.dart';

class CartProvider with ChangeNotifier {
  final List<Map<String, dynamic>> _cart = [];
  double _total = 0;

  List<Map<String, dynamic>> get cart => _cart;
  double get total => _total;

  void addToCart (Map<String, dynamic> product) {
    _cart.add(product);
    cartTotal();
    // notifyListeners();
  }

  void removeFromCart (Map<String, dynamic> product) {
    _cart.remove(product);
    cartTotal();
    // notifyListeners();
  }

  void cartTotal () {
    _total = 0;
    for (var product in _cart) {
      if(product.containsKey("total") && product['total'] is num){
        _total += product["total"];
      }
      print(product["total"]);
    }
    print(total);
    notifyListeners();
  }
}