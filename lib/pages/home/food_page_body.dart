import 'package:flutter/material.dart';
import 'package:food_delivery/constants/app_constants.dart';
import 'package:food_delivery/constants/color_constants.dart';
import 'package:food_delivery/controllers/popular_product_controller.dart';
import 'package:food_delivery/controllers/recommended_product_controller.dart';
import 'package:food_delivery/dimensions.dart';
import 'package:food_delivery/models/product_models.dart';
import 'package:food_delivery/pages/food/popular_food_detail.dart';
import 'package:food_delivery/routes/route_helper.dart';
import 'package:food_delivery/widgets/app_column.dart';
import 'package:food_delivery/widgets/big_text.dart';
import 'package:food_delivery/widgets/icon_and_text.dart';
import 'package:food_delivery/widgets/small_text.dart';
import 'package:dots_indicator/dots_indicator.dart';
import 'package:get/get.dart';



class FoodPageBody extends StatefulWidget {
  const FoodPageBody({Key? key}) : super(key: key);

  @override
  State<FoodPageBody> createState() => _FoodPageBodyState();
}

class _FoodPageBodyState extends State<FoodPageBody> {
  PageController pageController = PageController(viewportFraction: 0.85);
  var _currPageValue = 0.0;
  final double _scaleFactor = 0.8;
  final double _height = Dimensions.pageViewContainer;

  @override
  void initState(){
    super.initState();
    pageController.addListener(() {
      setState((){
          _currPageValue = pageController.page!;
          //print('the value now is '+_currPageValue.toString()); to understand how it works
          });
    });
  }

  @override
  void dispose(){
    pageController.dispose();
    super.dispose();

  }

