import 'package:flutter/material.dart';
import 'package:get/get.dart';
import 'package:test_serasi_raya/application/config/app_color.dart';
import 'package:test_serasi_raya/application/config/app_constant.dart';
import 'package:test_serasi_raya/presentation/shared/dialog_confirmation.dart';
import 'package:test_serasi_raya/presentation/views/cart/controller/cart_controller.dart';
import 'package:test_serasi_raya/presentation/views/cart/widgets/cart_item.dart';

class CartView extends GetView<CartController> {
  const CartView({super.key});

  @override
  Widget build(BuildContext context) {
    return Obx(() => Scaffold(
          appBar: AppBar(
            leading: IconButton(
              onPressed: () => Get.back(),
              icon: const Icon(Icons.arrow_back_ios_new_rounded),
              splashRadius: 24,
            ),
            title: const Text(Label.cartTitle),
            actions: [
              IconButton(
                onPressed: () {
                  if (controller.carts.isNotEmpty) {
                    DialogConfirmation().showDialog(
                        title: "Delete Confirmation",
                        message: "Are you sure want to delete all product?",
                        onPressed: () {
                          controller.deleteAllCart();
                          Get.back();
                        });
                  }
                },
                icon: Icon(Icons.delete_rounded,
                    color: controller.carts.isNotEmpty
                        ? Colors.black
                        : Colors.grey),
                splashRadius: 24,
              )
            ],
          ),
          body: controller.carts.isEmpty
              ? Center(
                  child: Column(
                    mainAxisAlignment: MainAxisAlignment.center,
                    children: [
                      const Icon(
                        Icons.warning,
                        size: 64.0,
                        color: Colors.grey,
                      ),
                      const SizedBox(
                        height: 8.0,
                      ),
                      Text(
                        "Cart is Empty",
                        style:
                            Theme.of(context).textTheme.headlineSmall!.copyWith(
                                  fontWeight: FontWeight.bold,
                                  color: Colors.grey,
                                ),
                      ),
                    ],
                  ),
                )
              : Padding(
                  padding: const EdgeInsets.symmetric(vertical: 12.0),
                  child: ListView.separated(
                    itemCount: controller.carts.length,
                    separatorBuilder: (context, index) {
                      return const Divider(
                        height: 1.0,
                        color: greyColor,
                      );
                    },
                    itemBuilder: (context, index) {
                      return CartItem(
                        cart: controller.carts[index],
                        increaseQuantity: () =>
                            controller.increaseQuantity(index),
                        decreaseQuantity: () =>
                            controller.decreaseQuantity(index),
                        deleteProduct: () {
                          DialogConfirmation().showDialog(
                              title: "Delete Confirmation",
                              message:
                                  "Are you sure want to delete this product?",
                              onPressed: () {
                                controller.deleteCart(index);
                                Get.back();
                              });
                        },
                      );
                    },
                  ),
                ),
        ));
  }
}
