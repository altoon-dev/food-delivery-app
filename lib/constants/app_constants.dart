import 'package:flutter/material.dart';

class AppConstants {
  static const String APP_NAME = "OrderFood";
  static const int APP_VERSION = 1;

  static const String BASE_URL = "http://mvs.bslmeiyu.com";

  // static const String BASE_URL = "127.0.0.1:3000/";
  static const String POPULAR_PRODUCT_URI = "/api/v1/products/popular";
  static const String RECOMMENDED_PRODUCT_URI = "/api/v1/products/recommended";

  static const String UPLOADS_URL ="/uploads/";


  static const String REGISTER_URL = "register";
  static const String LOGIN_URL = "login";
  static const String LOGOUT_URL = "users/logout";
  static const String FETCH_USER_URL = "users/me";

  static const String TOKEN = "token";
  static const String CART_LIST = "cartList";
  static const String CART_HISTORY = "cartHistoryList";

  //user Details constant
  static const String ID = "id";
  static const String NAME = "name";
  static const String USERNAME = "username";
  static const String EMAIL = "email";
  static const String PHONE = "phone";
}