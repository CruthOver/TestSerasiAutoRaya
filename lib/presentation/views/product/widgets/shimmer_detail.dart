import 'package:flutter/material.dart';
import 'package:shimmer/shimmer.dart';

class ShimmerDetail extends StatelessWidget {
  const ShimmerDetail({super.key});

  @override
  Widget build(BuildContext context) {
    return Shimmer.fromColors(
      baseColor: Colors.grey.shade300,
      highlightColor: Colors.grey.shade100,
      child: SingleChildScrollView(
        child: Column(
          crossAxisAlignment: CrossAxisAlignment.start,
          children: [
            Container(
              margin:
                  const EdgeInsets.symmetric(horizontal: 16, vertical: 16.0),
              width: double.infinity,
              height: 250,
              padding: const EdgeInsets.all(16),
              alignment: Alignment.center,
              color: Colors.grey,
            ),
            const SizedBox(
              height: 16.0,
            ),
            Row(
              mainAxisAlignment: MainAxisAlignment.spaceBetween,
              children: [
                Flexible(
                  child: Container(
                    margin: const EdgeInsets.symmetric(horizontal: 16),
                    height: 30,
                    color: Colors.grey,
                  ),
                ),
                Flexible(
                  child: Container(
                    margin: const EdgeInsets.only(right: 16),
                    height: 30,
                    color: Colors.grey,
                  ),
                ),
              ],
            ),
            const SizedBox(
              height: 16.0,
            ),
            Container(
              margin: const EdgeInsets.symmetric(horizontal: 16),
              color: Colors.grey,
              width: double.infinity,
              height: 30,
            ),
            const SizedBox(
              height: 16.0,
            ),
            Container(
              margin: const EdgeInsets.symmetric(horizontal: 16),
              color: Colors.grey,
              width: double.infinity,
              height: 30,
            ),
            const SizedBox(
              height: 16.0,
            ),
            ListTile(
              title: Container(
                color: Colors.grey,
                width: double.infinity,
                height: 30,
              ),
            ),
          ],
        ),
      ),
    );
  }
}
