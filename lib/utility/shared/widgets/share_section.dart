import 'package:flutter/material.dart';
import 'package:flutter_svg/svg.dart';
import 'package:lawan/utility/shared/widgets/circle_button_transparent_widget.dart';

import '../constants/constants_ui.dart';
import 'custom_button.dart';

class ShareSection extends StatelessWidget {
  const ShareSection({super.key});

  @override
  Widget build(BuildContext context) {
    Widget shareItem(
        {String assetIcon = '', IconData? icon, required String title}) {
      return Expanded(
        child: Column(
          children: [
            if (assetIcon != '')
              Image.asset(
                assetIcon,
                width: 48,
                height: 48,
              ),
            if (icon != null)
              CircleButtonTransparentWidget(
                widget: Icon(icon),
                onTap: () {},
                borderColor: kGreyColor,
              ),
            const SizedBox(height: 4),
            Text(
              title,
              style: darkGreyTextStyle.copyWith(fontSize: 12),
              overflow: TextOverflow.ellipsis,
            ),
          ],
        ),
      );
    }

    return Column(
      children: [
        Row(
          children: [
            shareItem(title: 'Copy Link', icon: Icons.link),
            shareItem(
              title: 'Share via...',
              icon: Icons.file_upload_outlined,
            ),
            shareItem(
              title: 'Whatsapp',
              assetIcon: 'assets/icons/whatsapp.png',
            ),
            shareItem(
              title: 'Messages',
              assetIcon: 'assets/icons/messages.png',
            ),
            shareItem(
              title: 'Telegram',
              assetIcon: 'assets/icons/telegram.png',
            ),
          ],
        ),
        const SizedBox(height: 12),
        Row(
          children: [
            CircleButtonTransparentWidget(
              onTap: () {},
              borderColor: kGreyColor,
              widget: Padding(
                padding: const EdgeInsets.only(left: 7),
                child: Icon(
                  Icons.arrow_back_ios,
                  color: kDarkgreyColor,
                  size: 20,
                ),
              ),
            ),
            const SizedBox(width: 16),
            CustomButton(
              isBlack: true,
              onTap: () {},
              widget: Row(
                crossAxisAlignment: CrossAxisAlignment.center,
                mainAxisAlignment: MainAxisAlignment.center,
                children: [
                  SvgPicture.asset(
                    'assets/icons/chat.svg',
                    // ignore: deprecated_member_use
                    color: kMidgreyColor,
                    width: 16,
                    height: 16,
                  ),
                  const SizedBox(width: 8),
                  Text(
                    'Send via Chat',
                    style: whiteTextStyle.copyWith(fontWeight: medium),
                  )
                ],
              ),
            )
          ],
        ),
      ],
    );
  }
}
