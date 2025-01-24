import 'package:flutter/material.dart';
import 'package:my_flutter_template_v2/utils/contants/asset_dir.dart';


class MTextStyle {
  static TextStyle publicSansBlackStyle({
    double? fontSize,
    Color? textColor,
    FontWeight? fontWeight,
  }) {
    return TextStyle(
      fontFamily: AssetDir.PublicSansBlack,
      fontSize: fontSize,
      color: textColor,
      fontWeight: fontWeight,
    );
  }

  static TextStyle? publicSansRegularStyle({
    double? fontSize,
    Color? textColor,
    FontWeight? fontWeight,
  }) {
    return TextStyle(
      fontFamily: AssetDir.PublicSansRegular,
      fontSize: fontSize,
      color: textColor,
      fontWeight: fontWeight,
    );
  }

  static TextStyle publicSansBoldStyle({
    double? fontSize,
    Color? textColor,
    FontWeight? fontWeight,
  }) {
    return TextStyle(
      fontFamily: AssetDir.PublicSansBold,
      fontSize: fontSize,
      color: textColor,
      fontWeight: fontWeight,
    );
  }

  static TextStyle publicSansThinStyle({
    double? fontSize,
    Color? textColor,
    FontWeight? fontWeight,
  }) {
    return TextStyle(
      fontFamily: AssetDir.PublicSansThin,
      fontSize: fontSize,
      color: textColor,
      fontWeight: fontWeight,
    );
  }

  static TextStyle publicSansMediumStyle({
    double? fontSize,
    Color? textColor,
    FontWeight? fontWeight,
  }) {
    return TextStyle(
      fontFamily: AssetDir.PublicSansMedium,
      fontSize: fontSize,
      color: textColor,
      fontWeight: fontWeight,
    );
  }

  static TextStyle publicSansLightStyle({
    double? fontSize,
    Color? textColor,
    FontWeight? fontWeight,
  }) {
    return TextStyle(
      fontFamily: AssetDir.PublicSansLight,
      fontSize: fontSize,
      color: textColor,
      fontWeight: fontWeight,
    );
  }

  static TextStyle publicSansExtraBoldStyle({
    double? fontSize,
    Color? textColor,
    FontWeight? fontWeight,
  }) {
    return TextStyle(
      fontFamily: AssetDir.PublicSansExtraBold,
      fontSize: fontSize,
      color: textColor,
      fontWeight: fontWeight,
    );
  }

  static TextStyle publicSansExtraLightStyle({
    double? fontSize,
    Color? textColor,
    FontWeight? fontWeight,
  }) {
    return TextStyle(
      fontFamily: AssetDir.PublicSansExtraLight,
      fontSize: fontSize,
      color: textColor,
      fontWeight: fontWeight,
    );
  }

  static TextStyle publicSansSemiBoldStyle({
    double? fontSize,
    Color? textColor,
    FontWeight? fontWeight,
  }) {
    return TextStyle(
      fontFamily: AssetDir.PublicSansSemiBold,
      fontSize: fontSize,
      color: textColor,
      fontWeight: fontWeight,
    );
  }
}