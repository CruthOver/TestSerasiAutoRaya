import 'package:flutter/material.dart';
import 'package:badges/badges.dart' as badges;

class BadgesCart extends StatelessWidget {
  final String badgeCount;
  const BadgesCart({super.key, required this.badgeCount});

  @override
  Widget build(BuildContext context) {
    return badges.Badge(
      position: badges.BadgePosition.topEnd(top: 12, end: -5),
      showBadge: true,
      onTap: () {},
      badgeContent: Text(
        badgeCount,
        style: Theme.of(context).textTheme.labelSmall!.copyWith(
              color: Colors.white,
            ),
      ),
      badgeAnimation: const badges.BadgeAnimation.slide(
        animationDuration: Duration(seconds: 1),
        colorChangeAnimationDuration: Duration(seconds: 1),
        loopAnimation: false,
        curve: Curves.bounceOut,
        colorChangeAnimationCurve: Curves.easeInCubic,
      ),
      badgeStyle: const badges.BadgeStyle(
        shape: badges.BadgeShape.circle,
        badgeColor: Colors.red,
        elevation: 0,
      ),
      child: const Icon(Icons.shopping_cart_outlined),
    );
  }
}
