// ignore_for_file: deprecated_member_use, dead_code

import 'package:flutter/material.dart';
import 'package:flutter_svg/svg.dart';
import 'package:lawan/utility/shared/widgets/buttons/circle_button_transparent_widget.dart';
import 'package:lawan/utility/shared/widgets/buttons/gradient_circle_button.dart';

import '../../../../utility/shared/constants/constants_ui.dart';

class SessionItemWidget extends StatelessWidget {
  const SessionItemWidget({super.key});

  @override
  Widget build(BuildContext context) {
    return Container(
      width: double.infinity,
      padding: EdgeInsets.all(defaultMargin),
      margin: EdgeInsets.only(bottom: defaultMargin),
      decoration: BoxDecoration(
        color: kWhiteColor,
        borderRadius: BorderRadius.circular(32),
      ),
      child: Column(
        children: [
          Row(
            children: [
              SvgPicture.asset(
                'assets/icons/location.svg',
                width: 14,
                height: 14,
                color: kMidgreyColor,
              ),
              const SizedBox(width: 4),
              Text(
                'MBPJ Sports Complex',
                style: darkGreyTextStyle.copyWith(fontSize: 10),
              ),
              const Spacer(),
              SvgPicture.asset(
                'assets/icons/calendar2.svg',
                width: 14,
                height: 14,
                color: kMidgreyColor,
              ),
              const SizedBox(width: 4),
              Text(
                '16 Sep, 2024',
                style: darkGreyTextStyle.copyWith(fontSize: 10),
              ),
            ],
          ),
          const SizedBox(height: 12),
          Row(
            children: [
              Expanded(
                child: Row(
                  mainAxisAlignment: MainAxisAlignment.spaceEvenly,
                  children: [
                    Row(
                      crossAxisAlignment: CrossAxisAlignment.start,
                      children: [
                        Column(
                          children: [
                            SvgPicture.asset('assets/icons/home_shield.svg'),
                            const SizedBox(height: 8),
                            Text(
                              'Home',
                              style: blackTextStyle.copyWith(
                                  fontSize: 12, fontWeight: medium),
                            ),
                          ],
                        ),
                        Padding(
                          padding: const EdgeInsets.only(
                            top: 15,
                            left: 6,
                          ),
                          child: false
                              ? SvgPicture.asset(
                                  'assets/icons/check-circle.svg')
                              : const SizedBox(width: 16),
                        ),
                      ],
                    ),
                    Text(
                      '3',
                      style: blackTextStyle.copyWith(fontSize: 40),
                    ),
                  ],
                ),
              ),
              Column(
                children: [
                  Text(
                    'W',
                    style: darkGreyTextStyle.copyWith(
                        fontSize: 10, height: 10 / 10),
                  ),
                  Text(
                    ':',
                    style: midGreyTextStyle.copyWith(
                      fontSize: 40,
                      height: 40 / 40,
                    ),
                  ),
                  const SizedBox(height: 15),
                ],
              ),
              Expanded(
                child: Row(
                  mainAxisAlignment: MainAxisAlignment.spaceEvenly,
                  children: [
                    Text(
                      '0',
                      style: blackTextStyle.copyWith(fontSize: 40),
                    ),
                    Row(
                      crossAxisAlignment: CrossAxisAlignment.start,
                      children: [
                        Padding(
                          padding: const EdgeInsets.only(
                            top: 15,
                            right: 6,
                          ),
                          child: true
                              ? SvgPicture.asset(
                                  'assets/icons/check-circle.svg')
                              : const SizedBox(width: 16),
                        ),
                        Column(
                          children: [
                            SvgPicture.asset('assets/icons/away_shield.svg'),
                            const SizedBox(height: 8),
                            Text(
                              'Away',
                              style: blackTextStyle.copyWith(
                                  fontSize: 12, fontWeight: medium),
                            ),
                          ],
                        ),
                      ],
                    ),
                  ],
                ),
              ),
            ],
          ),
          const SizedBox(height: 12),
          Row(
            mainAxisAlignment: MainAxisAlignment.center,
            children: [
              CircleButtonTransparentWidget(
                onTap: () {},
                borderColor: kGreyColor,
                widget: Column(
                  mainAxisAlignment: MainAxisAlignment.center,
                  children: [
                    SvgPicture.asset(
                      'assets/icons/heart-outline.svg',
                      width: 16,
                      height: 16,
                    ),
                    Text(
                      '10.6K',
                      style: darkGreyTextStyle.copyWith(fontSize: 10),
                    ),
                  ],
                ),
              ),
              const SizedBox(width: 12),
              CircleButtonTransparentWidget(
                onTap: () {},
                borderColor: kGreyColor,
                widget: Column(
                  mainAxisAlignment: MainAxisAlignment.center,
                  children: [
                    SvgPicture.asset(
                      'assets/icons/message-circle.svg',
                      width: 16,
                      height: 16,
                    ),
                    Text(
                      '100',
                      style: darkGreyTextStyle.copyWith(fontSize: 10),
                    ),
                  ],
                ),
              ),
              const SizedBox(width: 12),
              CircleButtonTransparentWidget(
                onTap: () {},
                borderColor: kGreyColor,
                widget: SvgPicture.asset(
                  'assets/icons/users_group.svg',
                  width: 16,
                  height: 16,
                  color: kDarkgreyColor,
                ),
              ),
              const SizedBox(width: 12),
              GradientCircleButton(
                onTap: () {},
                widget: SvgPicture.asset(
                  'assets/icons/video-cam-outline.svg',
                  width: 16,
                  height: 16,
                  color: kGreyColor,
                ),
              ),
            ],
          ),
          const SizedBox(height: 12),
          Row(
            mainAxisAlignment: MainAxisAlignment.center,
            children: [
              Container(
                width: 24,
                height: 6,
                decoration: BoxDecoration(
                  borderRadius: BorderRadius.circular(20),
                  color: kDarkgreyColor,
                ),
              ),
              const SizedBox(width: 4),
              Container(
                width: 6,
                height: 6,
                decoration: BoxDecoration(
                  borderRadius: BorderRadius.circular(20),
                  color: kMidgreyColor,
                ),
              ),
            ],
          )
        ],
      ),
    );
  }
}
