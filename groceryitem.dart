import 'package:flutter/cupertino.dart';
import 'package:flutter/material.dart';

class cartmodel extends ChangeNotifier {
  final List _shopItems = [
    ["Avocado", "4.00", "lib/images/avocado.png", Colors.green],
    ["Banana", "2.50", "lib/images/banana.png", Colors.yellow],
    ["chicken", "5.00", "lib/images/chicken.png", Colors.brown],
    ["Water", "1.00", "lib/images/water.png", Colors.blue],
  ];
  List _cartItems=[];
  get shopItems => _shopItems;
  get cartItems => _cartItems;
  void addItemToCart(int index){
    _cartItems.add(_shopItems[index]);
    notifyListeners();}

  void removeItemFormCart(int index){
    _cartItems.removeAt(index);
    notifyListeners();}
  String calculateTotal(){
    double totalPrice=0;
    for (int i=0;i< _cartItems.length;i++) {
      totalPrice += double.parse(_cartItems[i][1]);
    }
    return totalPrice.toStringAsFixed(2);
  }

}

