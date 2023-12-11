import 'package:flutter/material.dart';
import 'package:shimmer/shimmer.dart';

class ShimmerProduct extends StatelessWidget {
  const ShimmerProduct({super.key});

  @override
  Widget build(BuildContext context) {
    return Shimmer.fromColors(
      baseColor: Colors.grey.shade300,
      highlightColor: Colors.grey.shade100,
      child: GridView.builder(
        shrinkWrap: true,
        itemCount: 6,
        gridDelegate: const SliverGridDelegateWithFixedCrossAxisCount(
            crossAxisCount: 2,
            childAspectRatio: .62,
            crossAxisSpacing: 3,
            mainAxisSpacing: 3),
        itemBuilder: (context, index) {
          return Card(
            child: Padding(
              padding: const EdgeInsets.symmetric(vertical: 8.0),
              child: Container(),
            ),
          );
        },
      ),
    );
  }
}
