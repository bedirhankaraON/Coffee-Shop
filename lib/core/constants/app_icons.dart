import 'package:flutter/material.dart';
import 'package:flutter_svg/svg.dart';

class AppIcons {
  static const home = 'assets/icons/Home.svg';
  static const heart = 'assets/icons/Heart.svg';
  static const bag = 'assets/icons/Bag.svg';
  static const notification = 'assets/icons/Notification.svg';
  static const furniturIcon = 'assets/icons/furnitur-icon.svg';
  static const coffeeBean = 'assets/icons/coffee_bean.svg';
}

class AppIcon extends StatelessWidget {
  const AppIcon(
    this.path, {
    super.key,
    this.color,
    this.size,
  });
  final String path;
  final Color? color;
  final double? size;
  @override
  Widget build(BuildContext context) {
    return SvgPicture.asset(
      path,
      theme: SvgTheme(
        currentColor: color ?? Colors.black,
        fontSize: size ?? 14,
      ),
    );
  }
}
