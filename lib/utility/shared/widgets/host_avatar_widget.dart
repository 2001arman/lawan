import 'package:flutter/material.dart';
import 'package:flutter_svg/svg.dart';
import 'package:lawan/utility/shared/constants/constants_ui.dart';
import 'package:lawan/utility/shared/widgets/text_boder.dart';

import 'circle_button_transparent_widget.dart';

class HostAvatarWidget extends StatelessWidget {
  const HostAvatarWidget({super.key});

  @override
  Widget build(BuildContext context) {
    return Container(
      width: double.infinity,
      margin: EdgeInsets.symmetric(vertical: defaultMargin),
      padding: const EdgeInsets.symmetric(vertical: 12, horizontal: 16),
      decoration: BoxDecoration(
        borderRadius: BorderRadius.circular(32),
        color: kWhiteColor,
      ),
      child: Row(
        children: [
          Image.asset(
            'assets/icons/image_person.png',
            width: 40,
            height: 40,
          ),
          const SizedBox(width: 8),
          Expanded(
            child: Column(
              crossAxisAlignment: CrossAxisAlignment.start,
              children: [
                Text(
                  'Jese Leos',
                  style: blackTextStyle.copyWith(fontWeight: medium),
                ),
                const TextBoder(textTitle: 'Host'),
              ],
            ),
          ),
          CircleButtonTransparentWidget(
            onTap: () {},
            borderColor: kGreyColor,
            size: 36,
            widget: SvgPicture.asset(
              'assets/icons/chat.svg',
            ),
          ),
          const SizedBox(width: 4),
          CircleButtonTransparentWidget(
            borderColor: kGreyColor,
            onTap: () {},
            size: 36,
            widget: Icon(
              Icons.more_vert,
              color: kDarkgreyColor,
            ),
          ),
        ],
      ),
    );
  }
}
