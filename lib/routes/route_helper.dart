import 'package:flutter_online_shop/pages/food/popular_food_detail.dart';
import 'package:flutter_online_shop/pages/home/main_food_page.dart';
import 'package:get/route_manager.dart';

import '../pages/food/recommended_food_detail.dart';

class RouteHelper {
  static const String initial = '/';
  static const String popularFood = '/popular-food';
  static const String recommendedFood = '/recommended-food';

  static String getPopularFood(int pageId) => '$popularFood?pageId=$pageId';
  static String getRecommendedFood(int pageId) =>
      '$recommendedFood?pageId=$pageId';
  static String getInitial() => initial;

  static List<GetPage> routes = [
    GetPage(name: getInitial(), page: () => MainFoodPage()),
    GetPage(
        name: popularFood,
        page: () {
          var pagId = Get.parameters['pageId'];
          return PopularFoodDetail(pageId: int.parse(pagId!));
        },
        transition: Transition.fadeIn),
    GetPage(
        name: recommendedFood,
        page: () {
          var pagId = Get.parameters['pageId'];
          return RecommendedFoodDetail(pageId: int.parse(pagId!));
        },
        transition: Transition.fadeIn)
  ];
}
