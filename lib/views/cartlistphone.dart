import 'package:flutter/material.dart';

class CartList {
  List<Map> myCartList;

  void addtocart(item) {
    myCartList.add(item);
    print(myCartList);
    // SharedPreferences sharedPreferences = await SharedPreferences.getInstance();
    // sharedPreferences.setString("cart",jsonEncode(cart));
    // print(sharedPreferences.getString("cart"));

 
    
  }
  void removefromcart(item) {
    print("remove");
    myCartList.remove(item);
    // SharedPreferences sharedPreferences = await SharedPreferences.getInstance();
    // sharedPreferences.setString("cart",jsonEncode(cart));
    // print(jsonDecode(sharedPreferences.getString("cart")));
    // print(cart);
  }
}