  @override
  Widget build(BuildContext context) {
    return Column(
      children: [
        //slider section
      GetBuilder<PopularProductController>(builder:(popularProducts){
        return popularProducts.isLoaded?Container(
          height: Dimensions.pageViewContainer,
            child: PageView.builder(
                controller: pageController,
                itemCount: popularProducts.popularProductList.length,
                itemBuilder: (context,position){
                  return _buildPageItem(position,popularProducts.popularProductList[position]);
                }),

        ):CircularProgressIndicator(
          color: ConstantColor.mainColor,
        );

      }),
    //dots
        GetBuilder<PopularProductController>(builder: (popularProducts) {
          print(popularProducts.popularProductList.length);
          return DotsIndicator(
            dotsCount: popularProducts.popularProductList.isNotEmpty
                ? popularProducts.popularProductList.length
                : 6,
            position: _currPageValue,
            decorator: DotsDecorator(
              activeColor: ConstantColor.mainColor,
              size: const Size.square(9.0),
              activeSize: const Size(18.0, 9.0),
              activeShape: RoundedRectangleBorder(
                  borderRadius: BorderRadius.circular(5.0)),
            ),
          );
        }),
        //popular text
        SizedBox(height: Dimensions.height30,),
        Container(
          margin: EdgeInsets.only(left: Dimensions.width30),
          child: Row(
            crossAxisAlignment: CrossAxisAlignment.end,
            children: [
              BigText(text: 'Recommended'),
              SizedBox(width: Dimensions.width10,),
              Container(
                margin: const EdgeInsets.only(bottom: 2),
                child: BigText(text: '.', color: Colors.black26,),
              ),
              SizedBox(width: Dimensions.width10,),
              Container(
                child: SmallText(text: 'Food Pairing', color: ConstantColor.textColor,),
              ),

            ],
          ),
        ),
        //recommended food
        //list of food and images
           GetBuilder<RecommendedProductController>(builder:(recommendedProduct){
             return recommendedProduct.isLoaded?ListView.builder(
                 physics: const NeverScrollableScrollPhysics(),
                 shrinkWrap: true,
                 itemCount: recommendedProduct.recommendedProductList.length,
                 itemBuilder: (context, index){
                   return GestureDetector(
                     onTap: (){
                       Get.toNamed(RouteHelper.getRecommendedFood(index, "home"));
                     },
                     child: Container(
                       margin: const EdgeInsets.only(left: 20, right: 20, bottom: 10),
                       child: Row(
                         children: [
                           //image section
                           Container(
                             height:120,
                             width: 120,
                             decoration: BoxDecoration(
                               borderRadius: BorderRadius.circular(30),
                               color: Colors.white38,
                               image:  DecorationImage(
                                   fit: BoxFit.cover,
                                 image: NetworkImage(AppConstants.BASE_URL+AppConstants.UPLOADS_URL+recommendedProduct.recommendedProductList[index].img!
                                 ),
                               ),
                             ),
                           ),
                           //text container
                           Expanded(
                             child: Container(
                               height: 100,
                               decoration: const BoxDecoration(
                                   borderRadius: BorderRadius.only(
                                     topRight: Radius.circular(20),
                                     bottomRight: Radius.circular(20),
                                   ),
                                   color: Colors.white
                               ),
                               child: Padding(
                                 padding: const EdgeInsets.only(left: 10,right: 10,top: 10),
                                 child: Column(
                                   crossAxisAlignment: CrossAxisAlignment.start,
                                   children: [
                                     BigText(text: recommendedProduct.recommendedProductList[index].name!),
                                     SizedBox(height: Dimensions.height10,),
                                     SmallText(text: 'With Asian characteristics'),
                                     SizedBox(height: Dimensions.height10,),
                                     Row(
                                       mainAxisAlignment: MainAxisAlignment.spaceBetween,
                                       children: const [
                                         IconAndTextWidget(icon: Icons.circle_sharp,
                                             text: 'Normal',
                                             iconColor: ConstantColor.iconColor),
                                         IconAndTextWidget(icon: Icons.location_on,
                                             text: '1.7km',
                                             iconColor: ConstantColor.mainColor),
                                         IconAndTextWidget(icon: Icons.access_time_rounded ,
                                             text: '32min',
                                             iconColor: ConstantColor.appColor),
                                       ],
                                     ),

                                   ],
                                 ),
                               ),
                             ),
                           ),
                         ],
                       ),
                     ),
                   );
                 }):CircularProgressIndicator(
               color: ConstantColor.mainColor,
             );
           } )
      ],
    );
  }
  Widget _buildPageItem(int index,ProductModel popularProduct){
    Matrix4 matrix = Matrix4.identity();
    if(index == _currPageValue.floor()){
      var currScale = 1-(_currPageValue-index)*(1-_scaleFactor);
      var currTrans = _height*(1-currScale)/2;
      matrix = Matrix4.diagonal3Values(1, currScale, 1)..setTranslationRaw(0, currTrans, 0);//second value is Height

    }else if(index== _currPageValue.floor()+1){
      var currScale = 1+(_currPageValue-index+1)*(1-_scaleFactor);
      var currTrans = _height*(1-currScale)/2; //220*(1-0.8)/2=22
      matrix = Matrix4.diagonal3Values(1, currScale, 1);
      matrix = Matrix4.diagonal3Values(1, currScale, 1)..setTranslationRaw(0, currTrans, 0);//second value is Height

    }else if(index== _currPageValue.floor()-1){
      var currScale = 1-(_currPageValue-index)*(1-_scaleFactor);
      var currTrans = _height*(1-currScale)/2; //220*(1-0.8)/2=22
      matrix = Matrix4.diagonal3Values(1, currScale, 1);
      matrix = Matrix4.diagonal3Values(1, currScale, 1)..setTranslationRaw(0, currTrans, 0);//second value is Height

    }else{
      var currScale=0.8;
      matrix = Matrix4.diagonal3Values(1, currScale, 1)..setTranslationRaw(0, _height*(1-_scaleFactor)/2, 0);

    }

    return Transform(
      transform: matrix,
      child: Stack(
        children: [
          GestureDetector(
            onTap: (){
              Get.toNamed(RouteHelper.getPopularFood(index,"home"));
            },
            child: Container(
              height: Dimensions.pageViewContainer,
              margin: EdgeInsets.only(left: Dimensions.width10, right: Dimensions.width10),
              decoration: BoxDecoration(
                  borderRadius: BorderRadius.circular(Dimensions.radius30),
                  image:  DecorationImage(
                      fit: BoxFit.cover,
                      image: NetworkImage(AppConstants.BASE_URL+AppConstants.UPLOADS_URL+popularProduct.img!
                          ),
                  ),
              ),
            ),
          ),
          // AppConstants.BASE_URL+"/uploads/"+popularProduct.img!
          Align(
            alignment: Alignment.bottomCenter,
            child: Container(
              height: 120,
              margin: EdgeInsets.only(left: Dimensions.width30, right: Dimensions.width30, bottom:Dimensions.height30),
              decoration: BoxDecoration(
                  borderRadius: BorderRadius.circular(Dimensions.radius20),
                  color: Colors.white,
                  boxShadow:const [
                    BoxShadow(
                      color: Color(0xFFe8e8e8),
                      blurRadius: 5.0,
                      offset: Offset(0,5),//x axis is 0 no shadow, but in y axis there's for 5
                    ),
                    BoxShadow(
                      color: Colors.white,
                      offset: Offset(-5,0),
                    ),
                    BoxShadow(
                      color: Colors.white,
                      offset: Offset(5,0),
                    )
                  ]
              ),
              child: Container(
                padding: EdgeInsets.only(top: Dimensions.height15, left: 15, right: 15.0 ),
                child:  AppColumn(text: popularProduct.name!),
              ),
            ),
          ),
        ],
      ),
    );
  }
}