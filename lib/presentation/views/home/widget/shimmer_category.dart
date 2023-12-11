import 'package:flutter/material.dart';
import 'package:shimmer/shimmer.dart';

class ShimmerCategory extends StatelessWidget {
  const ShimmerCategory({super.key});

  @override
  Widget build(BuildContext context) {
    return Shimmer.fromColors(
      baseColor: Colors.grey.shade300,
      highlightColor: Colors.grey.shade100,
      child: ListView.builder(
        itemCount: 5,
        scrollDirection: Axis.horizontal,
        itemBuilder: (context, index) {
          return Container(
            width: 90,
            margin: const EdgeInsets.symmetric(horizontal: 2.0),
            padding: const EdgeInsets.symmetric(horizontal: 12.0),
            alignment: Alignment.center,
            decoration: BoxDecoration(
              color: Colors.grey,
              borderRadius: BorderRadius.circular(15.0),
            ),
          );
        },
      ),
    );
  }
}
