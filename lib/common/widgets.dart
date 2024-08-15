import "package:flutter/material.dart";
import "package:flutterinterviewproject/common/app_colors.dart";
import "package:get/get.dart";

class AppWidgets {
  SnackbarController appPopup({
    required String title,
    required String message,
  }) {
    return Get.snackbar(
      title,
      message,
      snackPosition: SnackPosition.TOP,
      dismissDirection: DismissDirection.horizontal,
      backgroundColor: AppColors.appPrimeryColor,
      colorText: Colors.white,
    );
  }
}
