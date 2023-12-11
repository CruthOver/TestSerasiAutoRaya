import 'package:cached_network_image/cached_network_image.dart';
import 'package:flutter/material.dart';
import 'package:test_serasi_raya/application/config/app_constant.dart';
import 'package:test_serasi_raya/domain/entities/product.dart';

class ProductTile extends StatelessWidget {
  final Product product;
  final void Function(int)? onPressed;
  const ProductTile({super.key, required this.product, this.onPressed});

  @override
  Widget build(BuildContext context) {
    return InkWell(
      onTap: () => onPressed!(product.id!),
      child: Card(
        child: Padding(
          padding: const EdgeInsets.symmetric(vertical: 8.0),
          child: Column(
            children: [
              CachedNetworkImage(
                imageUrl: product.image!,
                height: 120,
                fit: BoxFit.fill,
              ),
              const SizedBox(
                height: 8.0,
              ),
              ListTile(
                title: Text(
                  "${product.title}",
                  overflow: TextOverflow.ellipsis,
                  maxLines: 2,
                  style: Theme.of(context).textTheme.titleSmall!.copyWith(
                        color: Colors.black,
                        fontWeight: FontWeight.bold,
                      ),
                ),
                subtitle: Padding(
                  padding: const EdgeInsets.only(top: 8.0),
                  child: Text(
                    "USD ${product.price}",
                    style: Theme.of(context).textTheme.labelMedium!.copyWith(
                          color: Colors.black,
                          fontWeight: FontWeight.bold,
                        ),
                  ),
                ),
              ),
              const SizedBox(
                height: 12.0,
              ),
              Padding(
                padding: const EdgeInsets.symmetric(horizontal: 16),
                child: Row(
                  crossAxisAlignment: CrossAxisAlignment.end,
                  children: [
                    const Icon(
                      Icons.star,
                      color: Colors.amberAccent,
                      size: 16.0,
                    ),
                    Text(
                      "${product.rating!.rate!}",
                      style: Theme.of(context).textTheme.labelLarge!.copyWith(
                            color: Colors.black,
                          ),
                    ),
                    const SizedBox(
                      width: 8.0,
                    ),
                    Text("${product.rating!.count!} ${Label.reviewLabel}"),
                  ],
                ),
              )
            ],
          ),
        ),
      ),
    );
  }
}
