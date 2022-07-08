import 'package:flutter/material.dart';

class ColorManager {
  static Color primary = HexColor.fromHex("#902121");
  static Color primaryLight = HexColor.fromHex("#F4EDED");
  static Color darkGrey = HexColor.fromHex("#525252");
  static Color grey = HexColor.fromHex("#737477");
  static Color black = Colors.black;
  static Color lightBlack = Colors.black.withOpacity(.4);
  static Color lightGrey = HexColor.fromHex("#9E9E9E");
  static Color borderColor = HexColor.fromHex("#9E9E9E");
  static Color primaryOpacity70 = HexColor.fromHex("#B3ED9728");
  static Color backgroundColor = HexColor.fromHex("#FAFAFA");
  static Color bannerColor = HexColor.fromHex("#F3EDED");
  static Color dividerColor = HexColor.fromHex("#707070");
  static Color ratingColor = HexColor.fromHex("#F07922");

  // new colors
  static Color darkPrimary = HexColor.fromHex("#d17d11");
  static Color grey1 = HexColor.fromHex("#707070");
  static Color grey2 = HexColor.fromHex("#F4F4F4");
  static Color white = HexColor.fromHex("#FFFFFF");
  static Color error = HexColor.fromHex("#e61f34"); // red color
  static Color softPeach = HexColor.fromHex("#F4EDED"); // red color

  // border light shadow color
  static Color borderShadow = Color.fromARGB(146, 226, 226, 226);
  static Color lightBackgroundGrey = Color.fromARGB(255, 243, 243, 243);
}

extension HexColor on Color {
  static Color fromHex(String hexColorString) {
    hexColorString = hexColorString.replaceAll('#', '');
    if (hexColorString.length == 6) {
      hexColorString = "FF" + hexColorString; // 8 char with opacity 100%
    }
    return Color(int.parse(hexColorString, radix: 16));
  }
}
