// ignore_for_file: public_member_api_docs, sort_constructors_first, deprecated_member_use
import 'dart:io';

import 'package:flutter/material.dart';
import 'package:flutter_svg/svg.dart';
import 'package:get/get.dart';
import 'package:lawan/utility/shared/constants/constants_ui.dart';
import 'package:lawan/utility/shared/widgets/text/text_border.dart';

class AdsPreviewUi extends StatefulWidget {
  final File file;
  const AdsPreviewUi({
    super.key,
    required this.file,
  });

  @override
  State<AdsPreviewUi> createState() => _AdsPreviewUiState();
}

class _AdsPreviewUiState extends State<AdsPreviewUi>
    with SingleTickerProviderStateMixin {
  late AnimationController _animationController;

  @override
  void initState() {
    super.initState();
    _animationController = AnimationController(
      vsync: this,
      duration: const Duration(seconds: 5),
    );

    // Start the animation on load
    _animationController.forward();
  }

  @override
  void dispose() {
    _animationController.dispose();
    super.dispose();
  }

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      body: Container(
        width: Get.width,
        height: Get.height,
        decoration: BoxDecoration(
          image: DecorationImage(
            image: FileImage(widget.file),
            fit: BoxFit.cover,
          ),
        ),
        child: Stack(
          children: [
            Padding(
              padding: EdgeInsets.fromLTRB(
                defaultMargin,
                MediaQuery.of(context).padding.top,
                defaultMargin,
                0,
              ),
              child: Column(
                children: [
                  AnimatedBuilder(
                    animation: _animationController,
                    builder: (context, child) {
                      return LinearProgressIndicator(
                        value: _animationController.value,
                        minHeight: 2,
                        backgroundColor: kModalColor,
                        color: kWhiteColor,
                      );
                    },
                  ),
                  const SizedBox(height: 8),
                  Row(
                    children: [
                      GestureDetector(
                        onTap: Get.back,
                        child: Container(
                          width: 44,
                          height: 44,
                          padding: const EdgeInsets.all(14),
                          decoration: BoxDecoration(
                            shape: BoxShape.circle,
                            color: kModalColor,
                            border: Border.all(width: 1, color: kWhiteColor),
                          ),
                          child: SvgPicture.asset(
                            'assets/icons/back.svg',
                            color: kDarkgreyColor,
                          ),
                        ),
                      ),
                      const SizedBox(width: 8),
                      Image.asset(
                        'assets/avatars/avatar2.png',
                        width: 32,
                        height: 32,
                      ),
                      const SizedBox(width: 8),
                      Column(
                        crossAxisAlignment: CrossAxisAlignment.start,
                        children: [
                          Text(
                            'The Ambitionista',
                            style: whiteTextStyle.copyWith(
                                fontSize: 12, fontWeight: medium),
                          ),
                          const SizedBox(height: 4),
                          TextBorder(
                            textTitle: '              ',
                            paddingVertical: 0,
                            backgroundColor: kWhiteColor,
                          )
                        ],
                      )
                    ],
                  )
                ],
              ),
            ),
            IgnorePointer(
              child: Container(
                width: double.infinity,
                height: MediaQuery.of(context).padding.top + 60,
                decoration: BoxDecoration(
                  gradient: shadowGradientTopBar,
                ),
              ),
            ),
          ],
        ),
      ),
    );
  }
}
