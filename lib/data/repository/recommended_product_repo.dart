import 'package:flutter_online_shop/utils/app_constans.dart';
import 'package:get/get_connect/http/src/response/response.dart';
import 'package:get/get_state_manager/get_state_manager.dart';

import '../api/api_client.dart';

class RecommendedProductRepo extends GetxService {
  final ApiClient apiclient;
  RecommendedProductRepo({required this.apiclient});

  Future<Response> getRecommendedProductList() async {
    return await apiclient.getData(AppConstans.Popular_Product_reccomended);
  }
}
