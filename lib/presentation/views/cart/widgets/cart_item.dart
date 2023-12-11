import 'package:cached_network_image/cached_network_image.dart';
import 'package:flutter/material.dart';
import 'package:test_serasi_raya/application/config/app_color.dart';
import 'package:test_serasi_raya/application/config/app_constant.dart';
import 'package:test_serasi_raya/domain/entities/cart.dart';

class CartItem extends StatelessWidget {
  final Cart cart;
  final void Function()? increaseQuantity;
  final void Function()? decreaseQuantity;
  final void Function()? deleteProduct;
  const CartItem({
    super.key,
    required this.cart,
    this.increaseQuantity,
    this.decreaseQuantity,
    this.deleteProduct,
  });

  @override
  Widget build(BuildContext context) {
    return Row(
      mainAxisAlignment: MainAxisAlignment.start,
      crossAxisAlignment: CrossAxisAlignment.start,
      children: [
        Flexible(
          child: Padding(
            padding: const EdgeInsets.symmetric(horizontal: 16, vertical: 12.0),
            child: CachedNetworkImage(
              imageUrl: cart.productImage!,
              fit: BoxFit.fill,
            ),
          ),
        ),
        Flexible(
          flex: 2,
          child: Padding(
            padding:
                const EdgeInsets.symmetric(horizontal: 12.0, vertical: 16.0),
            child: Column(
              mainAxisSize: MainAxisSize.min,
              mainAxisAlignment: MainAxisAlignment.spaceBetween,
              crossAxisAlignment: CrossAxisAlignment.start,
              children: [
                Text(
                  "${cart.productTitle}",
                  overflow: TextOverflow.ellipsis,
                  maxLines: 2,
                  style: Theme.of(context).textTheme.titleLarge!.copyWith(
                      color: Colors.black, fontWeight: FontWeight.normal),
                ),
                const SizedBox(
                  height: 8,
                ),
                Text(
                  "USD ${cart.productPrice}",
                  style: Theme.of(context).textTheme.titleMedium!.copyWith(
                      color: Colors.black, fontWeight: FontWeight.bold),
                ),
                const SizedBox(
                  height: 24,
                ),
                Row(
                  mainAxisAlignment: MainAxisAlignment.spaceBetween,
                  crossAxisAlignment: CrossAxisAlignment.end,
                  children: [
                    Row(
                      children: [
                        InkWell(
                          onTap: () {
                            if (cart.quantity! > 1) {
                              decreaseQuantity!();
                            }
                          },
                          child: _buttonIncDec(
                            icon: Icons.remove,
                            color:
                                cart.quantity! > 1 ? Colors.black : Colors.grey,
                          ),
                        ),
                        Container(
                          margin: const EdgeInsets.symmetric(horizontal: 8.0),
                          child: Text("${cart.quantity}"),
                        ),
                        InkWell(
                          onTap: () => increaseQuantity!(),
                          child: _buttonIncDec(
                            icon: Icons.add,
                          ),
                        ),
                      ],
                    ),
                    InkWell(
                      onTap: () => deleteProduct!(),
                      child: const Icon(
                        Icons.delete_rounded,
                        size: 24.0,
                      ),
                    ),
                  ],
                ),
              ],
            ),
          ),
        ),
      ],
    );
  }

  _buttonIncDec({required IconData icon, Color? color = Colors.black}) {
    return Container(
      padding: const EdgeInsets.all(4.0),
      decoration: BoxDecoration(
        border: Border.all(color: greyColor),
        borderRadius: BorderRadius.circular(8.0),
      ),
      child: Icon(
        icon,
        size: 16.0,
        color: color,
      ),
    );
  }
}
