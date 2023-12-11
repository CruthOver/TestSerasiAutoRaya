import 'package:cached_network_image/cached_network_image.dart';
import 'package:flutter/material.dart';
import 'package:get/get.dart';
import 'package:test_serasi_raya/application/config/app_color.dart';
import 'package:test_serasi_raya/application/config/app_constant.dart';
import 'package:test_serasi_raya/presentation/shared/badges.dart';
import 'package:test_serasi_raya/presentation/views/product/controller/product_controller.dart';
import 'package:test_serasi_raya/presentation/views/product/widgets/shimmer_detail.dart';

class ProductView extends GetView<ProductController> {
  const ProductView({super.key});

  @override
  Widget build(BuildContext context) {
    return Obx(() => Scaffold(
          appBar: AppBar(
            leading: IconButton(
              onPressed: () => Get.back(),
              icon: const Icon(Icons.arrow_back_ios_new_rounded),
              splashRadius: 24,
            ),
            actions: [
              IconButton(
                onPressed: () {},
                icon: BadgesCart(
                  badgeCount: controller.cartCount.value.toString(),
                ),
                splashRadius: 24,
              )
            ],
          ),
          body: controller.isLoading.value
              ? const ShimmerDetail()
              : SingleChildScrollView(
                  child: Column(
                    crossAxisAlignment: CrossAxisAlignment.start,
                    children: [
                      Container(
                        alignment: Alignment.center,
                        child: CachedNetworkImage(
                            imageUrl: controller.product.value.image!,
                            height: 220,
                            fit: BoxFit.fill),
                      ),
                      const SizedBox(
                        height: 16.0,
                      ),
                      Padding(
                        padding: const EdgeInsets.all(16.0),
                        child: Row(
                          mainAxisAlignment: MainAxisAlignment.spaceBetween,
                          children: [
                            Text(
                              "USD ${controller.product.value.price}",
                              style: Theme.of(context)
                                  .textTheme
                                  .labelLarge!
                                  .copyWith(
                                    color: greenColor,
                                    fontWeight: FontWeight.bold,
                                  ),
                            ),
                            const InkWell(
                              child: Icon(
                                Icons.favorite_border_outlined,
                                color: greenColor,
                              ),
                            ),
                          ],
                        ),
                      ),
                      const SizedBox(
                        height: 16.0,
                      ),
                      Padding(
                        padding: const EdgeInsets.symmetric(horizontal: 16.0),
                        child: Text(
                          "${controller.product.value.title}",
                          style:
                              Theme.of(context).textTheme.titleLarge!.copyWith(
                                    color: Colors.black,
                                    fontWeight: FontWeight.bold,
                                  ),
                        ),
                      ),
                      const SizedBox(
                        height: 16.0,
                      ),
                      Padding(
                        padding: const EdgeInsets.symmetric(horizontal: 16),
                        child: Row(
                          children: [
                            const Icon(
                              Icons.star,
                              color: Colors.amberAccent,
                              size: 18.0,
                            ),
                            Text(
                              "${controller.product.value.rating!.rate}",
                              style: Theme.of(context)
                                  .textTheme
                                  .titleSmall!
                                  .copyWith(
                                    color: Colors.grey[500],
                                  ),
                            ),
                            const SizedBox(
                              width: 10.0,
                            ),
                            Text(
                              "${controller.product.value.rating!.count} Reviews",
                              style: Theme.of(context)
                                  .textTheme
                                  .labelLarge!
                                  .copyWith(
                                    color: Colors.grey[500],
                                  ),
                            ),
                          ],
                        ),
                      ),
                      const SizedBox(
                        height: 16.0,
                      ),
                      Padding(
                        padding: const EdgeInsets.symmetric(horizontal: 16.0),
                        child: Text(
                          "${controller.product.value.description}",
                          style:
                              Theme.of(context).textTheme.titleSmall!.copyWith(
                                    color: Colors.black,
                                    fontWeight: FontWeight.normal,
                                  ),
                        ),
                      ),
                    ],
                  ),
                ),
          bottomNavigationBar: Padding(
            padding:
                const EdgeInsets.symmetric(horizontal: 16.0, vertical: 16.0),
            child: TextButton(
              onPressed: () {
                if (!controller.isLoading.value) {
                  controller.addToCart();
                }
              },
              child: controller.isAddToCart.value
                  ? const SizedBox(
                      width: 20,
                      height: 20,
                      child: CircularProgressIndicator(
                        color: Colors.white,
                      ),
                    )
                  : Text(
                      Label.addToCartLabel,
                      style: Theme.of(context).textTheme.bodyMedium!.copyWith(
                            fontSize: 16.0,
                            color: Colors.white,
                          ),
                    ),
            ),
          ),
        ));
  }
}
