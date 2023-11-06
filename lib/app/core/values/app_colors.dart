import 'package:flutter/material.dart';

abstract class AppColors {
  //neutral
  static const Color neutral50 = Color(0xFFECEFF1);
  static const Color neutral100 = Color(0xCACFD8DC);
  static const Color neutral200 = Color(0xFFB0BEC5);
  static const Color neutral300 = Color(0xFF90A4AE);
  static const Color neutral400 = Color(0xFF78909C);
  static const Color neutral500 = Color(0xFF607D8B);
  static const Color neutral600 = Color(0xFF546E7A);
  static const Color neutral700 = Color(0xFF455A64);
  static const Color neutral800 = Color(0xFF37474F);
  static const Color neutral900 = Color(0xFF263238);

  //primary
  static const Color primary50 = Color(0xFFF2F7FF);
  static const Color primary100 = Color(0xFFD6E4FF);
  static const Color primary200 = Color(0xFFADC8FF);
  static const Color primary300 = Color(0xFF84A9FF);
  static const Color primary400 = Color(0xFF6690FF);
  static const Color primary500 = Color(0xFF3366FF);
  static const Color primary600 = Color(0xFF254EDB);
  static const Color primary700 = Color(0xFF1939B7);
  static const Color primary800 = Color(0xFF102693);
  static const Color primary900 = Color(0xFF091A7A);

  //secondary
  static const Color secondary50 = Color(0xFFD9F2EE);
  static const Color secondary100 = Color(0xFF92E9DC);
  static const Color secondary200 = Color(0xFF03DAC4);
  static const Color secondary300 = Color(0xFF00C7AB);
  static const Color secondary400 = Color(0xFF00B798);
  static const Color secondary500 = Color(0xFF00A885);
  static const Color secondary600 = Color(0xFF009A77);
  static const Color secondary700 = Color(0xFF008966);
  static const Color secondary800 = Color(0xFF007957);
  static const Color secondary900 = Color(0xFF005B39);

  //info
  static const Color info50 = Color(0xFFE2FEFE);
  static const Color info100 = Color(0xFFD5FEFE);
  static const Color info200 = Color(0xFFACF8FE);
  static const Color info300 = Color(0xFF83EBFD);
  static const Color info400 = Color(0xFF63DBFB);
  static const Color info500 = Color(0xFF31C1F9);
  static const Color info600 = Color(0xFF2398D6);
  static const Color info700 = Color(0xFF1872B3);
  static const Color info800 = Color(0xFF0F5190);
  static const Color info900 = Color(0xFF093A77);

  //success
  static const Color success50 = Color(0xFFF7FDE9);
  static const Color success100 = Color(0xFFF1FDD2);
  static const Color success200 = Color(0xFFDFFCA6);
  static const Color success300 = Color(0xFFC6F879);
  static const Color success400 = Color(0xFFADF156);
  static const Color success500 = Color(0xFF88E822);
  static const Color success600 = Color(0xFF6AC718);
  static const Color success700 = Color(0xFF4FA711);
  static const Color success800 = Color(0xFF38860A);
  static const Color success900 = Color(0xFF286F06);

  //warning
  static const Color warning50 = Color(0xFFFFFCED);
  static const Color warning100 = Color(0xFFFFF9D9);
  static const Color warning200 = Color(0xFFFFF2B4);
  static const Color warning300 = Color(0xFFFFEA8E);
  static const Color warning400 = Color(0xFFFFE172);
  static const Color warning500 = Color(0xFFFFD344);
  static const Color warning600 = Color(0xFFDBAF31);
  static const Color warning700 = Color(0xFFB78D22);
  static const Color warning800 = Color(0xFF936C15);
  static const Color warning900 = Color(0xFF7A560D);

  //error
  static const Color error50 = Color(0xFFFFF7F0);
  static const Color error100 = Color(0xFFFFE8D2);
  static const Color error200 = Color(0xFFFFCAA6);
  static const Color error300 = Color(0xFFFFA579);
  static const Color error400 = Color(0xFFFF8358);
  static const Color error500 = Color(0xFFFF4921);
  static const Color error600 = Color(0xFFDB2C18);
  static const Color error700 = Color(0xFFB71510);
  static const Color error800 = Color(0xFF930A10);
  static const Color error900 = Color(0xFF7A0614);


  static const Color pageBackground = Color(0xFFFAFBFD);
  static const Color statusBarColor = Color(0xFF38686A);
  static const Color appBarColor = primary500;
  static const Color appBarIconColor = Color(0xFFFFFFFF);
  static const Color appBarTextColor = Color(0xFFFFFFFF);

  static const Color centerTextColor = Colors.grey;
  static const MaterialColor colorPrimarySwatch = Colors.blue;
  static const Color colorPrimary = primary400;
  static const Color colorAccent = primary400;
  static const Color colorLightGreen = Color(0xFF00EFA7);
  static const Color colorWhite = Color(0xFFFFFFFF);
  static const Color lightGreyColor = Color(0xFFC4C4C4);
  static const Color errorColor = Color(0xFFAB0B0B);
  static const Color colorDark = Color(0xFF323232);

  static const Color buttonBgColor = colorPrimary;
  static const Color disabledButtonBgColor = Color(0xFFBFBFC0);
  static const Color defaultRippleColor = Color(0x0338686A);

  static const Color textColorPrimary = Color(0xFF323232);
  static const Color textColorSecondary = Color(0xFF9FA4B0);
  static const Color textColorTag = colorPrimary;
  static const Color textColorGreyLight = Color(0xFFABABAB);
  static const Color textColorGreyDark = Color(0xFF979797);
  static const Color textColorBlueGreyDark = Color(0xFF939699);
  static const Color textColorCyan = Color(0xFF38686A);
  static const Color textColorWhite = Color(0xFFFFFFFF);
  static Color searchFieldTextColor = const Color(0xFF323232).withOpacity(0.5);

  static const Color iconColorDefault = Colors.grey;

  static Color barrierColor = const Color(0xFF000000).withOpacity(0.5);

  static Color timelineDividerColor = const Color(0x5438686A);

  static const Color gradientStartColor = Colors.black87;
  static const Color gradientEndColor = Colors.transparent;
  static const Color silverAppBarOverlayColor = Color(0x80323232);

  static const Color switchActiveColor = colorPrimary;
  static const Color switchInactiveColor = Color(0xFFABABAB);
  static Color elevatedContainerColorOpacity = Colors.grey.withOpacity(0.5);
  static const Color suffixImageColor = Colors.grey;

  static const Color textFieldColor = Color(0xFFDEE4FF);
}
