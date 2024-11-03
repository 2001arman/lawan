import 'package:flutter/material.dart';
import 'package:flutter_svg/svg.dart';
import 'package:get/get.dart';

import '../../../../features/domain/session/avatar_model.dart';
import '../../constants/constants_ui.dart';
import '../text/text_border.dart';
import 'gradient_button.dart';

class CreateSessionButton extends StatelessWidget {
  const CreateSessionButton({super.key, required this.onTap, required this.selectedFriends});
  final VoidCallback onTap;
  final RxList<AvatarModel> selectedFriends;

  @override
  Widget build(BuildContext context) {
    return Container(
      decoration: BoxDecoration(
        boxShadow: greenBoxShadow,
      ),
      child: GradientButton(
        onTap: onTap,
        boxShadow: greenBoxShadow,
        widget: Obx(
          () => Row(
            children: [
              SvgPicture.asset(
                'assets/icons/play.svg',
                width: 16,
                height: 16,
              ),
              const SizedBox(width: 4),
              Text(
                'Create a session',
                style: whiteTextStyle.copyWith(fontWeight: medium),
              ),
              if (selectedFriends.isNotEmpty) const SizedBox(width: 4),
              Visibility(
                visible: selectedFriends.isNotEmpty,
                child: TextBorder(
                  textTitle: '+${selectedFriends.length}',
                  fontSize: 11,
                  paddingVertical: 0,
                  paddingHorizontal: 8,
                  borderColor: Colors.transparent,
                  textColor: const Color(0xFF44D8BE),
                  backgroundColor: kWhiteColor,
                  gradient: mainGradient,
                ),
              ),
            ],
          ),
        ),
      ),
    );
  }
}
