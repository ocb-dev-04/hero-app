import 'package:app/src/presentation/global_widgets/circular_loader.widget.dart';
import 'package:flutter/material.dart';

class ImageWidget extends StatelessWidget {
  const ImageWidget({super.key, required this.path, this.height = 200});
  final String path;
  final double height;

  @override
  Widget build(BuildContext context) {
    return SizedBox(
      height: height,
      child: Image.network(
        path,
        height: height,
        fit: BoxFit.cover,
        loadingBuilder: (context, child, loadingProgress) {
          if (loadingProgress == null) {
            return child;
          }
          return const CustomCircularLoader();
        },
        errorBuilder: (context, error, stackTrace) => const Text("Error"),
      ),
    );
  }
}
