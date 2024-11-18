// ignore_for_file: dead_code

import 'package:flutter/cupertino.dart';
import 'package:flutter_svg/svg.dart';

import '../../../../utility/shared/constants/constants_ui.dart';

class HomeAwayScoreWidget extends StatelessWidget {
  const HomeAwayScoreWidget({super.key});

  @override
  Widget build(BuildContext context) {
    return Row(
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
                        ? SvgPicture.asset('assets/icons/check-circle.svg')
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
              style: darkGreyTextStyle.copyWith(fontSize: 10, height: 10 / 10),
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
                        ? SvgPicture.asset('assets/icons/check-circle.svg')
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
    );
  }
}
