import 'package:flutter/material.dart';
import 'package:flutter/src/widgets/container.dart';
import 'package:flutter/src/widgets/framework.dart';
import 'package:flutter_online_shop/utils/dimensions.dart';

class AppIcon extends StatelessWidget {
  final IconData icon;
  final Color backgroundcolor;
  final Color iconColor;
  final double size;
  final double IconSize;
  const AppIcon(
      {super.key,
      required this.icon,
      this.backgroundcolor = const Color.fromARGB(255, 255, 255, 255),
      this.iconColor = const Color(0xFF756d54),
      this.size = 40,
      this.IconSize = 16});
  @override
  Widget build(BuildContext context) {
    return Container(
      width: size,
      height: size,
      decoration: BoxDecoration(
        borderRadius: BorderRadius.circular(size / 2),
        color: backgroundcolor,
      ),
      child: Icon(
        icon,
        color: iconColor,
        size: IconSize,
      ),
    );
  }
}
