import 'package:flutter/material.dart';
import '../resources/values_manager.dart';

class ScreenBackground extends StatelessWidget {
  final String backGroundAsset;
  const ScreenBackground({super.key,required this.child, required this.backGroundAsset});

  final Widget child;
  @override
  Widget build(BuildContext context) {
    return SingleChildScrollView(
      child: Container(
        height: mediaQueryHeight(context),
        width: mediaQueryWidth(context),
        decoration: BoxDecoration(
          image: DecorationImage(
            image: AssetImage(backGroundAsset),
            fit: BoxFit.cover,
          ),
        ),
        child: child,
      ),
    );
  }
}
