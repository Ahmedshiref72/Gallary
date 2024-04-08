import 'package:flutter/material.dart';
import '../../../../shared/resources/color_manager.dart';
import '../../../../shared/resources/values_manager.dart';

class MainButton extends StatelessWidget {
  MainButton({
    Key? key,
    required this.title,
    required this.onPressed,
    this.color,
  }) : super(key: key);

  final String title;
  final Function onPressed;
  Color? color;

  @override
  Widget build(BuildContext context) {
    return SizedBox(
        width: double.infinity,
        height: mediaQueryHeight(context) / AppSize.s20,
        child: MaterialButton(
          shape: RoundedRectangleBorder(
            borderRadius: BorderRadius.circular(AppSize.s10),
          ),
          onPressed: () => onPressed(),
          color: color ?? ColorManager.lightBlue,
          child: Text(title, style: Theme.of(context).textTheme.headlineMedium),
        ));
  }
}
