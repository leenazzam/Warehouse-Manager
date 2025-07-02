import 'package:flutter/material.dart';

TextStyle getTitleStyle({
  double? fontSize,
  FontWeight? fontWeight,
  Color? color,
}) {
  return TextStyle(
    fontSize: fontSize ?? 24,
    fontWeight: fontWeight ?? FontWeight.bold,
    color: color ?? Colors.black,
  );
}

TextStyle getBodyStyle({
  double? fontSize,
  FontWeight? fontWeight,
  Color? color,
}) {
  return TextStyle(
    fontSize: fontSize ?? 16,
    fontWeight: fontWeight ?? FontWeight.normal,
    color: color ?? Colors.black87,
  );
}

TextStyle getCaptionStyle({
  double? fontSize,
  FontWeight? fontWeight,
  Color? color,
}) {
  return TextStyle(
    fontSize: fontSize ?? 12,
    fontWeight: fontWeight ?? FontWeight.w300,
    color: color ?? Colors.grey,
  );
}
