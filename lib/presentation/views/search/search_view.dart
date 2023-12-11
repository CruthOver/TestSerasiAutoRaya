import 'package:flutter/material.dart';
import 'package:get/get.dart';
import 'package:test_serasi_raya/application/config/app_color.dart';
import 'package:test_serasi_raya/application/config/app_constant.dart';
import 'package:test_serasi_raya/presentation/shared/badges.dart';
import 'package:test_serasi_raya/presentation/shared/custom_textfield.dart';
import 'package:test_serasi_raya/presentation/views/search/controller/search_controller.dart';
import 'package:test_serasi_raya/presentation/views/search/widget/product_tile.dart';

class SearchView extends GetView<SearchPageController> {
  const SearchView({super.key});

  @override
  Widget build(BuildContext context) {
    return Obx(() => Scaffold(
          appBar: AppBar(
            leading: IconButton(
              onPressed: () => Get.back(),
              icon: const Icon(Icons.arrow_back_ios_new_rounded),
              splashRadius: 24,
            ),
            title: const Text(Label.searchTitle),
            actions: [
              IconButton(
                onPressed: () => controller.goToCart(),
                icon: BadgesCart(
                  badgeCount: controller.cartCount.value.toString(),
                ),
                splashRadius: 24,
              )
            ],
          ),
          body: Column(
            children: [
              Padding(
                padding:
                    const EdgeInsets.symmetric(horizontal: 16, vertical: 16),
                child: CustomTextField(
                  controller: controller.searchController.value,
                  label: null,
                  hintText: Label.searchLabel,
                  textInputAction: TextInputAction.done,
                  prefixIcon: const Icon(Icons.search),
                  suffixIcon: IconButton(
                    onPressed: () {
                      controller.searchController.value.clear();
                    },
                    icon: const Icon(Icons.close),
                    splashRadius: 24,
                  ),
                ),
              ),
              controller.searchResult.isNotEmpty
                  ? Expanded(
                      child: ListView.separated(
                        shrinkWrap: true,
                        itemCount: controller.searchResult.length,
                        separatorBuilder: (BuildContext context, int index) {
                          return const Divider(
                            height: 1.0,
                            color: greyColor,
                          );
                        },
                        itemBuilder: (context, index) {
                          return ProductTile(
                            product: controller.searchResult[index],
                            onTap: (product) =>
                                controller.goToDetail(product.id!),
                          );
                        },
                      ),
                    )
                  : ListTile(
                      title: Text(
                        "No Product Found",
                        style: Theme.of(context).textTheme.titleSmall!.copyWith(
                              color: Colors.grey,
                            ),
                      ),
                    ),
            ],
          ),
        ));
  }
}
