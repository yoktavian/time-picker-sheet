import 'package:flutter/material.dart';

/// TimePickerProvider is an inherited widget that created to
/// holding state in the top of another widget. So all of the props
/// in the TimePickerProvider can be consume directly by the children
/// of the widget. But this can only consumed in the build scope, so if
/// you have state and need to consume in the initState you can't use this,
/// you need to pass the state via constructor instead.
class TimePickerProvider extends InheritedWidget {
  final IconData sheetCloseIcon;

  final Color sheetCloseIconColor;

  final String sheetTitle;

  final TextStyle sheetTitleStyle;

  final String minuteTitle;

  final TextStyle minuteTitleStyle;

  final String hourTitle;

  final TextStyle hourTitleStyle;

  final TextStyle wheelNumberItemStyle;

  final TextStyle wheelNumberSelectedStyle;

  final Color saveButtonColor;

  final String saveButtonText;

  final bool twoDigit;

  const TimePickerProvider({
    Key? key,
    required this.sheetCloseIcon,
    required this.sheetCloseIconColor,
    required this.sheetTitle,
    required this.sheetTitleStyle,
    required this.minuteTitle,
    required this.minuteTitleStyle,
    required this.hourTitle,
    required this.hourTitleStyle,
    required this.wheelNumberItemStyle,
    required this.wheelNumberSelectedStyle,
    required this.saveButtonText,
    required this.saveButtonColor,
    required this.twoDigit,
    required Widget child,
  }) : super(key: key, child: child);

  static TimePickerProvider of(BuildContext ctx) {
    final widget = ctx.dependOnInheritedWidgetOfExactType<TimePickerProvider>();
    assert(widget != null, 'TimePickerProvider not found in the context');

    return widget!;
  }

  /// doesn't need to update the widget, because
  /// it is only needed to hold the state.
  @override
  bool updateShouldNotify(covariant InheritedWidget oldWidget) => false;
}
