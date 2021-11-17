# Time Picker Sheet
A Time picker sheet library for flutter. You can also customize the widget inside the sheet to align with your requirement.

<img src="https://github.com/yoktavian/time-picker-sheet/blob/master/screenshot/simulator.png" style="width: 100%"/></br></br>

# How to use
This is really simple and to the point actually, simply by doing this then your time picker sheet will goes up.
```dart
TimePicker.show(
    context: context,
    sheet: TimePickerSheet(
        sheetTitle: 'Set meeting schedule',
        hourTitle: 'Hour',
        minuteTitle: 'Minute',
        saveButtonText: 'Save',
    ),
);
```
If you wanna get the result from the time picker sheet then what you have to do is await the result. As you know if we wanna await the result
we need to do it as an async process right? so please make sure to do so. The code must be like this
```dart
final result = await TimePicker.show<DateTime?>(
    context: context,
    sheet: TimePickerSheet(
        sheetTitle: 'Set meeting schedule',
        hourTitle: 'Hour',
        minuteTitle: 'Minute',
        saveButtonText: 'Save',
    ),
);

```
the result from the sheet is should be nullable `DateTime`, if user closed the sheet the result will be null, but if the user click on the save button
then the result should be the selected time as a DateTime, so you can get the hour & the minute.

# Customize
What you can customize?

- Sheet title including the style
- Sheet close icon including the color
- Title hour including the style
- Title minute including the style
- Selected hour & minute including the style
- Save button color & text
- 1 or 2 digit format
  - the default format is 2 digit
- Hour interval with min & max value
  - the default interval is 1, so the options will be started from 0 to 23
- Minute interval with min & max value
  - the default interval is 15, so the options will be 0, 15, 30, 45
- Initial date time
    - to make sure when your sheet goes up it select the right time. by default this is set to 00:00

All these things already have default value, so if you want to change one of them please make sure to set it via constructor.