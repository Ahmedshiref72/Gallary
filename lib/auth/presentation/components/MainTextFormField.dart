import 'package:flutter/material.dart';
import '../../../../shared/resources/color_manager.dart';
import '../../../../shared/resources/values_manager.dart';

class MainTextFormField extends StatelessWidget {
  MainTextFormField({
    Key? key,
    required this.controller,
    required this.label,
    required this.validator,
    required this.inputType,
    this.hint,
    this.maxLines,
    this.focusColor,
    this.hintColor,
    this.icon,
    this.suffixIcon,
    this.textDirection,
    required this.isObsecured,
  }) : super(key: key);
  final TextEditingController controller;
  final String? Function(String?)? validator;
  final String label;
  final TextInputType inputType;
  String? hint;
  Color? focusColor;
  Color? hintColor;
  Widget? icon;
  Widget? suffixIcon;
  TextDirection? textDirection;
  int? maxLines;
  bool isObsecured = false;

  @override
  Widget build(BuildContext context) {
    return TextFormField(
      obscureText: isObsecured,
      onEditingComplete: () => FocusScope.of(context).nextFocus(),
      validator: validator,
      controller: controller,
      keyboardType: inputType,
      maxLines: maxLines ?? AppSize.si1,
      textAlignVertical: TextAlignVertical.center,
      // cursorHeight: AppSize.s30,
      style: Theme.of(context).textTheme.titleSmall,
      decoration: InputDecoration(
        contentPadding: EdgeInsets.symmetric(
            vertical: mediaQueryHeight(context) / AppSize.s60,
            horizontal: mediaQueryWidth(context) / AppSize.s20),
        alignLabelWithHint: true,
        isCollapsed: true,
        filled: true,
        fillColor: focusColor,
        focusColor: focusColor,
        hintText: hint ?? '',
        hintStyle: Theme.of(context).textTheme.titleSmall,
        label: Text(label, style: Theme.of(context).textTheme.titleSmall),
        suffixIcon: suffixIcon,
        focusedBorder: _outlineInputBorder(),
        enabledBorder: _outlineInputBorderStyle(),
        errorBorder: _outlineInputBorderErrorStyle(),
      ),
    );
  }
}

OutlineInputBorder _outlineInputBorder() {
  return const OutlineInputBorder(
    borderSide: BorderSide(
      color: ColorManager.blue,
      width: AppSize.s0_5,
    ),
    borderRadius: BorderRadius.all(
      Radius.circular(AppSize.s22),
    ),
  );
}

OutlineInputBorder _outlineInputBorderStyle() {
  return const OutlineInputBorder(
    borderSide: BorderSide(
      color: ColorManager.white,
      width: AppSize.s0_5,
    ),
    borderRadius: BorderRadius.all(
      Radius.circular(AppSize.s22),
    ),
  );
}

OutlineInputBorder _outlineInputBorderErrorStyle() {
  return const OutlineInputBorder(
    borderSide: BorderSide(
      color: ColorManager.red,
      width: AppSize.s0,
    ),
    borderRadius: BorderRadius.all(
      Radius.circular(AppSize.s22),
    ),
  );
}
