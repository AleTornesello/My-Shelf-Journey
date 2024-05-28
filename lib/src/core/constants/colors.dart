import 'package:flutter/material.dart';

// https://www.color-hex.com/color-palette/1045748
@immutable
class ColorConstants {
  const ColorConstants._();

  static const Color primary50 = Color(0xffE2E4EA);
  static const Color primary100 = Color(0xffB6BCCA);
  static const Color primary200 = Color(0xff8690A6);
  static const Color primary300 = Color(0xff566482);
  static const Color primary400 = Color(0xff314268);
  static const Color primary500 = Color(0xff0d214d);
  static const Color primary600 = Color(0xff0B1D46);
  static const Color primary700 = Color(0xff09183D);
  static const Color primary800 = Color(0xff071434);
  static const Color primary900 = Color(0xff030B25);
  static const Color primaryText = Color(0xffffffff);

  static const Color secondary = Color(0xff2e63b4);
  static const Color secondaryText = Color(0xffffffff);

  static const Color red50 = Color(0xfffff8f8);
  static const Color red100 = Color(0xffffe9e6);
  static const Color red200 = Color(0xffffc8c0);
  static const Color red300 = Color(0xfffea694);
  static const Color red400 = Color(0xfffe7f6e);
  static const Color red500 = Color(0xffe26352);
  static const Color red600 = Color(0xffb85143);
  static const Color red700 = Color(0xff9c4438);
  static const Color red800 = Color(0xff7d372d);
  static const Color red900 = Color(0xff5d2822);

  static const Color yellow50 = Color(0xfffffaeb);
  static const Color yellow100 = Color(0xfffeedb9);
  static const Color yellow200 = Color(0xfffecf49);
  static const Color yellow300 = Color(0xffe3b740);
  static const Color yellow400 = Color(0xffc89f38);
  static const Color yellow500 = Color(0xffaab630);
  static const Color yellow600 = Color(0xffbb6c27);
  static const Color yellow700 = Color(0xff765B21);
  static const Color yellow800 = Color(0xff60491B);
  static const Color yellow900 = Color(0xff473514);

  static const Color green50 = Color(0xffF4FCF4);
  static const Color green100 = Color(0xffD9F5DA);
  static const Color green200 = Color(0xff9FE5A2);
  static const Color green300 = Color(0xff5FD564);
  static const Color green400 = Color(0xff4CBB51);
  static const Color green500 = Color(0xff409D44);
  static const Color green600 = Color(0xff348037);
  static const Color green700 = Color(0xff2C6C2F);
  static const Color green800 = Color(0xff235726);
  static const Color green900 = Color(0xff1A401C);

  static const Color blue50 = Color(0xffF6FBFD);
  static const Color blue100 = Color(0xffE0F0F9);
  static const Color blue200 = Color(0xffB1DBEF);
  static const Color blue300 = Color(0xff84C5E6);
  static const Color blue400 = Color(0xff53AFDC);
  static const Color blue500 = Color(0xff1993D0);
  static const Color blue600 = Color(0xff0077B2);
  static const Color blue700 = Color(0xff006596);
  static const Color blue800 = Color(0xff005179);
  static const Color blue900 = Color(0xff003C5A);

  static const Color purple50 = Color(0xffF8FAFE);
  static const Color purple100 = Color(0xffE7EEFC);
  static const Color purple200 = Color(0xffC5D5F7);
  static const Color purple300 = Color(0xffA6BCF2);
  static const Color purple400 = Color(0xff8AA3ED);
  static const Color purple500 = Color(0xff7084E5);
  static const Color purple600 = Color(0xff6067CA);
  static const Color purple700 = Color(0xff5456AA);
  static const Color purple800 = Color(0xff464587);
  static const Color purple900 = Color(0xff353264);

  static const Color gray50 = Color(0xffFAFAFA);
  static const Color gray100 = Color(0xffEEEEEE);
  static const Color gray200 = Color(0xffD5D5D5);
  static const Color gray300 = Color(0xffBDBDBD);
  static const Color gray400 = Color(0xffA5A5A5);
  static const Color gray500 = Color(0xff8B8B8B);
  static const Color gray600 = Color(0xff717171);
  static const Color gray700 = Color(0xff5F5F5F);
  static const Color gray800 = Color(0xff4C4C4C);
  static const Color gray900 = Color(0xff383838);

  static ColorScheme colorScheme = ColorScheme.fromSeed(
    seedColor: primary500,
    primary: primary500,
    onPrimary: primaryText,
    secondary: secondary,
    onSecondary: secondaryText,
  );
}
