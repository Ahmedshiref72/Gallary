import 'package:flutter/material.dart';
import 'dart:ui';
import '../../../../shared/resources/color_manager.dart';
import '../../../../shared/resources/values_manager.dart';
class LoginClipRect extends StatelessWidget {
final Widget child;
 const LoginClipRect({super.key,  required this.child});
  @override
  Widget build(BuildContext context) {
    return  ClipRect(
      child: BackdropFilter(
        filter: ImageFilter.blur(
            sigmaX: AppSize.s10, sigmaY: AppSize.s10),
        child: Container(
          height: mediaQueryHeight(context) / AppSize.s2_5,
          decoration: BoxDecoration(
              color: ColorManager.white
                  .withOpacity(ColorManager.opacity),
              borderRadius:
              BorderRadius.circular(AppSize.s32)),
          child: Padding(
            padding: EdgeInsets.symmetric(
                vertical:
                mediaQueryHeight(context) / AppSize.s60,
                horizontal:
                mediaQueryWidth(context) / AppSize.s10),
            child: child,
          ),
        ),
      ),
    );
  }
}
