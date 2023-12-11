import 'package:cached_network_image/cached_network_image.dart';
import 'package:flutter/material.dart';
import 'package:test_serasi_raya/domain/entities/product.dart';

class ProductTile extends StatelessWidget {
  final Product product;
  final void Function(Product)? onTap;
  const ProductTile({super.key, required this.product, this.onTap});

  @override
  Widget build(BuildContext context) {
    return ListTile(
      onTap: () => onTap!(product),
      contentPadding:
          const EdgeInsets.symmetric(horizontal: 16.0, vertical: 12.0),
      leading: CachedNetworkImage(
        width: 50,
        imageUrl: product.image!,
        fit: BoxFit.fill,
      ),
      title: Text(
        "${product.title}",
        style: Theme.of(context).textTheme.titleSmall!.copyWith(
              color: Colors.black,
              fontWeight: FontWeight.w500,
            ),
      ),
      subtitle: Padding(
        padding: const EdgeInsets.only(top: 8.0),
        child: Column(
          crossAxisAlignment: CrossAxisAlignment.start,
          children: [
            Text(
              "USD ${product.price}",
              style: Theme.of(context).textTheme.bodyMedium!.copyWith(
                    color: Colors.black,
                    fontWeight: FontWeight.normal,
                  ),
            ),
            const SizedBox(
              height: 16.0,
            ),
            Row(
              mainAxisAlignment: MainAxisAlignment.start,
              children: [
                const Icon(
                  Icons.star,
                  color: Colors.amberAccent,
                  size: 18.0,
                ),
                const SizedBox(
                  width: 4.0,
                ),
                Text(
                  "${product.rating!.rate} ",
                  style: Theme.of(context).textTheme.bodyMedium!.copyWith(
                        color: Colors.black,
                        fontWeight: FontWeight.normal,
                      ),
                ),
                const SizedBox(
                  width: 12.0,
                ),
                Text(
                  "${product.rating!.count} Reviews",
                  style: Theme.of(context).textTheme.bodyMedium!.copyWith(
                        color: Colors.black,
                        fontWeight: FontWeight.normal,
                      ),
                )
              ],
            )
          ],
        ),
      ),
    );
  }
}
