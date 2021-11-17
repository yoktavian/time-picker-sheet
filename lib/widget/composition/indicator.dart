import 'package:flutter/material.dart';

class TimePickerIndicator extends StatelessWidget {
  final Color color;

  final double itemHeight;

  const TimePickerIndicator({
    Key? key,
    this.color = Colors.black12,
    this.itemHeight = 40,
  }) : super(key: key);

  @override
  Widget build(BuildContext context) {
    return Positioned(
      /// 20 height of header, 24 margin.
      top: 20 + 24 + itemHeight,
      left: 0,
      right: 0,
      child: Container(
        height: itemHeight,
        color: color,
      ),
    );
  }
}
