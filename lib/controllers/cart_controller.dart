import 'package:flutter/material.dart';
import 'package:food_delivery/constants/color_constants.dart';
import 'package:food_delivery/models/product_models.dart';
import 'package:get/get.dart';

import '../data/repository/cart_repo.dart';
import '../models/cart_models.dart';

//List<CartModel> storageItems=[];


class CartController extends GetxController {
  final CartRepo cartRepo;
  CartController({required this.cartRepo});
  Map<int, CartModel>_items = {};
  Map<int, CartModel> get items => _items;
  //0, 1, 2..


  void addItem(ProductModel product, int quantity) {
    int totalQuantity = 0;
    if (_items.containsKey(product.id!)) {
      _items.update(product.id!, (value) {
        totalQuantity = value.quantity! + quantity;
        return CartModel(
          id: product.id,
          name: value.name,
          price: value.price,
          img: value.img,
          quantity: value.quantity! + quantity,
          isExist: true,
          time: DateTime.now().toString(),
          product: product,
        );
      });
      if (totalQuantity == 0) {
        _items.remove(product.id);
      }
    } else {
      if (quantity > 0) {
        _items.putIfAbsent(product.id!, () {
          print('item is added' + product.id.toString() + ' ' +
              quantity.toString());
          return CartModel(
            id: product.id,
            name: product.name,
            price: product.price,
            img: product.img,
            quantity: quantity,
            isExist: true,
            time: DateTime.now().toString(),
            product: product,
          );
        });
      } else {
        Get.snackbar("Item count", "You should more than 0 ",
          backgroundColor: ConstantColor.mainColor,
          colorText: Colors.white,
        );
      }
    }

    // cartRepo.addToCart(getCartItems);
     update();
  }

  bool existInCart(ProductModel product) {
    if (_items.containsKey(product.id)) {
      return true;
    } else {
      return false;
    }
  }

  int getQuantity(ProductModel product) {
    int quantity = 0;
    if (_items.containsKey(product.id)) {
      _items.forEach((key, value) {
        if (key == product.id) {
          quantity = value.quantity!;
        }
      });
    }
    return quantity;
  }

  int get totalItems {
    int totalQuantity = 0;
    _items.forEach((key, value) {
      totalQuantity += value.quantity!;
    });
    return totalQuantity;
  }

  List<CartModel> get getItems{
    //e below refers to both  int and CartModel
    //get need to return something, now it's List
    return _items.entries.map((e){
      //second return is for map
    return  e.value;

    }).toList();
  }
}