import 'package:flutter/material.dart';
import 'package:time_picker_sheet/widget/composition/body.dart';
import 'package:time_picker_sheet/widget/composition/header.dart';
import 'package:time_picker_sheet/widget/composition/indicator.dart';
import 'package:time_picker_sheet/widget/provider/time_picker.dart';
import 'package:time_picker_sheet/widget/time_picker.dart';

/// Using date time format to initialize data and also for the final result.
/// the sheet only care about the hour and minute values, the other will be
/// ignored.
class TimePickerSheet extends TimePicker {
  /// you can set initial date time from screen, so if time picker sheet
  /// opened will be directly selected the time based on initialDateTime.
  /// but this is optional, if initialDateTime not set the selected time
  /// will be 0 because using _defaultDateTime.
  final DateTime? initialDateTime;

  /// will be used as a minute interval, the default value is 15 but you can
  /// adjust based on your needs from screen. if the value is 15 then the
  /// options will be 0, 15, 30, 45.
  final int minuteInterval;

  /// will be used as a hour interval, the default value is 1 but you can
  /// adjust based on your needs from screen. if the value is 1 then the
  /// options will be start from 0 to 23.
  final int hourInterval;

  /// max hour should be >= 0 && <= 24. outside the range will
  /// trigger an error on the screen.
  final int maxHour;

  /// min hour should be >= 0 && <= 24. outside the range will
  /// trigger an error on the screen.
  final int minHour;

  /// max minute should be >= 0 && <= 60. outside the range will
  /// trigger an error on the screen.
  final int maxMinute;

  /// min minute should be >= 0 && <= 60. outside the range will
  /// trigger an error on the screen.
  final int minMinute;

  /// to enable two digit format in time picker sheet,
  /// the default value is false. When this format enabled
  /// the return value/result is still using one digit. Ex:
  /// you select 03:45 then the result would be 3:45. so you
  /// don't need to reformat or mapping anything on the screen.
  final bool twoDigit;

  final IconData sheetCloseIcon;

  final Color sheetCloseIconColor;

  /// title on the top of the sheet.
  final String sheetTitle;

  /// you can customize the style to align with your requirement.
  final TextStyle sheetTitleStyle;

  final String minuteTitle;

  final TextStyle minuteTitleStyle;

  final String hourTitle;

  final TextStyle hourTitleStyle;

  final TextStyle wheelNumberItemStyle;

  final TextStyle wheelNumberSelectedStyle;

  final String saveButtonText;

  final Color saveButtonColor;

  late final _now = DateTime.now();

  /// if initialDateTime is null, then default time will be used.
  late final _defaultDateTime = DateTime(
    _now.year,
    _now.month,
    _now.day,
    0,
    0,
    0,
  );

  TimePickerSheet({
    Key? key,
    required this.sheetTitle,
    required this.minuteTitle,
    required this.hourTitle,
    required this.saveButtonText,
    this.initialDateTime,
    this.minuteInterval = 15,
    this.hourInterval = 1,
    this.minHour = 0,
    this.maxHour = 24,
    this.minMinute = 0,
    this.maxMinute = 60,
    this.twoDigit = true,
    this.sheetCloseIcon = Icons.close,
    this.sheetCloseIconColor = Colors.redAccent,
    this.saveButtonColor = Colors.redAccent,
    this.sheetTitleStyle = const TextStyle(
      fontWeight: FontWeight.bold,
      fontSize: 16,
    ),
    this.hourTitleStyle = const TextStyle(
      fontWeight: FontWeight.bold,
      color: Colors.redAccent,
      fontSize: 16,
    ),
    this.minuteTitleStyle = const TextStyle(
      fontWeight: FontWeight.bold,
      color: Colors.redAccent,
      fontSize: 16,
    ),
    this.wheelNumberItemStyle = const TextStyle(
      fontSize: 14,
    ),
    this.wheelNumberSelectedStyle = const TextStyle(
      fontWeight: FontWeight.bold,
      color: Colors.redAccent,
      fontSize: 16,
    ),
  })  : assert(minHour >= 0 && minHour <= 24),
        assert(maxHour >= 0 && maxHour <= 24),
        assert(minMinute >= 0 && maxMinute <= 60),
        assert(maxMinute >= 0 && maxMinute <= 60),
        super(key: key);

  @override
  Widget build(BuildContext context) {
    final halfOfScreen = MediaQuery.of(context).size.height / 2;

    return TimePickerProvider(
      sheetCloseIcon: sheetCloseIcon,
      sheetCloseIconColor: sheetCloseIconColor,
      sheetTitle: sheetTitle,
      sheetTitleStyle: sheetTitleStyle,
      minuteTitle: minuteTitle,
      minuteTitleStyle: minuteTitleStyle,
      hourTitle: hourTitle,
      hourTitleStyle: hourTitleStyle,
      wheelNumberItemStyle: wheelNumberItemStyle,
      wheelNumberSelectedStyle: wheelNumberSelectedStyle,
      saveButtonText: saveButtonText,
      saveButtonColor: saveButtonColor,
      twoDigit: twoDigit,
      child: SizedBox(
        height: halfOfScreen,
        child: SafeArea(
          child: Column(
            children: [
              const SheetHeader(),
              const SizedBox(height: 16),
              Expanded(
                child: Stack(
                  children: [
                    const TimePickerIndicator(),
                    TimePickerBody(
                      dateTime: initialDateTime ?? _defaultDateTime,
                      itemHeight: 40,
                      /// normalize the interval to be have positive
                      /// value if somehow the interval is negative.
                      minuteInterval: minuteInterval.abs(),
                      /// normalize the interval to be have positive
                      /// value if somehow the interval is negative.
                      hourInterval: hourInterval.abs(),
                      maxHour: maxHour,
                      minHour: minHour,
                      maxMinute: maxMinute,
                      minMinute: minMinute,
                      visibleItems: 3,
                    ),
                  ],
                ),
              ),
            ],
          ),
        ),
      ),
    );
  }
}
