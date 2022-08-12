import 'package:flutter/material.dart';
import 'package:food_delivery_app/constants/color_constants.dart';
import 'package:food_delivery_app/controllers/cart_controller.dart';
import 'package:food_delivery_app/dimensions.dart';
import 'package:food_delivery_app/widgets/app_icon.dart';
import 'package:food_delivery_app/widgets/big_text.dart';
import 'package:get/get.dart';

class CartHistory extends StatelessWidget {
  const CartHistory({Key? key}) : super(key: key);

  @override
  Widget build(BuildContext context) {
    var getCartHistoryList = Get.find<CartController>().getCartHistoryList();
    Map<String,int> cartItemsPerOrder = Map();
    for(int i=0; i<getCartHistoryList.length; i++){
      if(cartItemsPerOrder.containsKey(getCartHistoryList[i].time)){
        cartItemsPerOrder.update(getCartHistoryList[i].time!, (value) =>++value);
      }else{
        cartItemsPerOrder.putIfAbsent(getCartHistoryList[i].time!, () => 1);
    }
    }
    List<int> cartOrderTimeToList(){
      return cartItemsPerOrder.entries.map((e) => e.value).toList();
    }
    List<int> itemsPerOrder = cartOrderTimeToList();

    var listCounter =0;
    return Scaffold(
      body: Column(
        children: [
          Container(
              height: 100,
              color: AppColors.mainColor,
              width: double.maxFinite,
              padding: EdgeInsets.only(top: 45),
              child: Row(
                mainAxisAlignment: MainAxisAlignment.spaceAround,
                children: [
                  BigText(text: "Cart History", color: Colors.white,),
                  AppIcon(icon: Icons.shopping_cart_outlined,
                    iconColor: AppColors.mainColor,
                  backgroundColor: AppColors.yellowColor,)
                ],
              ),
            ),
        Expanded(
            child: Container(
              margin: EdgeInsets.only(
                top: Dimensions.height(20),
                left: Dimensions.width(20),
                right: Dimensions.width(20),
              ),
              child: ListView(
                children: [
                  for(int i=0; i<itemsPerOrder.length; i++)
                    Container(
                      margin: EdgeInsets.only(
                        bottom: Dimensions.height(20),
                      ),
                      child: Column(
                        crossAxisAlignment: CrossAxisAlignment.start,
                        children: [
                          BigText(text: "fdbf"),
                          Row(
                            children: [
                              Wrap(
                                direction: Axis.horizontal,
                                children: [
                                  Text("hi there"),
                                ],
                              )
                            ],
                          )
                        ],
                      ),
                    )
                ],
              ),
            ),
        ),],
      ),
    );
  }
}
