import 'package:flutter/material.dart';
import 'package:test_serasi_raya/application/config/app_color.dart';

class CategoryTile extends StatelessWidget {
  final String categoryName;
  final bool? isSelected;
  final void Function(String?)? onTap;
  const CategoryTile(
      {super.key,
      required this.categoryName,
      this.isSelected = false,
      this.onTap});

  @override
  Widget build(BuildContext context) {
    return InkWell(
      onTap: () => onTap!(categoryName),
      borderRadius: BorderRadius.circular(15.0),
      child: Container(
        margin: const EdgeInsets.symmetric(horizontal: 2.0),
        padding: const EdgeInsets.symmetric(horizontal: 12.0),
        alignment: Alignment.center,
        decoration: BoxDecoration(
          color: isSelected! ? greenColor : Colors.white,
          borderRadius: BorderRadius.circular(15.0),
        ),
        child: Text(categoryName,
            style: Theme.of(context).textTheme.labelLarge!.copyWith(
                  color: isSelected! ? Colors.white : Colors.black,
                )),
      ),
    );
  }
}
