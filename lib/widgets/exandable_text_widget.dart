import 'package:flutter/material.dart';
import 'package:flutter/src/widgets/container.dart';
import 'package:flutter/src/widgets/framework.dart';
import 'package:flutter_online_shop/utils/colors.dart';
import 'package:flutter_online_shop/utils/dimensions.dart';
import 'package:flutter_online_shop/widgets/small_text.dart';

class ExpandableTextWidget extends StatefulWidget {
  final String text;
  const ExpandableTextWidget({super.key, required this.text});

  @override
  State<ExpandableTextWidget> createState() => _ExpandableTextWidgetState();
}

class _ExpandableTextWidgetState extends State<ExpandableTextWidget> {
  late String firsthalf;
  late String secondHalf;

  bool hiddenText = true;

  double textHeight = Dimensions.screenHeight / 5.63;
  @override
  void initState() {
    super.initState();
    if (widget.text.length > textHeight) {
      firsthalf = widget.text.substring(0, textHeight.toInt());
      secondHalf =
          widget.text.substring(textHeight.toInt() + 1, widget.text.length);
    } else {
      firsthalf = widget.text;
      secondHalf = "";
    }
  }

  @override
  Widget build(BuildContext context) {
    return Container(
        child: secondHalf.isEmpty
            ? SmallText(
                text: firsthalf,
                size: Dimensions.font15,
                color: Colors.black87,
                height: 1.7,
              )
            : Column(
                children: [
                  SmallText(
                    height: 1.7,
                    text: hiddenText
                        ? (firsthalf + "...")
                        : firsthalf + secondHalf,
                    size: Dimensions.font15,
                    color: Colors.black87,
                  ),
                  InkWell(
                    onTap: () {
                      setState(() {
                        hiddenText = !hiddenText;
                      });
                    },
                    child: Row(
                      children: [
                        SmallText(
                          text: "Show more",
                          color: AppColors.mainColor,
                        ),
                        Icon(
                          hiddenText
                              ? Icons.arrow_drop_down
                              : Icons.arrow_drop_up,
                          color: AppColors.mainColor,
                        )
                      ],
                    ),
                  )
                ],
              ));
  }
}
