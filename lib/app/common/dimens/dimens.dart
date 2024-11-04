import 'package:flutter/material.dart';

const extraSmallSize = 4.0;
const smallSize = 8.0;
const normalSize = 14.0;
const mediumSize = 16.0;
const largeSize = 24.0;
const extraLargeSize = 30.0;
const extraExtraLargeSize = 40.0;

class AppTextStyles{
  static const headerStyle = TextStyle(
    fontSize: extraExtraLargeSize,
    fontWeight: FontWeight.bold,
  );

  static const subHeaderStyle = TextStyle(
    fontSize: normalSize,
    fontWeight: FontWeight.w500,
  );

  static const largeVerticalSpacing = SizedBox(
    height: 30,
  );

  static const mediumVerticalSpacing = SizedBox(
    height: 20,
  );

  static const smallVerticalSpacing = SizedBox(
    height: 10,
  );

  static const largeHorizontalSpacing = SizedBox(
    width: 30,
  );

  static const mediumHorizontalSpacing = SizedBox(
    width: 20,
  );

  static const smallHorizontalSpacing = SizedBox(
    width: 10,
  );
}