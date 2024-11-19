// ignore_for_file: deprecated_member_use

import 'dart:io';

import 'package:flutter/material.dart';
import 'package:flutter_svg/svg.dart';
import 'package:get/get.dart';
import 'package:lawan/utility/shared/widgets/buttons/custom_button.dart';

import '../../../../utility/shared/constants/constants_ui.dart';
import '../../../../utility/shared/widgets/navigations/custom_appbar.dart';

class CommingSoonUi extends StatelessWidget {
  static const String namePath = '/comming-soon-page';
  const CommingSoonUi({super.key});

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      backgroundColor: kBackgroundColor,
      body: Padding(
        padding: EdgeInsets.fromLTRB(
          defaultMargin,
          MediaQuery.of(context).padding.top,
          defaultMargin,
          0,
        ),
        child: Stack(
          children: [
            CustomAppbar(
              title: '',
              iconColor: kDarkgreyColor,
              borderColor: kGreyColor,
              textColor: kBlackColor,
            ),
            Column(
              children: [
                const Spacer(),
                SvgPicture.asset(
                  'assets/icons/hourglass-gradient.svg',
                  width: 160,
                  height: 160,
                ),
                SizedBox(height: defaultMargin),
                Text(
                  'Work in progress.',
                  style:
                      blackTextStyle.copyWith(fontSize: 24, fontWeight: medium),
                ),
                const SizedBox(height: 8),
                Text(
                  'Coming soon. Stay tuned.',
                  style: darkGreyTextStyle.copyWith(fontSize: 12),
                ),
                const SizedBox(height: 8),
                Row(
                  mainAxisAlignment: MainAxisAlignment.center,
                  children: [
                    SvgPicture.asset(
                      'assets/icons/mail.svg',
                      width: 16,
                      height: 16,
                      color: kGreenColor,
                    ),
                    Text(
                      'salam@lawan.app',
                      style: greenTextStyle.copyWith(
                          fontSize: 12, fontWeight: medium),
                    ),
                  ],
                ),
                const Spacer(),
                CustomButton(
                  isBlack: true,
                  onTap: Get.back,
                  title: 'Back',
                ),
                SizedBox(
                  height: Platform.isIOS
                      ? MediaQuery.of(context).padding.bottom
                      : 12,
                )
              ],
            ),
          ],
        ),
      ),
    );
  }
}
