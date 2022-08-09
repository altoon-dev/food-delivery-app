import 'package:get/get.dart';


class Dimensions{
  // static double screenHeight = Get.context!.height;
  // static double screenWidth = Get.context!.height;
  // static double pageView = screenHeight/2.6;
  // static double height10 = screenHeight/84.4;
  // static double height20 = screenHeight/42.2;
  // static double height15 = screenHeight/56.27;
  // static double height30 = screenHeight/28.13;
  //
  //
  // //dynamic width padding and margin
  // static double width10 = screenHeight/84.4;
  // static double width20 = screenHeight/42.2;
  // static double width15 = screenHeight/56.27;
  // static double width30 = screenHeight/28.13;
  //
  //
  // static double font20 = screenHeight/42.2;
  //
  // static double radius20 = screenHeight/42.2;
  // static double raduius30 = screenHeight/28.13;
  //
  //
  //
  // static double pageViewContainer = screenHeight/3.84;
  // static double pageViewTextContainer = screenHeight/7.03;
  //
  //
  // static double popularFoodImgSize = screenHeight/1.97;

  static double screenHeight=Get.context!.height;
  static double screenWidth=Get.context!.width;
  static double pageViewContainer= screenHeight/3.11;
  static double pageViewTextContainer= screenHeight/5.70;
  static double pageView= screenHeight/2.14;
//dynamic height and margin
  static double height10=screenHeight/68.4;
  static double height20=screenHeight/34.2;
  static double height15=screenHeight/45.56;
  static double height30=screenHeight/22.78;
  static double height45=screenHeight/15.19;


//dynamic width and margin
  static double width10=screenHeight/68.4;
  static double width20=screenHeight/34.2;
  static double width15=screenHeight/45.56;
  static double width30=screenHeight/22.78;


  static double font16=screenHeight/42.68;
  static double font20=screenHeight/34.2;
  static double font26=screenHeight/26.27;


  static double radius20 = screenHeight/34.2;
  static double radius30 = screenHeight/22.78;
  static double radius15 = screenHeight/45.56;

  static double iconsize24= screenHeight/28.47;
  static double iconsize16= screenHeight/42.70;
  static double height(double size) {
    return screenHeight / (844 / size);
  }

  static double width(double size) {
    return screenWidth / (390 / size);
  }

  static double font(double size) {
    return screenHeight / (844.0 / size);
  }

  static double iconSize(double size) {
    return screenHeight / (844.0 / size);
  }

  static double radius(double size) {
    return screenHeight / (844 / size);
  }


  static double listViewImgSize= screenWidth/3.67;
  static double listViewTextContainer= screenWidth/4.23;

  static double popularFoodImgSize = screenHeight/1.97;

  static double bottomHeightBar= screenHeight/7.6;

  static double splashImg = screenHeight/3.38;


}