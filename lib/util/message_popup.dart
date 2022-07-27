import 'package:flutter/material.dart';

import '/router.dart';

/// Helper to display a popup message in UI.
class MessagePopup {
  /// Shows an error popup with the provided argument.
  static Future<void> error(dynamic e) async {
    await showDialog(
      context: router.context!,
      builder: (context) => AlertDialog(
        title: const Text('label_error'),
        content: Text(e),
        actions: [
          TextButton(
            onPressed: () => Navigator.of(router.context!).pop(),
            child: const Text('btn_ok'),
          )
        ],
      ),
    );
  }

  /// Shows an alert popup with [title], [description] and `yes`/`no` buttons
  /// that returns `true`, `false` or `null` based on the button that was
  /// pressed.
  static Future<bool?> alert(String title, {String? description}) => showDialog(
        context: router.context!,
        builder: (context) => AlertDialog(
          key: const Key('AlertDialog'),
          title: Text(title),
          content: description == null ? null : Text(description),
          actions: [
            TextButton(
              key: const Key('AlertNoButton'),
              child: const Text('label_are_you_sure_no'),
              onPressed: () => Navigator.pop(context, false),
            ),
            TextButton(
              key: const Key('AlertYesButton'),
              child: const Text('label_are_you_sure_yes'),
              onPressed: () => Navigator.pop(context, true),
            ),
          ],
        ),
      );

  /// Shows a [SnackBar] with the [title] message.
  static void success(String title) =>
      ScaffoldMessenger.of(router.context!).showSnackBar(
        SnackBar(
          content: Text(title),
          width: 250,
          behavior: SnackBarBehavior.floating,
          shape: RoundedRectangleBorder(
            borderRadius: BorderRadius.circular(10),
          ),
        ),
      );
}
