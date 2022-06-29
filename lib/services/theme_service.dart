import 'package:flutter/material.dart';

class ThemeService {
  /* TextStyle*/
  static TextStyle textStyle1() {
    return const TextStyle(
      fontSize: 35,
      color: Colors.black,
    );
  }

  static TextStyle textStyle2() {
    return const TextStyle(
      fontSize: 14,
      color: Color(0xff5835E5),
    );
  }

  static TextStyle textStyle3() {
    return const TextStyle(
      fontSize: 14,
      color: Colors.white,
      fontWeight: FontWeight.bold,
    );
  }

  static TextStyle textStyle4() {
    return const TextStyle(
      fontSize: 22,
      color: Color(0xFF1C1B1F),
      fontFamily: 'Roboto',
      fontWeight: FontWeight.w400,
      letterSpacing: 0.5,
    );
  }

  /// Size: 16, color: 1C1B1F, w 500, H: 24
  static TextStyle textStyleBody({double? letterSpacing, Color? color}) {
    return TextStyle(
      fontSize: 16,
      color: color ?? colorBlack,
      fontFamily: 'Roboto',
      fontWeight: FontWeight.w600,
      letterSpacing: letterSpacing,
    );
  }

  /// Size 14, color: 5946D2, w 500, H: 20
  static TextStyle textStyleCaption({double? letterSpacing, Color? color}){
    return TextStyle(
      fontSize: 14,
      color: color ?? colorMain,
      fontFamily: 'Roboto',
      fontWeight: FontWeight.w500,
      letterSpacing: letterSpacing,
    );
  }

  /// Size: 12, color: 5946D2, w: 500, H: 20
  static TextStyle textStyleSearch({double? letterSpacing, Color? color}){
    return TextStyle(
      fontSize: 12,
      color: color ?? colorMain,
      fontFamily: 'Roboto',
      fontWeight: FontWeight.w500,
      letterSpacing: letterSpacing,
    );
  }

  /// Size: 22, color: 1C1B1F, w: 400, H: 28
  static TextStyle textStyleHeader({double? letterSpacing, Color? color}) {
    return TextStyle(
      fontSize: 22,
      color: color ?? colorBlack,
      fontFamily: "Roboto",
      fontWeight: FontWeight.w400,
      // height: 28,
      letterSpacing: letterSpacing,
    );
  }

  /*Colors*/

  /// color FFFFFF
  static const colorBackroundLight = Colors.white;

  /// color FFFFFF
  static const colorBAckroundLightHome = Colors.white;

  /// color 1C1B1F
  static const colorBlack = Color(0xFF1C1B1F);

  /// color: 5835E5
  static const colorContent = Color(0xFF5835E5);

  /// color: 5946D2
  static const colorMain = Color(0xFF5946D2);

  /// color: 1C1B1F; opacity: 16%
  static final Color colorBottomTextField =
      const Color(0xFF1C1B1F).withOpacity(0.16);

  /// color: 1C1B1F; opacity: 38%
  static final Color colorUnselected =
      const Color(0xFF1C1B1F).withOpacity(0.38);

  /// color: 1C1B1F; opacity: 60%
  static final Color colorSubtitle = const Color(0xFF1C1B1F).withOpacity(0.60);

  /// color: F85977
  static const colorPink = Color(0xFFF85977);

  /// color: E5DFF9
  static const colorSelectedButton = Color(0xFFE5DFF9);

  /// color: 5946D2 opacity: 50%
  static final colorMainTask = const Color(0xFF5946D2).withOpacity(0.5);

  static const colorButtonText = Color(0xFFA5A0AC);

  static const colorBlackButtonText = Color(0xFF160067);

  static const colorTextFieldBack = Color(0xffFAF9FB);


  static const colorDeleteContent = Color.fromRGBO(28, 27, 31, 0.38);
}
