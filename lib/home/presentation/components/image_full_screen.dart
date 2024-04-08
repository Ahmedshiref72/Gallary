
import 'package:flutter/material.dart';
class ImageFullScreen extends StatelessWidget {
  final List<String> images;
  final int initialIndex;

  ImageFullScreen({required this.images, required this.initialIndex});

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      backgroundColor: Colors.black,
      body: PageView.builder(
        itemCount: images.length,
        controller: PageController(initialPage: initialIndex),
        itemBuilder: (context, index) {
          return Center(
            child: Image.network(
              images[index],
              fit: BoxFit.contain,
            ),
          );
        },
      ),
    );
  }
}
