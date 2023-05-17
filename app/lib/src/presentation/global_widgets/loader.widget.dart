import 'package:app/src/presentation/global_widgets/circular_loader.widget.dart';
import 'package:flutter/material.dart';

class LoaderView extends StatelessWidget {
  const LoaderView({
    super.key,
    required this.error,
    required this.loading,
    required this.child,
  });

  final bool error;
  final bool loading;
  final Widget child;

  @override
  Widget build(BuildContext context) {
    return error
        ? const Center(
            child: Text(
              "Error",
              style: TextStyle(color: Colors.white),
            ),
          )
        : loading
            ? const CustomCircularLoader()
            : child;
  }
}
