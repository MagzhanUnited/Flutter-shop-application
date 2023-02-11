import 'package:flutter_online_shop/models/products_model.dart';
import 'package:get/get_state_manager/get_state_manager.dart';

import '../data/repository/cart_repo.dart';
import '../models/cart_model.dart';

class CartController extends GetxController {
  final CartRepo cartRepo;
  CartController({required this.cartRepo});
  final Map<int, CartModel> _items = {};
  Map<int, CartModel> get items => _items;

  void addItem(ProductModel product, int quantity) {
    if (_items.containsKey(product.id)) {
      _items.update(product.id!, (product) {
        return CartModel(
          name: product.name,
          id: product.id,
          price: product.price,
          img: product.img,
          quantity: product.quantity! + quantity,
          isExit: true,
          time: DateTime.now().toString(),
        );
      });
    } else {
      _items.putIfAbsent(
          product.id!,
          () => CartModel(
                name: product.name,
                id: product.id,
                price: product.price,
                img: product.img,
                quantity: quantity,
                isExit: true,
                time: DateTime.now().toString(),
              ));
    }
  }

  bool existInCart(ProductModel product) {
    if (_items.containsKey(product.id!)) {
      return true;
    }
    return false;
  }

  int getQuantity(ProductModel product) {
    var quantity = 0;
    if (_items.containsKey(product.id!)) {
      _items.forEach((key, value) {
        if (key == product.id) {
          quantity = value.quantity!;
        }
      });
    }
    return quantity;
  }
}
