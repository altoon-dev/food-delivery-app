//import 'package:food_delivery/constants/app_constants.dart';

import 'app_constants.dart';
class FetchImage {
  static String get(String url) {
    return AppConstants.BASE_URL + AppConstants.UPLOAD_URL + url;
  }
}