import 'package:flutter/material.dart';
import 'package:my_shelf_journey_mobile/src/core/constants/colors.dart';

class SuccessSnackBar {
  static void show(BuildContext context, String message) {
    ScaffoldMessenger.of(context).showSnackBar(
      SnackBar(
        backgroundColor: ColorConstants.green500,
        content: Text(message),
      ),
    );
  }
}
