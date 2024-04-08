import 'package:flutter/material.dart';
import '../../../../shared/resources/color_manager.dart';
import '../../../../shared/resources/font_manager.dart';
import '../../../../shared/resources/values_manager.dart';

class AlertButton extends StatelessWidget {
  AlertButton({
    Key? key,
    required this.name,
    required this.firstColor,
    required this.shadowColor,
    required this.endColor,
    required this.icon,
    required this.onTap,
    required this.baseColor,
    required this.borderRadius,
  }) : super(key: key);

  final String name;
  final Color baseColor;
  final Color firstColor;
  final Color shadowColor;
  final Color endColor;
  final String icon;
  final Function onTap;
  final borderRadius;

  @override
  Widget build(BuildContext context) {
    return InkWell(
      onTap: () => onTap(),
      child: Padding(
        padding: const EdgeInsets.all(AppPadding.p8),
        child: Row(
          children: [
            Expanded(
              child: Container(
                width: mediaQueryWidth(context) * .55,
                height: mediaQueryHeight(context) * .08,
                decoration: BoxDecoration(
                    color: baseColor,
                    borderRadius: BorderRadius.circular(borderRadius)),
                child: Padding(
                  padding: const EdgeInsets.all(AppPadding.p8),
                  child: Row(
                    children: [
                      Container(
                        width: mediaQueryWidth(context) / AppSize.s10,
                        height: mediaQueryHeight(context) / AppSize.s20,
                        decoration: BoxDecoration(
                            boxShadow: [
                              BoxShadow(
                                  offset: Offset(-7.0, 0.0),
                                  spreadRadius: AppSize.s2,
                                  color: shadowColor,
                                  blurRadius: AppSize.s15)
                            ],
                            gradient: LinearGradient(
                                begin: Alignment.topCenter,
                                end: Alignment.bottomCenter,
                                colors: [firstColor, endColor]),
                            color: ColorManager.red,
                            borderRadius: BorderRadius.circular(AppSize.s15)),
                        child: Image(
                          image: AssetImage(icon),
                        ),
                      ),
                      SizedBox(
                        width: mediaQueryWidth(context) / AppSize.s35,
                      ),
                      Expanded( // Add Expanded widget here
                        child: Text(name,
                            style: Theme.of(context)
                                .textTheme
                                .labelMedium!
                                .copyWith(
                                fontFamily: FontConstants.fontFamilyBaloo)),
                      ),
                    ],
                  ),
                ),
              ),
            )
          ],
        ),
      ),
    );
  }
}
