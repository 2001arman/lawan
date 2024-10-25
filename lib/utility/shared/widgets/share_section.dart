// ignore_for_file: deprecated_member_use

import 'dart:io';

import 'package:appinio_social_share/appinio_social_share.dart';
import 'package:flutter/material.dart';
import 'package:flutter/services.dart';
import 'package:flutter_svg/svg.dart';
import 'package:lawan/utility/shared/widgets/buttons/circle_button_transparent_widget.dart';
import 'package:lawan/utility/util/helper.dart';
import 'package:share_plus/share_plus.dart';

import '../constants/constants_ui.dart';
import 'buttons/custom_button.dart';

class ShareSection extends StatefulWidget {
  const ShareSection({super.key, this.onTapBack});
  final VoidCallback? onTapBack;

  @override
  State<ShareSection> createState() => _ShareSectionState();
}

class _ShareSectionState extends State<ShareSection> {
  bool isAndroid() {
    if (Platform.isAndroid) {
      return true;
    } else {
      return false;
    }
  }

  @override
  Widget build(BuildContext context) {
    Widget shareItem({
      String assetIcon = '',
      String? iconSvg,
      required String title,
      required VoidCallback onTap,
    }) {
      return Expanded(
        child: Column(
          children: [
            if (assetIcon != '')
              GestureDetector(
                onTap: onTap,
                child: Image.asset(
                  assetIcon,
                  width: 48,
                  height: 48,
                ),
              ),
            if (iconSvg != null)
              CircleButtonTransparentWidget(
                widget: SvgPicture.asset(iconSvg),
                onTap: onTap,
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
            shareItem(
              title: 'Copy Link',
              iconSvg: 'assets/icons/copy.svg',
              onTap: () async {
                await Clipboard.setData(
                    const ClipboardData(text: "Lawan link text"));
                Helper.showToast(isSuccess: true, message: 'Success copy link');
              },
            ),
            shareItem(
              title: 'Share via...',
              iconSvg: 'assets/icons/upload.svg',
              onTap: () => Share.share('Share lawan link'),
            ),
            shareItem(
              title: 'Whatsapp',
              assetIcon: 'assets/icons/whatsapp.png',
              onTap: () {
                isAndroid()
                    ? AppinioSocialShare()
                        .android
                        .shareToWhatsapp("Lawan link text", null)
                    : AppinioSocialShare()
                        .iOS
                        .shareToWhatsapp("Lawan link text");
              },
            ),
            shareItem(
              title: 'Messages',
              assetIcon: 'assets/icons/messages.png',
              onTap: () {
                isAndroid()
                    ? AppinioSocialShare()
                        .android
                        .shareToSMS("Lawan link text", null)
                    : AppinioSocialShare().iOS.shareToSMS("Lawan link text");
              },
            ),
            shareItem(
              title: 'Telegram',
              assetIcon: 'assets/icons/telegram.png',
              onTap: () {
                isAndroid()
                    ? AppinioSocialShare()
                        .android
                        .shareToTelegram("Lawan link text", null)
                    : AppinioSocialShare()
                        .iOS
                        .shareToTelegram("Lawan link text");
              },
            ),
          ],
        ),
        const SizedBox(height: 12),
        Row(
          children: [
            CircleButtonTransparentWidget(
              onTap: () {
                if (widget.onTapBack != null) {
                  widget.onTapBack!();
                }
              },
              borderColor: kGreyColor,
              widget: SvgPicture.asset(
                'assets/icons/back.svg',
                color: kDarkgreyColor,
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
