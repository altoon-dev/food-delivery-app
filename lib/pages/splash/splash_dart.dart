import 'dart:async';
import 'package:flutter/cupertino.dart';
import 'package:flutter/material.dart';
import 'package:food_delivery_app/routes/route_helper.dart';
import 'package:get/get.dart';
import '../../controllers/popular_product_controller.dart';
import '../../controllers/recommended_product_controller.dart';
import '../../dimensions.dart';
import 'dart:async';

class SplashScreen extends StatefulWidget {
  const SplashScreen({Key? key}) : super(key: key);

  @override
  State<SplashScreen> createState() => _SplashScreenState();
}

class _SplashScreenState extends State<SplashScreen> with TickerProviderStateMixin {
  late Animation<double> _animation;
  late AnimationController _controller;

  Future<void> _loadResource() async {
    await Get.find<PopularProductController>().getPopularProductList();
    await Get.find<RecommendedProductController>().getRecommendedProductList();
  }

  @override
  void initState() {
    super.initState();

    _loadResource();

    _controller = AnimationController(vsync: this, duration: const Duration(seconds: 2))..forward();
    _animation = CurvedAnimation(parent: _controller, curve: Curves.linear);

    Timer(const Duration(seconds: 3), () => Get.offNamed(RouteHelper.getInitial()),);
  }

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      backgroundColor: Colors.white,
      body: Column(
        mainAxisAlignment: MainAxisAlignment.center,
        children: [
          ScaleTransition(
            scale: _animation,
            child: Center(
              child: Image.asset(
                width: Dimensions.height(250),
                "images/logo part 1.png",
              ),
            ),
          ),
          Center(
            child: Image.asset(
              width: Dimensions.height(250),
              "images/logo part 2.png",
            ),
          ),
        ],
      ),
    );
  }
}
