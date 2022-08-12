import 'package:get/get.dart';

import '../../constants/app_constants.dart';
import '../api/api_client.dart';

class PopularProductRepo extends GetxService {
  final APIClient apiClient;

  PopularProductRepo({required this.apiClient});

  Future<Response> getPopularProductList() async {
    return await apiClient.getData(AppConstants.POPULAR_PRODUCT_URI);
  }
}