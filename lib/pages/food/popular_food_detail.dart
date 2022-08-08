import 'package:flutter/material.dart';
import 'package:food_delivery/constants/app_constants.dart';
import 'package:food_delivery/constants/color_constants.dart';
import 'package:food_delivery/controllers/cart_controller.dart';
import 'package:food_delivery/controllers/popular_product_controller.dart';
import 'package:food_delivery/pages/cart/cart_page.dart';
import 'package:food_delivery/pages/home/main_food_page.dart';
import 'package:food_delivery/widgets/app_column.dart';
import 'package:food_delivery/widgets/app_icon.dart';
import 'package:food_delivery/widgets/big_text.dart';
import '../../dimensions.dart';
import '../../routes/route_helper.dart';
import '../../widgets/ExpandableText.dart';
import 'package:get/get.dart';



class PopularFoodDetail extends StatelessWidget {
  final int pageId;
  final String page;
  const PopularFoodDetail({
    Key? key,
    required this.page,
    required this.pageId
  }) : super(key: key);
  @override
  Widget build(BuildContext context) {
    var product = Get.find<PopularProductController>().popularProductList[pageId];
    Get.find<PopularProductController>().initProduct(product,Get.find<CartController>());
    return Scaffold(
      backgroundColor: Colors.white,
      body: Stack(
        children: [
          // Background image
          Positioned(
            left: 0,
            right: 0,
            child: Container(
              width: double.maxFinite,
              height: 350,
              decoration:  BoxDecoration(
                  image: DecorationImage(
                    fit: BoxFit.cover,
                    image: NetworkImage(
                      AppConstants.BASE_URL+AppConstants.UPLOADS_URL+product.img!,
                    ),
                  ),
              ),
            ),
          ),
          // Top icons
          Positioned(
            top: Dimensions.height45,
            left: Dimensions.width20,
            right: Dimensions.width20,
            child: Row(
              mainAxisAlignment: MainAxisAlignment.spaceBetween,
              children:   [
                GestureDetector(
                  onTap: (){
                    if(page=="cartpage"){
                      Get.toNamed(RouteHelper.getCartPage());
                    }else{
                      Get.toNamed(RouteHelper.getInitial());
                    }},
                    child: AppIcon(icon: Icons.arrow_back_ios)),
                GetBuilder<PopularProductController>(builder: (controller){
                  return GestureDetector(
                    onTap: (){
                      if(controller.totalItems>=1)
                        Get.toNamed(RouteHelper.getCartPage());
                    },
                    child: Stack(
                      children: [
                        AppIcon(icon: Icons.shopping_cart_outlined),
                        controller.totalItems>=1?
                            Positioned(
                              right:0, top:0,
                                child: AppIcon(icon: Icons.circle, size: 20,
                                  iconColor: Colors.transparent,
                                  backgroundColor: ConstantColor.mainColor ,),
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
          ),
          // Introduction of food | Expandable text
          Positioned(
            left: 0,
            right: 0,
            bottom: 0,
            top: Dimensions.height(350 - 20),
            child: Container(
              padding: EdgeInsets.only(left: Dimensions.width(20), right: Dimensions.width(20), top: Dimensions.height(20)),
              decoration: BoxDecoration(
                borderRadius: BorderRadius.only(
                  topLeft: Radius.circular(Dimensions.radius(20)),
                  topRight: Radius.circular(Dimensions.radius(20)),
                ),
                color: Colors.white,
              ),
              child: Column(
                crossAxisAlignment: CrossAxisAlignment.start,
                children: [
                    AppColumn(text: product.name!),
                  SizedBox(height: Dimensions.height(20),),
                   BigText(text: "Introduce"),
                  SizedBox(height: Dimensions.height(20),),
                  Expanded(
                    child: SingleChildScrollView(
                      child: ExpandableText(text: product.description!),
                    ),
                  ),
                  SizedBox(height: Dimensions.height(20),),
                ],
              ),
            ),
          ),
        ],
      ),
      bottomNavigationBar: GetBuilder<PopularProductController>(builder: (popularProduct){
        return Container(
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
                child: Row(
                  children: [
                    GestureDetector(
                        onTap: (){
                          popularProduct.setQuantity(false);
                          },
                        child: Icon(Icons.remove, color: ConstantColor.mainColor,)),
                    SizedBox(width: Dimensions.height(10) / 2,),
                    BigText(text: popularProduct.inCartItems .toString()),
                    SizedBox(width: Dimensions.height(10) / 2,),
                    GestureDetector(
                        onTap:(){
                          popularProduct.setQuantity(true);
                        } ,
                        child: Icon(Icons.add, color: ConstantColor.mainColor,)),
                  ],
                ),
              ),
              GestureDetector(
                onTap: (){
                  popularProduct.addItem(product);
                },
                child: Container(
                  padding: EdgeInsets.only(top: Dimensions.height(10), bottom: Dimensions.height(10), left: Dimensions.width(10), right: Dimensions.width(10),
                  ),
                    child: BigText(
                      text: "\$ ${product.price!} | Add to cart", color: Colors.white,),
                  decoration: BoxDecoration(color: ConstantColor.mainColor,
                    borderRadius: BorderRadius.circular(Dimensions.radius(20)),
                  ),
                ),
              ),
            ],
          ),
        );
      },
      ),
    );
  }
}