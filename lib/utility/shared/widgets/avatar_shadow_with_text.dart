import 'package:flutter/material.dart';

import '../constants/constants_ui.dart';
import 'text/text_border.dart';

class AvatarShadowWithText extends StatelessWidget {
  const AvatarShadowWithText({super.key});

  @override
  Widget build(BuildContext context) {
    return Stack(
      children: [
        Padding(
          padding: const EdgeInsets.only(top: 44),
          child: TextBorder(
            textTitle: 'Novice',
            backgroundColor: kWhiteColor,
            paddingVertical: 2,
            paddingHorizontal: 8,
            fontSize: 10,
            borderColor: kGreyColor,
          ),
        ),
        Container(
          decoration: BoxDecoration(
            shape: BoxShape.circle,
            boxShadow: [
              BoxShadow(
                offset: const Offset(0, 1),
                blurRadius: 3,
                color: kBlackColor.withOpacity(0.1),
              ),
              BoxShadow(
                offset: const Offset(0, 5),
                blurRadius: 5,
                color: kBlackColor.withOpacity(0.09),
              ),
            ],
          ),
          child: Image.asset(
            'assets/avatars/avatar1.png',
            width: 48,
            height: 48,
          ),
        ),
      ],
    );
  }
}
