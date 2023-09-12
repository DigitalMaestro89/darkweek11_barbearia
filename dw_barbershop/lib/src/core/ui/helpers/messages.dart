import 'package:flutter/material.dart';
import 'package:top_snackbar_flutter/custom_snack_bar.dart';
import 'package:top_snackbar_flutter/top_snack_bar.dart';

sealed class Message {
  static void showError(String message, BuildContext context) {
    showTopSnackBar(
      Overlay.of(context),
      CustomSnackBar.error(message: message),
    );
  }

  static void showInfo(String message, BuildContext context) {
    showTopSnackBar(
      Overlay.of(context),
      CustomSnackBar.info(message: message),
    );
  }

  static void showSuccess(String message, BuildContext context) {
    showTopSnackBar(
      Overlay.of(context),
      CustomSnackBar.success(message: message),
    );
  }
}

extension Messages on BuildContext {
  void showError(String message) =>
      _showCommonSnackBar(CustomSnackBar.error(message: message));

  void showSuccess(String message) =>
      _showCommonSnackBar(CustomSnackBar.success(message: message));

  void showInfo(String message) =>
      _showCommonSnackBar(CustomSnackBar.info(message: message));

  void _showCommonSnackBar(Widget child) =>
      showTopSnackBar(Overlay.of(this), child);
}