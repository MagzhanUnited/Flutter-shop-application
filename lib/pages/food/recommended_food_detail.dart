import 'package:flutter/material.dart';
import 'package:flutter/src/widgets/container.dart';
import 'package:flutter/src/widgets/framework.dart';
import 'package:flutter_online_shop/controllers/recommended_product_controller.dart';
import 'package:flutter_online_shop/utils/app_constans.dart';
import 'package:flutter_online_shop/utils/colors.dart';
import 'package:flutter_online_shop/utils/dimensions.dart';
import 'package:flutter_online_shop/widgets/app_icon.dart';
import 'package:flutter_online_shop/widgets/big_text.dart';
import 'package:flutter_online_shop/widgets/exandable_text_widget.dart';
import 'package:get/get.dart';

class RecommendedFoodDetail extends StatelessWidget {
  final pageId;
  const RecommendedFoodDetail({super.key, required this.pageId});

  @override
  Widget build(BuildContext context) {
    var product =
        Get.find<RecommendedProductController>().recommendedProductList[pageId];
    return Scaffold(
      bottomNavigationBar: Column(
        mainAxisSize: MainAxisSize.min,
        children: [
          Container(
            padding: EdgeInsets.only(
                left: Dimensions.Width20 * 2.5,
                right: Dimensions.Width20 * 2.5,
                top: Dimensions.height10,
                bottom: Dimensions.height10),
            child: Row(
              mainAxisAlignment: MainAxisAlignment.spaceBetween,
              children: [
                AppIcon(
                  IconSize: Dimensions.iconSize24,
                  icon: Icons.remove,
                  backgroundcolor: AppColors.mainColor,
                  iconColor: Colors.white,
                ),
                BigText(
                  text: "\$${product.price!}" + " X " + "0",
                  color: AppColors.mainBlackColor,
                  size: Dimensions.font26,
                ),
                AppIcon(
                  IconSize: Dimensions.iconSize24,
                  icon: Icons.add,
                  backgroundcolor: AppColors.mainColor,
                  iconColor: Colors.white,
                ),
              ],
            ),
          ),
          Container(
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
                    width: Dimensions.Width45,
                    decoration: BoxDecoration(
                        borderRadius:
                            BorderRadius.circular(Dimensions.radius20),
                        color: Colors.white),
                    child: Icon(
                      Icons.favorite,
                      color: AppColors.mainColor,
                    )),
                Container(
                  padding: EdgeInsets.only(
                      top: Dimensions.height20,
                      bottom: Dimensions.height20,
                      right: Dimensions.Width20,
                      left: Dimensions.Width20),
                  decoration: BoxDecoration(
                      borderRadius: BorderRadius.circular(Dimensions.radius20),
                      color: AppColors.mainColor),
                  child: BigText(
                    text: '\$${product.price!} | Add to cart',
                    color: Colors.white,
                  ),
                ),
              ],
            ),
          ),
        ],
      ),
      backgroundColor: Colors.white,
      body: CustomScrollView(slivers: [
        SliverAppBar(
          automaticallyImplyLeading: false,
          toolbarHeight: 78,
          title: Row(
            mainAxisAlignment: MainAxisAlignment.spaceBetween,
            children: [
              GestureDetector(
                onTap: () => Get.back(),
                child: const AppIcon(icon: Icons.clear),
              ),
              const AppIcon(icon: Icons.shopping_cart_outlined)
            ],
          ),
          bottom: PreferredSize(
            preferredSize: const Size.fromHeight(100),
            child: Container(
              padding: const EdgeInsets.only(top: 10, bottom: 10),
              child: Center(
                  child: BigText(
                text: product.name,
                size: Dimensions.font26,
              )),
              width: double.maxFinite,
              decoration: BoxDecoration(
                  color: Colors.white,
                  borderRadius: BorderRadius.only(
                      topLeft: Radius.circular(Dimensions.radius20),
                      topRight: Radius.circular(Dimensions.radius20))),
            ),
          ),
          pinned: true,
          backgroundColor: Colors.yellow,
          expandedHeight: 300,
          floating: true,
          flexibleSpace: FlexibleSpaceBar(
            background: Image.network(
              AppConstans.BASE_URL + AppConstans.UPLOAD_URL + product.img!,
              width: double.maxFinite,
              fit: BoxFit.cover,
            ),
          ),
        ),
        SliverToBoxAdapter(
          child: Column(
            children: [
              Container(
                margin: EdgeInsets.only(
                    left: Dimensions.Width20, right: Dimensions.Width20),
                child: ExpandableTextWidget(text: product.description!),
              ),
            ],
          ),
        )
      ]),
    );
  }
}
