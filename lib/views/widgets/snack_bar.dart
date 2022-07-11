 import 'package:flutter/material.dart';
import 'package:get/get.dart';

import '../../core/app_colors.dart';

showNoticeSnackBar(String title, String message) {
  Get.snackbar(
    title,
    message,
    duration: const Duration(milliseconds: 600),
    backgroundColor: Colors.white54,
    colorText: PRIMARY_COLOR.withOpacity(0.9),
  );
}
