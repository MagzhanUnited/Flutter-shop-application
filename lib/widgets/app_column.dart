import 'package:flutter/cupertino.dart';
import 'package:flutter/material.dart';
import 'package:flutter_online_shop/utils/dimensions.dart';
import 'package:flutter_online_shop/widgets/small_text.dart';

import '../utils/colors.dart';
import 'big_text.dart';
import 'icon_and_text.dart';

class AppColumn extends StatelessWidget {
  final String text;
  const AppColumn({super.key, required this.text});

  @override
  Widget build(BuildContext context) {
    return Column(
      crossAxisAlignment: CrossAxisAlignment.start,
      children: [
        BigText(
          text: text,
          size: Dimensions.font26,
        ),
        SizedBox(
          height: Dimensions.height10,
        ),
        Row(
          children: [
            Wrap(
              children: List.generate(
                  5,
                  (index) => Icon(
                        Icons.star,
                        color: Color.fromARGB(193, 33, 149, 243),
                        size: 15,
                      )),
            ),
            SizedBox(
              width: 10,
            ),
            SmallText(text: '4.5'),
            SizedBox(
              width: 10,
            ),
            SmallText(text: '1287'),
            SizedBox(
              width: 10,
            ),
            SmallText(text: 'comments'),
          ],
        ),
        SizedBox(
          height: 10,
        ),
        Row(
          mainAxisAlignment: MainAxisAlignment.spaceBetween,
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
    );
  }
}
