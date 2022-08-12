import 'dart:convert';
import 'package:shared_preferences/shared_preferences.dart';

import '../../constants/app_constants.dart';
import '../../models/cart_models.dart';


class CartRepo {
  final SharedPreferences sharedPreferences;

  CartRepo({required this.sharedPreferences});

  List<String> cart = [];
  List<String> cartHistory=[];

  void addToCartList(List<CartModel> cartList) {
    sharedPreferences.remove(AppConstants.Cart_History_List);
    sharedPreferences.remove(AppConstants.Cart_List);
    var time = DateTime.now().toString();
    cart = [];

    //convert objects to string, cause sharedpreferences only accept string
    // cartList.forEach((element) {
    //   return cart.add(jsonEncode(element));
    // });
    cartList.forEach((element){
      element.time= time;
      return cart.add(jsonEncode(element));
    });

    sharedPreferences.setStringList(AppConstants.Cart_List, cart);
    //print(sharedPreferences.getStringList(AppConstants.Cart_List));
    //getCartList();
  }

  List<CartModel> getCartList(){
    List<String> carts=[];
    if(sharedPreferences.containsKey(AppConstants.Cart_List)){
      carts= sharedPreferences.getStringList(AppConstants.Cart_List)! ;
      print('inside cartlist '+ carts.toString());

    }
    List<CartModel> cartList = [];

    // carts.forEach((element) {
    //   cartList.add(CartModel.fromJson(jsonDecode(element)));
    // });
    carts.forEach((element)=>cartList.add(CartModel.fromJson(jsonDecode(element))));
    return cartList;
  }
  List<CartModel> getCartHistoryList(){
    if(sharedPreferences.containsKey(AppConstants.Cart_History_List)){
      cartHistory=[];
      cartHistory= sharedPreferences.getStringList(AppConstants.Cart_History_List)!;
    }
    List<CartModel> cartListHistory=[];
    cartHistory.forEach((element)=>cartListHistory.add(CartModel.fromJson(jsonDecode(element))));
    return cartListHistory;
  }

  void addToCartHistoryList(){
    if(sharedPreferences.containsKey(AppConstants.Cart_History_List)){
      cartHistory = sharedPreferences.getStringList(AppConstants.Cart_History_List)!;
    }
    for(int i=0; i<cart.length; i++){
      cartHistory.add(cart[i]);
    }
    removeCart();

    cart=[];
    sharedPreferences.setStringList(AppConstants.Cart_History_List, cartHistory);
    print("The length of history list is "+getCartHistoryList().length.toString());
    for(int j=0; j<getCartHistoryList().length; j++){
      print("The time for the order is "+getCartHistoryList()[j].time.toString());
    }
  }
  void removeCart(){
    sharedPreferences.remove(AppConstants.Cart_List);

  }
}