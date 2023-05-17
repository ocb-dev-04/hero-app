import 'package:flutter/material.dart';

/// Extension for [BuildContext] to manage navigation, loader and more
extension ContextActions on BuildContext {
  void navigateTo(String routeName) => Navigator.pushNamed(this, routeName);

  /// Pop navigator with optional data returned
  void back<T>({T? returnData}) => Navigator.pop(this, returnData);
}
