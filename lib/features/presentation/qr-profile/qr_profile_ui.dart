// ignore_for_file: deprecated_member_use

import 'package:flutter/material.dart';
import 'package:flutter_svg/svg.dart';
import 'package:get/get.dart';
import 'package:lawan/utility/shared/constants/constants_ui.dart';
import 'package:lawan/utility/shared/widgets/avatar_shadow_with_text.dart';
import 'package:lawan/utility/shared/widgets/buttons/circle_button_transparent_widget.dart';

class QrProfileUi extends StatelessWidget {
  static const String namePath = '/qr_page';
  const QrProfileUi({super.key});

  @override
  Widget build(BuildContext context) {
    Widget actionContainer({required String title, required String icon}) {
      return Expanded(
        child: Container(
          padding: const EdgeInsets.symmetric(vertical: 12),
          decoration: BoxDecoration(
            borderRadius: BorderRadius.circular(20),
            color: kWhiteColor,
          ),
          child: Column(
            children: [
              SvgPicture.asset(
                icon,
                color: kDarkgreyColor,
                width: 16,
                height: 16,
              ),
              const SizedBox(height: 4),
              Text(
                title,
                style: blackTextStyle.copyWith(fontWeight: medium),
              ),
            ],
          ),
        ),
      );
    }

    return Scaffold(
      backgroundColor: kBackgroundColor,
      body: Container(
        width: double.infinity,
        height: Get.height,
        padding: EdgeInsets.fromLTRB(
            defaultMargin,
            MediaQuery.of(context).padding.top + defaultMargin,
            defaultMargin,
            MediaQuery.of(context).padding.bottom + defaultMargin),
        decoration: BoxDecoration(
          gradient: backgroundGradient,
        ),
        child: Stack(
          children: [
            CircleButtonTransparentWidget(
              onTap: Get.back,
              size: 40,
              widget: SvgPicture.asset(
                'assets/icons/x.svg',
                color: kWhiteColor,
              ),
            ),
            Column(
              mainAxisAlignment: MainAxisAlignment.center,
              children: [
                Container(
                  width: double.infinity,
                  padding: const EdgeInsets.symmetric(vertical: 32),
                  decoration: BoxDecoration(
                    borderRadius: BorderRadius.circular(20),
                    color: kModalColor,
                  ),
                  child: Column(
                    children: [
                      SvgPicture.asset('assets/icons/logo.svg'),
                      const SizedBox(height: 32),
                      SvgPicture.asset('assets/icons/QR.svg'),
                      const SizedBox(height: 24),
                      const AvatarShadowWithText(),
                      const SizedBox(height: 12),
                      Text(
                        'Jese Leos',
                        style: blackTextStyle.copyWith(fontWeight: bold),
                      ),
                      const SizedBox(height: 4),
                      SvgPicture.asset('assets/icons/stars.svg'),
                      const SizedBox(height: 12),
                      Row(
                        mainAxisAlignment: MainAxisAlignment.center,
                        children: [
                          SvgPicture.asset(
                            'assets/images/malaysia.svg',
                            width: 16,
                            height: 16,
                          ),
                          const SizedBox(width: 8),
                          Text(
                            'Gombak, Kuala Lumpur',
                            style: darkGreyTextStyle.copyWith(
                              fontWeight: semiBold,
                              fontSize: 12,
                            ),
                          ),
                          const SizedBox(width: 4),
                          SvgPicture.asset(
                            'assets/icons/male.svg',
                            width: 14,
                            height: 14,
                            color: kDarkgreyColor,
                          ),
                        ],
                      ),
                    ],
                  ),
                ),
                const SizedBox(height: 12),
                Row(
                  children: [
                    actionContainer(
                      icon: 'assets/icons/copy.svg',
                      title: 'Copy link',
                    ),
                    const SizedBox(width: 12),
                    actionContainer(
                      icon: 'assets/icons/qrcode.svg',
                      title: 'Scan QR',
                    ),
                    const SizedBox(width: 12),
                    actionContainer(
                      icon: 'assets/icons/upload.svg',
                      title: 'Share via',
                    ),
                  ],
                )
              ],
            ),
          ],
        ),
      ),
    );
  }
}
