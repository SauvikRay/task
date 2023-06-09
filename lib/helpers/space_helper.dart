import 'package:flutter/material.dart';

/// Contains useful consts to reduce boilerplate and duplicate code
class SpaceHelper {
  // Vertical spacing constants. Adjust to your liking.
  static const double _VerticalSpaceSmall = 10.0;
  static const double _VerticalSpaceMedium = 20.0;
  static const double _VerticalSpaceSemiLarge = 40.0;
  static const double _VerticalSpaceLarge = 60.0;

  // Vertical spacing constants. Adjust to your liking.
  static const double _HorizontalSpaceSmall = 10.0;
  static const double _HorizontalSpaceMedium = 20.0;
  static const double _HorizontalSpaceSemiLarge = 40.0;
  static const double _HorizontalSpaceLarge = 60.0;

  static const Widget verticalSpaceSmall =
      SizedBox(height: _VerticalSpaceSmall);
  static const Widget verticalSpaceMedium =
      SizedBox(height: _VerticalSpaceMedium);
  static const Widget verticalSpaceSemiLarge =
      SizedBox(height: _VerticalSpaceSemiLarge);
  static const Widget verticalSpaceLarge =
      SizedBox(height: _VerticalSpaceLarge);

  static const Widget horizontalSpaceSmall =
      SizedBox(width: _HorizontalSpaceSmall);
  static const Widget horizontalSpaceMedium =
      SizedBox(width: _HorizontalSpaceMedium);
  static const Widget horizontalSpaceSemiLarge =
      SizedBox(width: _HorizontalSpaceSemiLarge);
  static const Widget horizontalSpaceLarge =
      SizedBox(width: _HorizontalSpaceLarge);

  static Widget horizontalSpace(double width) => SizedBox(width: width);
  static Widget verticalSpace(double height) => SizedBox(height: height);
}