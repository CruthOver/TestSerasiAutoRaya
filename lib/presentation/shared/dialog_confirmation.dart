import 'package:flutter/material.dart';
import 'package:get/get.dart';
import 'package:test_serasi_raya/application/config/app_color.dart';

class DialogConfirmation {
  Future<void> showDialog({
    required String title,
    required String message,
    void Function()? onPressed,
  }) async {
    Get.dialog(
      AlertDialog(
        shape: RoundedRectangleBorder(
          borderRadius: BorderRadius.circular(10),
        ),
        backgroundColor: Colors.white,
        contentPadding: const EdgeInsets.only(
          right: 32,
          left: 32,
          top: 32,
          bottom: 16,
        ),
        alignment: Alignment.center,
        actionsAlignment: MainAxisAlignment.center,
        content: Column(
          mainAxisSize: MainAxisSize.min,
          children: [
            Stack(
              alignment: Alignment.center,
              children: [
                Container(
                  width: 22,
                  height: 22,
                  decoration: BoxDecoration(
                    borderRadius: BorderRadius.circular(36),
                    color: greenColor.withOpacity(0.2),
                  ),
                ),
                Container(
                  alignment: Alignment.center,
                  width: 50,
                  height: 50,
                  decoration: BoxDecoration(
                    borderRadius: BorderRadius.circular(24),
                    color: Colors.amberAccent,
                  ),
                  child: const Icon(
                    Icons.warning,
                    color: Colors.white,
                    size: 32,
                  ),
                ),
              ],
            ),
            const SizedBox(
              height: 8,
            ),
            Text(
              title,
              style: Theme.of(Get.context!).textTheme.titleMedium!.copyWith(
                    color: Colors.black,
                  ),
              textAlign: TextAlign.center,
            ),
            const SizedBox(
              height: 8,
            ),
            Text(
              message,
              style: Theme.of(Get.context!).textTheme.bodyMedium!.copyWith(
                    color: Colors.black,
                  ),
              textAlign: TextAlign.center,
            ),
          ],
        ),
        actions: [
          TextButton(
            onPressed: () => Get.back(),
            style: Theme.of(Get.context!).textButtonTheme.style!.copyWith(
                  backgroundColor: MaterialStateProperty.all(
                    greyColor,
                  ),
                  padding: MaterialStateProperty.all(EdgeInsets.zero),
                ),
            child: const Text("Cancel"),
          ),
          TextButton(
            onPressed: onPressed,
            style: Theme.of(Get.context!).textButtonTheme.style!.copyWith(
                  backgroundColor: MaterialStateProperty.all(
                    greenColor,
                  ),
                  padding: MaterialStateProperty.all(EdgeInsets.zero),
                ),
            child: const Text("OK"),
          )
          //   TextButton(
          //     style: Theme.of(Get.context!).textButtonTheme.style!.copyWith(
          //       shape: MaterialStateProperty.all(
          //         RoundedRectangleBorder(
          //           borderRadius: BorderRadius.circular(8),
          //         ),
          //       ),
          //       backgroundColor: MaterialStateProperty.all(
          //         greyColor,
          //       ),
          //       foregroundColor: MaterialStateProperty.all(
          //         greyColor,
          //       ),
          //       fixedSize: MaterialStateProperty.all(
          //         Size(20.w, 4.h),
          //       ),
          //     ),
          //     onPressed: () {
          //       Get.back();
          //     },
          //     child: const Text("Cancel"),
          //   ),
          //   TextButton(
          //     style: Theme.of(Get.context!).textButtonTheme.style!.copyWith(
          //       shape: MaterialStateProperty.all(
          //         RoundedRectangleBorder(
          //           borderRadius: BorderRadius.circular(8.sp),
          //         ),
          //       ),
          //       fixedSize: MaterialStateProperty.all(
          //         Size(20.w, 4.h),
          //       ),
          //     ),
          //     onPressed: onPressed,
          //     child: const Text("OK"),
          //   ),
        ],
      ),
      barrierDismissible: true,
    );
  }
}
