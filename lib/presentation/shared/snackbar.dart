import 'package:flutter/material.dart';

void showSnackBar(BuildContext context,
    {required String message,
    required Icon icon,
    Color? backgroundColor = Colors.black}) {
  ScaffoldMessenger.of(context).showSnackBar(SnackBar(
    content: ListTile(
      leading: icon,
      title: Text(
        message,
        style: Theme.of(context).textTheme.titleMedium!.copyWith(
              color: Colors.white,
            ),
      ),
    ),
    padding: EdgeInsets.zero,
    behavior: SnackBarBehavior.floating,
    margin: const EdgeInsets.symmetric(horizontal: 16, vertical: 16),
    showCloseIcon: true,
    backgroundColor: backgroundColor,
    closeIconColor: Colors.white,
    elevation: 5,
  ));
}
