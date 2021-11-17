import 'package:flutter/material.dart';

abstract class TimePicker extends StatelessWidget {
  const TimePicker({Key? key}) : super(key: key);

  static Future<T?> show<T>({
    required BuildContext context,
    required TimePicker sheet,
    bool dismissible = true,
    double roundedCorner = 8.0,
  }) async {
    return await showModalBottomSheet(
      context: context,
      isScrollControlled: true,
      enableDrag: dismissible,
      shape: RoundedRectangleBorder(
        borderRadius: BorderRadius.circular(roundedCorner),
      ),
      isDismissible: dismissible,
      builder: (_) {
        return sheet;
      },
    );
  }
}
