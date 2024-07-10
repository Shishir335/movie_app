import 'package:flutter/material.dart';
import 'package:intl/intl.dart';

Widget horizontalGap([double width = 20]) {
  return SizedBox(width: width);
}

Widget verticalGap([double height = 20]) {
  return SizedBox(height: height);
}

formatDate(DateTime? date, {String format = 'yyyy-MM-dd HH:mm'}) {
  return DateFormat(format).format(date!);
}
