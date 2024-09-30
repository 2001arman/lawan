import 'package:blur/blur.dart';
import 'package:flutter/material.dart';
import 'package:get/get.dart';

import '../shared/constants/constants_ui.dart';
import '../shared/widgets/custom_button.dart';

class CustomDialogSuccess {
  static void successCreateArena() {
    Get.dialog(
      Dialog(
        backgroundColor: Colors.transparent,
        insetPadding: const EdgeInsets.symmetric(horizontal: 16),
        child: SizedBox(
          width: Get.width,
          height: 288,
        ).blurred(
          blur: 7,
          blurColor: Colors.white,
          colorOpacity: 0,
          borderRadius: BorderRadius.circular(32),
          overlay: Container(
            width: Get.width,
            height: 288,
            padding: EdgeInsets.only(
              top: 24,
              left: defaultMargin,
              right: defaultMargin,
              bottom: defaultMargin,
            ),
            decoration: BoxDecoration(
              color: kModalColor,
              borderRadius: BorderRadius.circular(32),
              boxShadow: [
                BoxShadow(
                  offset: const Offset(0, -0.5),
                  blurStyle: BlurStyle.inner,
                  spreadRadius: 0,
                  blurRadius: 0,
                  color: kBlackColor.withOpacity(0.1),
                ),
              ],
            ),
            child: Column(
              mainAxisSize: MainAxisSize.min,
              children: [
                Text(
                  'Arena Added Successfully!',
                  style:
                      blackTextStyle.copyWith(fontSize: 16, fontWeight: medium),
                ),
                const SizedBox(height: 8),
                Image.asset(
                  'assets/icons/field_gradient.png',
                  width: 60,
                  height: 60,
                ),
                const SizedBox(height: 8),
                Text(
                  'You can now start earning from this arena',
                  style: darkGreyTextStyle.copyWith(fontSize: 12),
                ),
                const SizedBox(height: 24),
                Row(
                  children: [
                    CustomButton(
                      title: 'Add Another Court',
                      isBlack: false,
                      onTap: Get.back,
                    ),
                  ],
                ),
                const SizedBox(height: 8),
                Row(
                  children: [
                    CustomButton(title: 'Done', isBlack: true, onTap: Get.back),
                  ],
                ),
              ],
            ),
          ),
        ),
      ),
    );
  }
}
