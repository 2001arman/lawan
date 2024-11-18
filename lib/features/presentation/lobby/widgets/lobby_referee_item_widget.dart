// ignore_for_file: deprecated_member_use

import 'package:flutter/material.dart';
import 'package:flutter_svg/svg.dart';
import 'package:lawan/features/domain/session/avatar_model.dart';

import '../../../../utility/shared/constants/constants_ui.dart';

class LobbyRefereeItemWidget extends StatelessWidget {
  const LobbyRefereeItemWidget({
    super.key,
    required this.profile,
  });
  final AvatarModel profile;

  @override
  Widget build(BuildContext context) {
    return Container(
      width: double.infinity,
      padding: const EdgeInsets.all(8),
      margin: const EdgeInsets.only(bottom: 12),
      decoration: BoxDecoration(
        borderRadius: BorderRadius.circular(32),
        color: kWhiteColor,
      ),
      child: Row(
        children: [
          Image.asset(
            profile.asset,
            width: 48,
            height: 48,
          ),
          const SizedBox(width: 8),
          Expanded(
            child: Column(
              crossAxisAlignment: CrossAxisAlignment.start,
              children: [
                Text(
                  profile.name,
                  style:
                      blackTextStyle.copyWith(fontSize: 12, fontWeight: medium),
                ),
                const SizedBox(height: 8),
                SvgPicture.asset(
                  'assets/icons/whistle.svg',
                  color: kBlackColor,
                  width: 16,
                  height: 16,
                )
              ],
            ),
          ),
          SvgPicture.asset(
            'assets/icons/stars.svg',
            height: 16,
          ),
          const SizedBox(width: 4),
        ],
      ),
    );
  }
}
