import 'package:flutter_online_shop/controllers/cart_controller.dart';
import 'package:flutter_online_shop/data/api/api_client.dart';
import 'package:flutter_online_shop/data/repository/cart_repo.dart';
import 'package:flutter_online_shop/data/repository/popular_product_repo.dart';
import 'package:flutter_online_shop/utils/app_constans.dart';
import 'package:get/get.dart';
import '../controllers/popular_product_controller.dart';
import '../controllers/recommended_product_controller.dart';
import '../data/repository/recommended_product_repo.dart';

Future<void> init() async {
  //api client
  Get.lazyPut<ApiClient>(() => ApiClient(appBaseUrl: AppConstans.BASE_URL));

  //repos
  Get.lazyPut<PopularProductRepo>(
      () => PopularProductRepo(apiclient: Get.find<ApiClient>()));
  Get.lazyPut<RecommendedProductRepo>(
      () => RecommendedProductRepo(apiclient: Get.find<ApiClient>()));
  Get.lazyPut<CartRepo>((() => CartRepo()));

  //controller
  Get.lazyPut<PopularProductController>(() => PopularProductController(
      popularProducRepo: Get.find<PopularProductRepo>()));
  Get.lazyPut<RecommendedProductController>(() => RecommendedProductController(
      recommendedProducRepo: Get.find<RecommendedProductRepo>()));
  Get.lazyPut<CartController>(
      () => CartController(cartRepo: Get.find<CartRepo>()));
}
