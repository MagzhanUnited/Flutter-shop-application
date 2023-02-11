import 'package:dots_indicator/dots_indicator.dart';
import 'package:flutter/material.dart';
import 'package:flutter/src/widgets/container.dart';
import 'package:flutter/src/widgets/framework.dart';
import 'package:flutter_online_shop/controllers/popular_product_controller.dart';
import 'package:flutter_online_shop/controllers/recommended_product_controller.dart';
import 'package:flutter_online_shop/pages/food/popular_food_detail.dart';
import 'package:flutter_online_shop/routes/route_helper.dart';
import 'package:flutter_online_shop/utils/app_constans.dart';
import 'package:flutter_online_shop/utils/colors.dart';
import 'package:flutter_online_shop/utils/dimensions.dart';
import 'package:flutter_online_shop/widgets/big_text.dart';
import 'package:flutter_online_shop/widgets/icon_and_text.dart';
import 'package:flutter_online_shop/widgets/small_text.dart';
import 'package:get/get.dart';
import 'package:get/get_core/src/get_main.dart';
import 'package:get/get_state_manager/get_state_manager.dart';

import '../../widgets/app_column.dart';

class FoodPageBody extends StatefulWidget {
  const FoodPageBody({super.key});

  @override
  State<FoodPageBody> createState() => _FoodPageBodyState();
}

class _FoodPageBodyState extends State<FoodPageBody> {
  PageController pageController = PageController(viewportFraction: 0.85);
  var _currPageValue = 0.0;
  double _scaleFacttor = 0.8;
  double _height = Dimensions.pageViewContainer;
  @override
  void initState() {
    super.initState();
    pageController.addListener(() {
      setState(() {
        _currPageValue = pageController.page!;
      });
    });
  }

  @override
  void dispose() {
    pageController.dispose();
  }

  @override
  Widget build(BuildContext context) {
    return Column(
      children: [
        GetBuilder<PopularProductController>(builder: (product) {
          return product.isLoaded
              ? Container(
                  margin: EdgeInsets.only(top: Dimensions.height10),
                  height: Dimensions.pageView,
                  child: PageView.builder(
                    controller: pageController,
                    itemCount: product.popularProductList.length,
                    itemBuilder: (BuildContext context, int index) {
                      return _buildPageItem(
                          index, product.popularProductList[index]);
                    },
                  ),
                )
              : Container(
                  margin: EdgeInsets.only(top: Dimensions.height10),
                  height: Dimensions.pageView,
                  child: Center(
                    child: CircularProgressIndicator(
                      color: Colors.blue,
                    ),
                  ),
                );
        }),
        GetBuilder<PopularProductController>(builder: (product) {
          return DotsIndicator(
            dotsCount: product.popularProductList.length <= 0
                ? 1
                : product.popularProductList.length,
            position: _currPageValue,
            decorator: DotsDecorator(
              activeColor: AppColors.mainColor,
              size: const Size.square(9.0),
              activeSize: const Size(18.0, 9.0),
              activeShape: RoundedRectangleBorder(
                  borderRadius: BorderRadius.circular(5.0)),
            ),
          );
        }),
        SizedBox(
          height: Dimensions.height30,
        ),
        Container(
          margin: EdgeInsets.only(left: Dimensions.Width30),
          child: Row(
            crossAxisAlignment: CrossAxisAlignment.end,
            children: [
              BigText(text: "Recommended"),
              SizedBox(
                width: Dimensions.Width10,
              ),
              Container(
                margin: const EdgeInsets.only(bottom: 3),
                child: BigText(
                  text: ".",
                  color: Colors.black26,
                ),
              ),
              SizedBox(
                width: Dimensions.Width10,
              ),
              Container(
                margin: EdgeInsets.only(bottom: 2),
                child: SmallText(text: "Food pairing"),
              ),
            ],
          ),
        )
        //list of food and images
        ,
        GetBuilder<RecommendedProductController>(builder: ((controller) {
          return controller.isLoaded
              ? ListView.builder(
                  physics: NeverScrollableScrollPhysics(),
                  shrinkWrap: true,
                  itemCount: controller.recommendedProductList.length,
                  itemBuilder: ((context, index) {
                    return GestureDetector(
                      onTap: () =>
                          Get.toNamed(RouteHelper.getRecommendedFood(index)),
                      child: Container(
                        margin: EdgeInsets.only(
                            left: Dimensions.Width20,
                            right: Dimensions.Width20,
                            bottom: Dimensions.height10),
                        child: Row(
                          children: [
                            Container(
                              width: Dimensions.ListViewImgSize,
                              height: Dimensions.ListViewImgSize,
                              decoration: BoxDecoration(
                                  borderRadius: BorderRadius.circular(
                                      Dimensions.radius20),
                                  color: Colors.white30,
                                  image: DecorationImage(
                                      fit: BoxFit.cover,
                                      image: NetworkImage(AppConstans.BASE_URL +
                                          "/uploads/" +
                                          controller
                                              .recommendedProductList[index]
                                              .img))),
                            ),
                            Expanded(
                              child: Container(
                                height: 100,
                                decoration: BoxDecoration(
                                  borderRadius: BorderRadius.only(
                                      topRight:
                                          Radius.circular(Dimensions.radius20),
                                      bottomRight:
                                          Radius.circular(Dimensions.radius20)),
                                  color: Colors.white,
                                ),
                                padding: EdgeInsets.only(
                                    left: Dimensions.Width10,
                                    right: Dimensions.Width10),
                                child: Column(
                                  crossAxisAlignment: CrossAxisAlignment.start,
                                  mainAxisAlignment: MainAxisAlignment.center,
                                  children: [
                                    BigText(
                                        text: controller
                                            .recommendedProductList[index]
                                            .name!),
                                    SizedBox(
                                      height: Dimensions.height10,
                                    ),
                                    SmallText(text: 'All foods of fastfood'),
                                    SizedBox(
                                      height: Dimensions.height10,
                                    ),
                                    Row(
                                      mainAxisAlignment:
                                          MainAxisAlignment.spaceBetween,
                                      children: [
                                        IconAndText(
                                            icon: Icons.circle_sharp,
                                            iconColor: Colors.orange,
                                            text: 'Normal'),
                                        IconAndText(
                                            icon: Icons.location_on,
                                            iconColor: AppColors.mainColor,
                                            text: '1.7 km'),
                                        IconAndText(
                                            icon: Icons.access_time_rounded,
                                            iconColor: Colors.red,
                                            text: '32 min')
                                      ],
                                    ),
                                  ],
                                ),
                              ),
                            ),
                          ],
                        ),
                      ),
                    );
                  }))
              : Container(
                  margin: EdgeInsets.only(top: Dimensions.height10),
                  height: Dimensions.pageView,
                  child: Center(
                    child: CircularProgressIndicator(
                      color: Colors.blue,
                    ),
                  ),
                );
        }))
      ],
    );
  }

