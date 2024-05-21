import 'package:flutter/material.dart';
import 'package:my_shelf_journey_mobile/src/core/constants/colors.dart';

class ErrorSnackBar {
  static void show(BuildContext context, String message) {
    ScaffoldMessenger.of(context).showSnackBar(
      SnackBar(
        backgroundColor: ColorConstants.red500,
        content: Text(message),
      ),
    );
  }
}
