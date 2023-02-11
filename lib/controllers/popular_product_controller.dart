import 'package:flutter/material.dart';
import 'package:flutter_online_shop/controllers/cart_controller.dart';
import 'package:flutter_online_shop/utils/colors.dart';
import 'package:get/get.dart';

import '../data/repository/popular_product_repo.dart';
import '../models/products_model.dart';

class PopularProductController extends GetxController {
  final PopularProductRepo popularProducRepo;
  PopularProductController({required this.popularProducRepo});
  List<dynamic> _popularProductList = [];
  List<dynamic> get popularProductList => _popularProductList;
  late CartController _cart;

  bool _isLoaded = false;
  bool get isLoaded => _isLoaded;
  int _quantity = 0;
  int get quantity => _quantity;
  int _inCartItems = 0;
  int get inCartItems => _inCartItems + _quantity;

  Future<void> getPopularProductList() async {
    Response response = await popularProducRepo.getPopularProductList();
    if (response.statusCode == 200) {
      _popularProductList = [];
      _popularProductList.addAll(Product.fromJson(response.body).products);
      _isLoaded = true;
      update();
    } else {}
  }

  void setQuantity(bool isIncrement) {
    if (isIncrement) {
      _quantity = abs(_quantity + 1);
    } else {
      _quantity = abs(_quantity - 1);
    }
    update();
  }

  int abs(int number) {
    if (number < 0) {
      Get.snackbar("Item count", "You can't reduce more !",
          backgroundColor: AppColors.mainBlackColor, colorText: Colors.white);
      return 0;
    }
    if (number > 20) {
      Get.snackbar("Item count", "You can't add more !",
          backgroundColor: AppColors.mainBlackColor, colorText: Colors.white);
      return 20;
    }
    return number;
  }

  void initProduct(ProductModel product, CartController cart) {
    _quantity = 0;
    _inCartItems = 0;
    _cart = cart;
    var exist = false;
    exist = _cart.existInCart(product);
    if (exist) {
      _inCartItems = _cart.getQuantity(product);
    }
  }

  void addItem(ProductModel product) {
    if (_quantity > 0) {
      _cart.items.forEach((key, value) {});
      _cart.addItem(product, _quantity);
      _quantity = 0;
    } else {
      Get.snackbar("Item count", "You should add at least one item in the cart",
          backgroundColor: AppColors.mainBlackColor, colorText: Colors.white);
    }
  }
}
