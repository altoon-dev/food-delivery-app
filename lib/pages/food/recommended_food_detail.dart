import 'package:food_delivery/constants/app_constants.dart';
import 'package:food_delivery/controllers/popular_product_controller.dart';
import 'package:food_delivery/controllers/recommended_product_controller.dart';
import 'package:food_delivery/pages/cart/cart_page.dart';
import 'package:food_delivery/routes/route_helper.dart';
import 'package:get/get.dart';
import 'package:flutter/material.dart';
import 'package:food_delivery/constants/color_constants.dart';
import 'package:food_delivery/dimensions.dart';
import 'package:food_delivery/widgets/ExpandableText.dart';
import 'package:food_delivery/widgets/app_icon.dart';
import 'package:food_delivery/widgets/big_text.dart';

import '../../controllers/cart_controller.dart';

class RecommendedFoodDetail extends StatelessWidget {
 final  int pageId;
   const RecommendedFoodDetail({Key? key,
  required this.pageId}) : super(key: key);



  @override
  Widget build(BuildContext context) {
    var product = Get.find<RecommendedProductController>().recommendedProductList[pageId];
    Get.find<PopularProductController>().initProduct(product,Get.find<CartController>());
    return Scaffold(
      backgroundColor: Colors.white,
      body: CustomScrollView(
        slivers: [
          SliverAppBar(
            automaticallyImplyLeading: false,
            toolbarHeight: 70,
            title: Row(
              mainAxisAlignment: MainAxisAlignment.spaceBetween,
              children: [
                GestureDetector(
                    onTap:(){
                      Get.toNamed(RouteHelper.getInitial());
                    },
                    child: AppIcon(icon: Icons.clear)),
                //AppIcon(icon: Icons.shopping_cart_outlined),
                GetBuilder<PopularProductController>(builder: (controller){
                  return GestureDetector(
                    onTap: (){
                        if(controller.totalItems>=1)
                          Get.toNamed(RouteHelper.getCartPage());
                    },
                    child: Stack(
                      children: [
                        AppIcon(icon: Icons.shopping_cart_outlined,),
                        Get.find<PopularProductController>().totalItems>=1?
                        Positioned(
                          right:0, top:0,
                            child: AppIcon(icon: Icons.circle, size: 20,
                              iconColor: Colors.transparent,
                              backgroundColor: ConstantColor.mainColor ,)
                          ):Container(),
                        Get.find<PopularProductController>().totalItems>=1?
                        Positioned(
                            right:3, top:3,
                            child: BigText(text: Get.find<PopularProductController>().totalItems.toString(),
                              size: 12,color: Colors.white,)
                        ):Container(),
                      ],
                    ),
                  );
                },),
              ],
            ),
            bottom: PreferredSize(
              preferredSize: const Size.fromHeight(20),
              child: Container(
                width: double.maxFinite,
                padding: const EdgeInsets.only(top: 5,bottom: 10),
                child: Center(child: BigText(size: Dimensions.font26,text: product.name!)),
                decoration: BoxDecoration(
                    color: Colors.white,
                    borderRadius: BorderRadius.only(
                    topLeft: Radius.circular(Dimensions.radius20),
                    topRight: Radius.circular(Dimensions.radius20),
                  ),
                ),
              ),

            ),
            pinned: true,
            backgroundColor: Colors.yellowAccent,
            expandedHeight: 250,
            flexibleSpace: FlexibleSpaceBar(
              background: Image.network(
                AppConstants.BASE_URL+AppConstants.UPLOADS_URL+product.img!,
                width: double.maxFinite,
                fit: BoxFit.cover,
                ),
            ),
          ),
          SliverToBoxAdapter(
            child: Column(
              children: [
                Container(
                  child: ExpandableText(text: product.description!),
                  margin: EdgeInsets.only(left: Dimensions.width20,right: Dimensions.width20),
                )
              ],
            ),
          )
        ],
      ),
      bottomNavigationBar: GetBuilder<PopularProductController>(builder: (controller){
        return Column(
          mainAxisSize: MainAxisSize.min,
          children: [
            Container(
              padding: EdgeInsets.only(
                left: Dimensions.width20*2.5,
                right: Dimensions.width20*2.5,
                top: Dimensions.height10,
                bottom: Dimensions.height10,
              ),
              child: Row(
                mainAxisAlignment: MainAxisAlignment.spaceBetween,
                children: [
                  GestureDetector(
                    onTap: (){
                      controller.setQuantity(false);
                    },
                    child: AppIcon(
                      iconColor: Colors.white,
                      icon: Icons.remove,
                      backgroundColor: ConstantColor.mainColor,
                      iconSize: Dimensions.iconsize24,
                    ),
                  ),
                  BigText(text: "\$ ${product.price!}  X ${controller.inCartItems}",color: ConstantColor.blackColor,size: Dimensions.font26,),
                  GestureDetector(
                    onTap: (){
                      controller.setQuantity(true);
                    },
                    child: AppIcon(
                      iconColor: Colors.white,
                      icon: Icons.add,
                      backgroundColor: ConstantColor.mainColor,
                      iconSize: Dimensions.iconsize24,
                    ),
                  ),
                ],
              ),
            ),
            Container(
              height: Dimensions.height(120),
              padding: EdgeInsets.only(
                top: Dimensions.height(30),
                bottom: Dimensions.height(30),
                left: Dimensions.width(20),
                right: Dimensions.width(20),
              ),
              decoration: BoxDecoration(
                color: Colors.black12,
                borderRadius: BorderRadius.only(
                  topRight: Radius.circular(Dimensions.radius(30)),
                  topLeft: Radius.circular(Dimensions.radius(30)),
                ),
              ),
              child: Row(
                mainAxisAlignment: MainAxisAlignment.spaceBetween,
                children: [
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
                    child: Icon(
                      Icons.favorite,
                      color: ConstantColor.mainColor,
                    ),
                  ),
                  GestureDetector(
                    onTap: (){
                      controller.addItem(product);
                    },
                    child: Container(
                      padding: EdgeInsets.only(
                        top: Dimensions.height(10),
                        bottom: Dimensions.height(10),
                        left: Dimensions.width(10),
                        right: Dimensions.width(10),
                      ),
                      decoration: BoxDecoration(
                        color: ConstantColor.mainColor,
                        borderRadius: BorderRadius.circular(Dimensions.radius(20)),
                      ),
                      child: BigText(
                        text: "\$ ${product.price!} | Add to cart",
                        color: Colors.white,
                      ),
                    ),
                  ),
                ],
              ),
            ),
          ],
        );
        },
      ),
    );
  }
}
