import 'package:flutter/cupertino.dart';
import 'package:flutter/material.dart';
import 'package:food_delivery/constants/app_constants.dart';
import 'package:food_delivery/constants/color_constants.dart';
import 'package:food_delivery/controllers/cart_controller.dart';
import 'package:food_delivery/dimensions.dart';
import 'package:food_delivery/routes/route_helper.dart';
import 'package:food_delivery/widgets/app_icon.dart';
import 'package:food_delivery/widgets/big_text.dart';
import 'package:food_delivery/widgets/small_text.dart';
import 'package:get/get.dart';

import '../home/main_food_page.dart';


class CartPage extends StatelessWidget {
  const CartPage({Key? key}) : super(key: key);

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      body: Stack(
        children: [
          Positioned(
              top: Dimensions.height20*2,
              left: Dimensions.width20,
              right: Dimensions.width20,
              child: Row(
                mainAxisAlignment: MainAxisAlignment.spaceBetween,
                children: [
                  AppIcon(icon: Icons.arrow_back_ios,
                  iconColor: Colors.white,
                  backgroundColor: ConstantColor.mainColor,
                  iconSize: Dimensions.iconsize24,),
                  SizedBox(width: Dimensions.width20*5,),
                  GestureDetector(
                    onTap: (){
                      Get.toNamed(RouteHelper.getInitial());
                    },
                    child: AppIcon(icon: Icons.home_outlined,
                      iconColor: Colors.white,
                      backgroundColor: ConstantColor.mainColor,
                      iconSize: Dimensions.iconsize24,),
                  ),
                  AppIcon(icon: Icons.shopping_cart_outlined,
                    iconColor: Colors.white,
                    backgroundColor: ConstantColor.mainColor,
                    iconSize: Dimensions.iconsize24,),
                ],
          )),
          Positioned(
              top: Dimensions.height20*4,
              left: Dimensions.width20,
              right: Dimensions.width20,
              bottom: 0,
              child: Container(
                margin: EdgeInsets.only(top: Dimensions.height10),
                //color: Colors.red,
                child: MediaQuery.removePadding(
                  context: context,
                  removeTop: true,
                  child: GetBuilder<CartController>(builder: (CartController){
                    var _cartList=CartController.getItems;
                    return ListView.builder(
                        itemCount: _cartList.length,
                        itemBuilder: (_,index){
                          return Container(
                            height: Dimensions.height20*5,
                            width: double.maxFinite,
                            child: Row(
                              children: [
                                Container(
                                  margin: EdgeInsets.only(bottom: Dimensions.height10),
                                  width: Dimensions.height20*5,
                                  height: Dimensions.height20*5,
                                  decoration: BoxDecoration(
                                      borderRadius: BorderRadius.circular(Dimensions.radius20),
                                      color: Colors.white,
                                      image: DecorationImage(
                                          fit: BoxFit.cover,
                                          image: NetworkImage(
                                            AppConstants.BASE_URL+AppConstants.UPLOADS_URL+CartController.getItems[index].img!
                                          ),
                                      ),
                                  ),
                                ),
                                SizedBox(width: Dimensions.width10,),
                                Expanded(child: Container(
                                  height: Dimensions.height20*5,
                                  child: Column(
                                    crossAxisAlignment: CrossAxisAlignment.start,
                                    mainAxisAlignment: MainAxisAlignment.spaceEvenly,
                                    children: [
                                      BigText(text: CartController.getItems[index].name!,color: Colors.black54,),
                                      SmallText(text: 'Spicy',),
                                      Row(
                                        mainAxisAlignment: MainAxisAlignment.spaceBetween,
                                        children: [
                                          BigText(text: CartController.getItems[index].price!.toString(),color: Colors.redAccent,),
                                          Container(
                                            padding: EdgeInsets.only(
                                              top: Dimensions.height(10),
                                              bottom: Dimensions.height(10),
                                              left: Dimensions.width(10),
                                              right: Dimensions.width(10),
                                            ),
                                            decoration: BoxDecoration(
                                              color: Colors.white,
                                              borderRadius: BorderRadius.circular(Dimensions.radius(20)),
                                            ),
                                            child: Row(
                                              children: [
                                                GestureDetector(
                                                    onTap: (){
                                                      CartController.addItem(_cartList[index].product!,-1);
                                                    },
                                                    child: Icon(Icons.remove, color: ConstantColor.mainColor,)),
                                                SizedBox(width: Dimensions.height(10) / 2,),
                                                BigText(text:_cartList[index].quantity.toString()), //popularProduct.inCartItems .toString()),
                                                SizedBox(width: Dimensions.height(10) / 2,),
                                                GestureDetector(
                                                    onTap:(){
                                                      CartController.addItem(_cartList[index].product!, 1);

                                                    } ,
                                                    child: Icon(Icons.add, color: ConstantColor.mainColor,)),
                                              ],
                                            ),
                                          ),

                                        ],
                                      )

                                    ],
                                  ),
                                ))
                              ],
                            ),
                          );
                        }
                        );
                  })
                ),
              ),
          ),
        ],
      ),
    );
  }
}
