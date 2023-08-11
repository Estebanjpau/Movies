import 'package:flutter/material.dart';

@immutable
class MoviesTextStyle {

  static const String _fontLight = "Poppins-Light";
  static const String _fontRegular = "Poppins-Regular";
  static const String _fontMedium = "Poppins-Medium";
  static const String _fontBold = "Poppins-Bold";

  const MoviesTextStyle._();

  static TextStyle head1({Color color = Colors.black}) {
    return TextStyle(
      fontFamily: _fontBold,
      fontSize: 30,
      color: color,
    );
  }

  static TextStyle head2({Color color = Colors.black}) {
    return TextStyle(
      fontFamily: _fontBold,
      fontWeight: FontWeight.w800,
      fontSize: 24,
      color: color,
    );
  }

  static TextStyle head3({Color color = Colors.black}) {
    return TextStyle(
      fontFamily: _fontBold,
      fontWeight: FontWeight.bold,
      fontSize: 20,
      color: color,
    );
  }

  static TextStyle head4({Color color = Colors.black}) {
    return TextStyle(
      fontFamily: _fontBold,
      fontWeight: FontWeight.bold,
      fontSize: 18,
      color: color,
    );
  }

  static TextStyle subtitle1({Color color = Colors.black}) {
    return TextStyle(
      fontFamily: _fontMedium,
      fontWeight: FontWeight.w500,
      fontSize: 16,
      color: color,
    );
  }

  static TextStyle label({Color color = Colors.black}) {
    return TextStyle(
      fontFamily: _fontMedium,
      fontWeight: FontWeight.w800,
      fontSize: 14,
      color: color,
    );
  }

  static TextStyle paragraphM({Color color = Colors.grey}) {
    return TextStyle(
      fontFamily: _fontLight,
      fontWeight: FontWeight.w600,
      fontSize: 14,
      color: color,
    );
  }

  static TextStyle paragraphS({Color color = Colors.grey}) {
    return TextStyle(
      fontFamily: _fontRegular,
      fontWeight: FontWeight.w600,
      fontSize: 13,
      color: color,
    );
  }
}