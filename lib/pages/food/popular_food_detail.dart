import 'package:flutter/material.dart';
import 'package:flutter_online_shop/controllers/cart_controller.dart';
import 'package:flutter_online_shop/controllers/popular_product_controller.dart';
import 'package:flutter_online_shop/utils/app_constans.dart';
import 'package:flutter_online_shop/utils/dimensions.dart';
import 'package:flutter_online_shop/widgets/app_column.dart';
import 'package:flutter_online_shop/widgets/app_icon.dart';
import 'package:flutter_online_shop/widgets/exandable_text_widget.dart';
import 'package:get/get.dart';

import '../../utils/colors.dart';
import '../../widgets/big_text.dart';

// ignore: must_be_immutable
class PopularFoodDetail extends StatefulWidget {
  int pageId;
  PopularFoodDetail({super.key, required this.pageId});

  @override
  State<PopularFoodDetail> createState() => _PopularFoodDetailState();
}

class _PopularFoodDetailState extends State<PopularFoodDetail> {
  @override
  Widget build(BuildContext context) {
    var product =
        Get.find<PopularProductController>().popularProductList[widget.pageId];
    Get.find<PopularProductController>()
        .initProduct(product, Get.find<CartController>());
    return Scaffold(
      backgroundColor: Colors.white,
      body: Stack(children: [
        //background image
        Positioned(
            left: 0,
            right: 0,
            child: Container(
              width: double.maxFinite,
              height: Dimensions.popularFoodImgSize,
              decoration: BoxDecoration(
                  image: DecorationImage(
                      fit: BoxFit.cover,
                      image: NetworkImage(AppConstans.BASE_URL +
                          AppConstans.UPLOAD_URL +
                          product.img!))),
            )),
        //icon widgets
        Positioned(
            top: Dimensions.height45,
            left: Dimensions.Width20,
            right: Dimensions.Width20,
            child: Row(
              mainAxisAlignment: MainAxisAlignment.spaceBetween,
              children: [
                GestureDetector(
                    onTap: () => Get.back(),
                    child: AppIcon(icon: Icons.arrow_back_ios)),
                AppIcon(icon: Icons.shopping_cart_outlined)
              ],
            )),
        //introduction
        Positioned(
            left: 0,
            right: 0,
            bottom: 0,
            top: Dimensions.popularFoodImgSize - 20,
            child: Container(
                padding: EdgeInsets.only(
                    left: Dimensions.Width20,
                    right: Dimensions.Width20,
                    top: Dimensions.height20),
                decoration: BoxDecoration(
                    borderRadius: BorderRadius.only(
                        topRight: Radius.circular(Dimensions.radius20),
                        topLeft: Radius.circular(Dimensions.radius20)),
                    color: Colors.white),
                child: Column(
                  crossAxisAlignment: CrossAxisAlignment.start,
                  children: [
                    AppColumn(
                      text: product.name,
                    ),
                    SizedBox(
                      height: Dimensions.height20,
                    ),
                    BigText(text: 'Introduce'),
                    SizedBox(
                      height: Dimensions.height20,
                    ),
                    Expanded(
                      child: SingleChildScrollView(
                        child: ExpandableTextWidget(text: product.description!),
                      ),
                    )
                  ],
                )))
      ]),
      bottomNavigationBar: GetBuilder<PopularProductController>(
        builder: (controller) => Container(
          height: Dimensions.bottomHeightBar,
          padding: EdgeInsets.only(
              top: Dimensions.height30,
              bottom: Dimensions.height30,
              left: Dimensions.Width20 * 3,
              right: Dimensions.Width20 * 3),
          decoration: BoxDecoration(
            color: Color.fromARGB(82, 236, 232, 232),
            borderRadius: BorderRadius.only(
                topLeft: Radius.circular(Dimensions.radius20),
                topRight: Radius.circular(Dimensions.radius20)),
          ),
          child: Row(
            mainAxisAlignment: MainAxisAlignment.spaceBetween,
            children: [
              Container(
                padding: EdgeInsets.only(
                    top: Dimensions.height20,
                    bottom: Dimensions.height20,
                    right: Dimensions.Width20,
                    left: Dimensions.Width20),
                decoration: BoxDecoration(
                    borderRadius: BorderRadius.circular(Dimensions.radius20),
                    color: Colors.white),
                child: Row(
                  children: [
                    GestureDetector(
                      onTap: () => controller.setQuantity(false),
                      child: Icon(
                        Icons.remove,
                        color: Colors.black45,
                      ),
                    ),
                    SizedBox(
                      width: Dimensions.Width10 + 10,
                    ),
                    BigText(text: controller.quantity.toString()),
                    SizedBox(width: Dimensions.Width10 + 10),
                    GestureDetector(
                      onTap: () => controller.setQuantity(true),
                      child: Icon(
                        Icons.add,
                        color: Colors.black45,
                      ),
                    )
                  ],
                ),
              ),
              Container(
                padding: EdgeInsets.only(
                    top: Dimensions.height20,
                    bottom: Dimensions.height20,
                    right: Dimensions.Width20,
                    left: Dimensions.Width20),
                decoration: BoxDecoration(
                    borderRadius: BorderRadius.circular(Dimensions.radius20),
                    color: AppColors.mainColor),
                child: GestureDetector(
                  onTap: () => controller.addItem(product),
                  child: BigText(
                    text: '\$ ${product.price!} | Add to cart',
                    color: Colors.white,
                  ),
                ),
              ),
            ],
          ),
        ),
      ),
    );
  }
}
