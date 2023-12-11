import 'package:flutter/material.dart';
import 'package:get/get.dart';
import 'package:test_serasi_raya/application/config/app_constant.dart';
import 'package:test_serasi_raya/presentation/shared/badges.dart';
import 'package:test_serasi_raya/presentation/views/home/controller/home_controller.dart';
import 'package:test_serasi_raya/presentation/views/home/widget/category_tile.dart';
import 'package:test_serasi_raya/presentation/views/home/widget/product_tile.dart';
import 'package:test_serasi_raya/presentation/views/home/widget/shimmer_category.dart';
import 'package:test_serasi_raya/presentation/views/home/widget/shimmer_product.dart';

class HomeView extends GetView<HomeController> {
  const HomeView({super.key});

  @override
  Widget build(BuildContext context) {
    return Obx(() => Scaffold(
          appBar: AppBar(
            automaticallyImplyLeading: false,
            leading: const Padding(
              padding: EdgeInsets.all(12.0),
              child: CircleAvatar(
                backgroundImage: AssetImage(ImageConstant.userProfile),
              ),
            ),
            title: Row(
              mainAxisSize: MainAxisSize.max,
              mainAxisAlignment: MainAxisAlignment.center,
              crossAxisAlignment: CrossAxisAlignment.center,
              children: [
                Container(
                  width: 28,
                  height: 28,
                  decoration: const BoxDecoration(
                    image: DecorationImage(
                      image: AssetImage(ImageConstant.logo),
                    ),
                  ),
                ),
                const Text(
                  App.appName,
                ),
              ],
            ),
            actions: [
              IconButton(
                onPressed: () => controller.goToSearchPage(),
                splashRadius: 24,
                icon: const Icon(Icons.search),
              ),
              IconButton(
                onPressed: () => controller.goToCart(),
                splashRadius: 24,
                icon: BadgesCart(
                  badgeCount: controller.cartCount.value.toString(),
                ),
                padding: EdgeInsets.zero,
              ),
            ],
          ),
          body: Padding(
            padding:
                const EdgeInsets.symmetric(vertical: 16.0, horizontal: 16.0),
            child: Column(
              mainAxisSize: MainAxisSize.min,
              crossAxisAlignment: CrossAxisAlignment.start,
              children: [
                Text(
                  "Hi, John",
                  style: Theme.of(context).textTheme.titleMedium!.copyWith(
                        color: Colors.black,
                        fontWeight: FontWeight.w500,
                      ),
                ),
                Text(
                  Label.headline,
                  style: Theme.of(context).textTheme.headlineMedium!.copyWith(
                      fontWeight: FontWeight.w500,
                      color: Colors.black,
                      fontSize: 30.0),
                ),
                Container(
                  height: 30,
                  margin: const EdgeInsets.symmetric(vertical: 16.0),
                  child: controller.isLoadCategory.value
                      ? const ShimmerCategory()
                      : ListView.builder(
                          shrinkWrap: true,
                          scrollDirection: Axis.horizontal,
                          itemCount: controller.categories.length,
                          itemBuilder: (context, index) =>
                              Obx(() => CategoryTile(
                                    categoryName: controller.categories[index],
                                    isSelected:
                                        controller.categorySelected.value ==
                                            controller.categories[index],
                                    onTap: (p0) {
                                      controller.changeCategory(p0!);
                                    },
                                  )),
                        ),
                ),
                Expanded(
                  child: controller.isLoadProduct.value
                      ? const ShimmerProduct()
                      : GridView.builder(
                          shrinkWrap: true,
                          itemCount: controller.products.length,
                          gridDelegate:
                              const SliverGridDelegateWithFixedCrossAxisCount(
                                  crossAxisCount: 2,
                                  childAspectRatio: .62,
                                  crossAxisSpacing: 3,
                                  mainAxisSpacing: 3),
                          itemBuilder: (context, index) {
                            return Obx(() => ProductTile(
                                  product: controller.products[index],
                                  onPressed: controller.goToDetail,
                                ));
                          },
                        ),
                ),
              ],
            ),
          ),
        ));
  }
}
