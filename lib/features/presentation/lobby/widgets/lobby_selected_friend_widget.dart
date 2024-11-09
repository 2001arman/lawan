// ignore_for_file: deprecated_member_use

import 'package:flutter/material.dart';
import 'package:flutter_svg/svg.dart';
import 'package:lawan/features/domain/session/avatar_model.dart';
import 'package:lawan/utility/shared/widgets/buttons/gradient_circle_button.dart';

import '../../../../utility/shared/constants/constants_ui.dart';
import '../../../../utility/shared/widgets/buttons/circle_button_transparent_widget.dart';
import '../../../../utility/shared/widgets/text/text_border.dart';
import '../../../../utility/shared/widgets/text/text_pill_widget.dart';

class LobbySelectedFriendWidget extends StatelessWidget {
  const LobbySelectedFriendWidget({
    super.key,
    required this.profile,
    required this.showReferee,
    required this.isReferee,
    required this.selecReferee,
    required this.onTap,
    required this.isActive,
  });
  final AvatarModel profile;
  final bool showReferee, isReferee, isActive;
  final VoidCallback selecReferee, onTap;

  @override
  Widget build(BuildContext context) {
    return GestureDetector(
      onTap: showReferee ? null : onTap,
      child: Container(
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
                    style: blackTextStyle.copyWith(
                        fontSize: 12, fontWeight: medium),
                  ),
                  const SizedBox(height: 8),
                  Row(
                    children: [
                      TextPillWidget(
                        verticalPadding: 2,
                        backgroundColor: kBackgroundColor,
                        prefix: Padding(
                          padding: const EdgeInsets.only(right: 3),
                          child: SvgPicture.asset('assets/icons/user.svg'),
                        ),
                        title: profile.position,
                        titleColor: kBlackColor,
                      ),
                      const SizedBox(width: 8),
                      Visibility(
                        // visible: index == state.selectedRefereeIndex.value,
                        visible: isReferee,
                        child: SvgPicture.asset(
                          'assets/icons/whistle.svg',
                          color: kBlackColor,
                          width: 16,
                          height: 16,
                        ),
                      )
                    ],
                  )
                ],
              ),
            ),
            TextBorder(
              textTitle: 'Novice',
              backgroundColor: kWhiteColor,
              fontSize: 10,
            ),
            Visibility(
              visible: showReferee,
              child: CircleButtonTransparentWidget(
                onTap: selecReferee,
                borderColor: kGreyColor,
                margin: const EdgeInsets.only(left: 12),
                widget: SvgPicture.asset(
                  'assets/icons/whistle.svg',
                  color: kBlackColor,
                  width: 20,
                  height: 20,
                ),
              ),
            ),
            Visibility(
              visible: isActive,
              child: Padding(
                padding: EdgeInsets.only(left: defaultMargin),
                child: GradientCircleButton(
                  onTap: () {},
                  widget: SvgPicture.asset(
                    'assets/icons/check.svg',
                    color: kWhiteColor,
                    width: 20,
                    height: 20,
                  ),
                ),
              ),
            ),
            const SizedBox(width: 4),
          ],
        ),
      ),
    );
  }
}
