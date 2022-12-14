
import 'package:food_delivery_app/pages/food/popular_food_detail.dart';
import 'package:food_delivery_app/pages/food/recommended_food_detail.dart';
import 'package:food_delivery_app/pages/splash/splash_dart.dart';
import 'package:get/get.dart';
import '../pages/cart/cart_page.dart';
import '../pages/home/home_page.dart';

class RouteHelper {
  static const String initial = "/";
  static const String popularFood = "/popular-food";
  static const String recommendedFood = "/recommended-food";
  static const String cartPage = "/cart-page";
  static const String splashPage = "/splash-page";

  static String getInitial() => initial;
  static String getPopularFood(int pageId, String page) => "$popularFood?pageId=$pageId&page=$page";
  static String getRecommendedFood(int pageId, String page) => "$recommendedFood?pageId=$pageId&page=$page";
  static String getCartPage() => cartPage;
  static String getSplashPage() => splashPage;

  static List<GetPage> routes = [
    GetPage(name: initial, page: () => const HomePage(),),
    GetPage(
      name: popularFood,
      page: () {
        var pageId = Get.parameters['pageId'];
        var page = Get.parameters['page'];
        return PopularFoodDetail(pageId: int.parse(pageId!), page: page!);
      },
    ),
    GetPage(
      name: recommendedFood,
      page: () {
        var pageId = Get.parameters['pageId'];
        var page = Get.parameters['page'];
        return RecommendedFoodDetail(pageId: int.parse(pageId!), page: page!);
      },
    ),
    GetPage(
      name: cartPage,
      transition: Transition.fadeIn,
      page: () {
        return const CartPage();
      },),
    GetPage(
      name: splashPage,
      transition: Transition.fadeIn,
      page: () {
        return const SplashScreen();
      },),

  ];
}