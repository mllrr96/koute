import 'package:flutter/material.dart';
import 'package:flutter/services.dart';

extension BuildContextExtension on BuildContext {
  /// Returns the current theme of the application.
  ThemeData get theme => Theme.of(this);

  bool get isDarkMode => theme.brightness == Brightness.dark;

  SystemUiOverlayStyle get systemUiOverlayStyle {
    return isDarkMode
        ? SystemUiOverlayStyle.light.copyWith(
            systemNavigationBarColor: theme.scaffoldBackgroundColor,
            statusBarColor: theme.scaffoldBackgroundColor,
            statusBarIconBrightness: Brightness.light,
          )
        : SystemUiOverlayStyle.dark.copyWith(
            systemNavigationBarColor: theme.scaffoldBackgroundColor,
            statusBarColor: theme.scaffoldBackgroundColor,
            statusBarIconBrightness: Brightness.dark,
          );
  }
}
