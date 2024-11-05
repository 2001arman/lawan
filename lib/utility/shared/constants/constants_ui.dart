import 'package:flutter/material.dart';

Color kBlackColor = const Color(0xFF000000);
Color kWhiteColor = const Color(0xFFFFFFFF);
Color kBackgroundColor = const Color(0xFFF2F3F2);
Color kGreenColor = const Color(0xFF23A991);

Color kDarkgreyColor = const Color(0xFF545F71);
Color kMidgreyColor = const Color(0xFFACB4C0);
Color kGreyColor = const Color(0xFFDEE1E3);

Color kModalColor = const Color(0xFFF2F3F2).withOpacity(0.7);

Color kRedColor = const Color(0xFFF05B5B);
Color kOrangeColor = const Color(0xFFE28026);

TextStyle blackTextStyle = TextStyle(
  fontFamily: 'Lufga',
  color: kBlackColor,
);

TextStyle whiteTextStyle = TextStyle(
  fontFamily: 'Lufga',
  color: kWhiteColor,
);

TextStyle greenTextStyle = TextStyle(
  fontFamily: 'Lufga',
  color: kGreenColor,
);

TextStyle darkGreyTextStyle = TextStyle(
  fontFamily: 'Lufga',
  color: kDarkgreyColor,
);

TextStyle midGreyTextStyle = TextStyle(
  fontFamily: 'Lufga',
  color: kMidgreyColor,
);

TextStyle greyTextStyle = TextStyle(
  fontFamily: 'Lufga',
  color: kGreyColor,
);

TextStyle redTextStyle = TextStyle(
  fontFamily: 'Lufga',
  color: kRedColor,
);

LinearGradient mainGradient = const LinearGradient(
  begin: Alignment.topCenter,
  end: Alignment.bottomCenter,
  colors: [
    Color(0xFF0C1B22),
    Color(0xFF44D8BE),
  ],
);

LinearGradient backgroundGradient = LinearGradient(
  begin: Alignment.topCenter,
  end: Alignment.bottomCenter,
  colors: [
    const Color(0xFF0C1B22).withOpacity(0.8),
    const Color(0xFF44D8BE).withOpacity(0.0),
  ],
);

LinearGradient blackGradient = LinearGradient(
  begin: Alignment.topCenter,
  end: Alignment.bottomCenter,
  colors: [
    kBackgroundColor,
    const Color(0xFF000000).withOpacity(0.0),
  ],
);

LinearGradient whiteGradient = LinearGradient(
  end: Alignment.topCenter,
  begin: Alignment.bottomCenter,
  colors: [
    kBackgroundColor.withOpacity(0),
    kBackgroundColor,
  ],
);

LinearGradient whiteGradientBottomToTop = LinearGradient(
  begin: Alignment.topCenter,
  end: Alignment.bottomCenter,
  colors: [
    kBackgroundColor.withOpacity(0),
    kBackgroundColor,
  ],
);

LinearGradient goldGradient = const LinearGradient(
  begin: Alignment.topCenter,
  end: Alignment.bottomCenter,
  colors: [
    Color(0xFFF7C86C),
    Color(0xFFE6A72C),
    Color(0xFFD88A00),
  ],
);

LinearGradient silverGradient = const LinearGradient(
  begin: Alignment.topCenter,
  end: Alignment.bottomCenter,
  colors: [
    Color(0xFFEDEDED),
    Color(0xFFCCCCCC),
    Color(0xFFA6A6A6),
  ],
);

LinearGradient bronzeGradient = const LinearGradient(
  begin: Alignment.topCenter,
  end: Alignment.bottomCenter,
  colors: [
    Color(0xFFD1926E),
    Color(0xFFB56E29),
    Color(0xFF8C4B08),
  ],
);

LinearGradient shadowGradient = LinearGradient(
  begin: Alignment.bottomCenter,
  end: Alignment.topCenter,
  colors: [
    Colors.black.withOpacity(0.4),
    Colors.black.withOpacity(0),
  ],
);

List<BoxShadow> greenBoxShadow = [
  BoxShadow(
    blurRadius: 10,
    offset: const Offset(0, 5),
    color: const Color(0xFF40CBB3).withOpacity(0.1),
  ),
  BoxShadow(
    blurRadius: 18,
    offset: const Offset(0, 18),
    color: const Color(0xFF40CBB3).withOpacity(0.09),
  ),
];

double defaultMargin = 16.0;

FontWeight light = FontWeight.w300;
FontWeight reguler = FontWeight.w400;
FontWeight medium = FontWeight.w500;
FontWeight semiBold = FontWeight.w600;
FontWeight bold = FontWeight.w700;
FontWeight extraBold = FontWeight.w800;
FontWeight black = FontWeight.w900;
