import 'package:flutter/material.dart';
import 'package:food_delivery/constants/color_constants.dart';
import 'package:food_delivery/controllers/cart_controller.dart';
import 'package:food_delivery/data/repository/popular_product_repo.dart';
import 'package:food_delivery/models/product_models.dart';
import 'package:get/get.dart';

class PopularProductController extends GetxController {
  final PopularProductRepo popularProductRepo;
  PopularProductController({required this.popularProductRepo});
  List<dynamic> _popularProductList = [];
  List<dynamic> get popularProductList => _popularProductList;
  late CartController _cart;


  bool _isLoaded = false;
  bool get isLoaded => _isLoaded;

  int _quantity=0;
  int get quantity {
    return _quantity;
}
  int _inCartItems=0;
  int get inCartItems=>_inCartItems+_quantity;


  Future<void> getPopularProductList() async {
    Response response = await popularProductRepo.getPopularProductList();

    if (response.statusCode == 200) {
      _popularProductList = [];
      _popularProductList.addAll(Product.fromJson(response.body).products);
      _isLoaded = true;
      update();
    } else {

    }
  }
  void setQuantity(bool isIncrement){
    if(isIncrement){
      _quantity= checkQuantity(_quantity+1);
    }else{
      _quantity= checkQuantity(_quantity-1);

    }
    update();
  }
  int checkQuantity(int quantity){
    if((inCartItems+quantity)<0){
      Get.snackbar("Item count", "You can't reduce more!",
      backgroundColor: ConstantColor.mainColor,
      colorText: Colors.white);
      return 0;
    }else if((inCartItems+quantity)>20){
      Get.snackbar("Item count", "You can't get more!",
          backgroundColor: ConstantColor.mainColor,
          colorText: Colors.white);
      return 20;
    }else{
      return quantity;
    }
  }

  void initProduct(ProductModel product, CartController cart){
    _quantity = 0;
    _inCartItems=0;
    _cart = cart;
    var exist=false;
    exist= _cart.existInCart(product);
    if(exist){
      _inCartItems=_cart.getQuantity(product);
    }


    //if exist
    //get from storage  _inCartItems=3

  }

  void addItem(ProductModel product){
    //if(quantity>0){
      _cart.addItem(product, _quantity);
      _quantity=0;
      _inCartItems=_cart.getQuantity(product);
      _cart.items.forEach((key, value) {
        print("The key is "+value.id.toString()+" The quantity is "+value.quantity.toString());
      });
    }

  int get totalItems{
    return _cart.totalItems;
  }


    }