  Widget _buildPageItem(int position, popularProduct) {
    Matrix4 matrix = new Matrix4.identity();
    if (position == _currPageValue.floor()) {
      var currScale = 1 - (_currPageValue - position) * (1 - _scaleFacttor);
      var currTrans = _height * (1 - currScale) / 2;
      matrix = Matrix4.diagonal3Values(1, currScale, 1)
        ..setTranslationRaw(0, currTrans, 0);
    } else if (position == _currPageValue.floor() + 1) {
      var currScale =
          _scaleFacttor + (_currPageValue - position + 1) * (1 - _scaleFacttor);
      var currTrans = _height * (1 - currScale) / 2;
      matrix = Matrix4.diagonal3Values(1, currScale, 1)
        ..setTranslationRaw(0, currTrans, 0);
      matrix = Matrix4.diagonal3Values(1, currScale, 1)
        ..setTranslationRaw(0, currTrans, 0);
    } else if (position == _currPageValue.floor() - 1) {
      var currScale = 1 - (_currPageValue - position) * (1 - _scaleFacttor);
      var currTrans = _height * (1 - currScale) / 2;
      matrix = Matrix4.diagonal3Values(1, currScale, 1);
      matrix = Matrix4.diagonal3Values(1, currScale, 1)
        ..setTranslationRaw(0, currTrans, 0);
    } else {
      var currScale = 0.8;
      matrix = Matrix4.diagonal3Values(1, currScale, 1)
        ..setTranslationRaw(0, _height * (1 - _scaleFacttor) / 2, 0);
    }
    return Transform(
      transform: matrix,
      child: Stack(children: [
        GestureDetector(
          onTap: (() {
            Get.toNamed(RouteHelper.getPopularFood(position));
          }),
          child: Container(
            height: _height,
            margin: EdgeInsets.only(
                left: Dimensions.Width10, right: Dimensions.Width10),
            decoration: BoxDecoration(
                borderRadius: BorderRadius.circular(Dimensions.radius30),
                color: Color(0xFF69c5df),
                image: DecorationImage(
                    fit: BoxFit.cover,
                    image: NetworkImage(AppConstans.BASE_URL +
                        "/uploads/" +
                        popularProduct.img!))),
          ),
        ),
        Align(
          alignment: Alignment.bottomCenter,
          child: Container(
            height: Dimensions.pageViewTextContainer,
            margin: EdgeInsets.only(
                left: Dimensions.Width30,
                right: Dimensions.Width30,
                bottom: Dimensions.height30),
            decoration: BoxDecoration(
                borderRadius: BorderRadius.circular(Dimensions.radius20),
                color: Colors.white,
                boxShadow: [
                  BoxShadow(
                      color: Color(0xFFe8e8e8),
                      blurRadius: 5.0,
                      offset: Offset(0, 5)),
                  BoxShadow(color: Colors.white, offset: Offset(5, 0))
                ]),
            child: Container(
              padding: EdgeInsets.only(
                  top: Dimensions.height15, left: 15, right: 15),
              child: AppColumn(text: popularProduct.name!),
            ),
          ),
        )
      ]),
    );
  }
}
