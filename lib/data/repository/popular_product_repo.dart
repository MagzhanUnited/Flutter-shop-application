import 'package:flutter_online_shop/utils/app_constans.dart';
import 'package:get/get_connect/http/src/response/response.dart';
import 'package:get/get_state_manager/get_state_manager.dart';

import '../api/api_client.dart';

class PopularProductRepo extends GetxService {
  final ApiClient apiclient;
  PopularProductRepo({required this.apiclient});

  Future<Response> getPopularProductList() async {
    return await apiclient.getData(AppConstans.Popular_Product_Uri);
  }
}
