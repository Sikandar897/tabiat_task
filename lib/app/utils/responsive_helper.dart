import 'package:flutter/widgets.dart';

class ResponsiveHelper {
  static bool isWideScreen(BoxConstraints constraints) {
    return constraints.maxWidth >= 600;
  }
  static double horizontalPadding(BoxConstraints constraints) {
    if (constraints.maxWidth >= 1200) return 64;
    if (constraints.maxWidth >= 900) return 40;
    if (constraints.maxWidth >= 600) return 24;
    return 16;
  }
}
