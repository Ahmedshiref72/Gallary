import 'dart:ui';

import 'font_manager.dart';

TextStyle _getTextStyle(
    double fontSize, FontWeight fontWeight, Color fontColor) {
  return TextStyle(
      fontFamily: FontConstants.fontFamilySegoe,
      fontSize: fontSize,
      fontWeight: fontWeight,
      color: fontColor);
}

// regular style

TextStyle getRegularStyle(
    {double fontSize = FontSize.s12, required Color fontColor}) {
  return _getTextStyle(fontSize, FontWeightManager.regular, fontColor);
}

// medium style

TextStyle getMediumStyle(
    {double fontSize = FontSize.s12, required Color fontColor}) {
  return _getTextStyle(fontSize, FontWeightManager.medium, fontColor);
}
// light style

TextStyle getLightStyle(
    {double fontSize = FontSize.s12, required Color fontColor}) {
  return _getTextStyle(fontSize, FontWeightManager.light, fontColor);
}
// bold style

TextStyle getBoldStyle(
    {double fontSize = FontSize.s12, required Color fontColor}) {
  return _getTextStyle(fontSize, FontWeightManager.bold, fontColor);
}
// semiBold style

TextStyle getSemiBoldStyle(
    {double fontSize = FontSize.s12, required Color fontColor}) {
  return _getTextStyle(fontSize, FontWeightManager.semiBold, fontColor);
}
