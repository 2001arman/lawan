// ignore_for_file: deprecated_member_use

import 'package:blur/blur.dart';
import 'package:flutter/material.dart';
import 'package:flutter_svg/svg.dart';
import 'package:get/get.dart';
import 'package:lawan/features/presentation/player/player_main_ui.dart';
import 'package:lawan/utility/shared/widgets/buttons/circle_button_transparent_widget.dart';

import '../../../../utility/shared/constants/constants_ui.dart';
import '../../../../utility/shared/widgets/buttons/custom_button.dart';
import '../../../../utility/shared/widgets/custom_text_form_fields.dart';

class ForgotPasswordLogic extends GetxController {
  bool isPhone = false;

  @override
  void onInit() {
    isPhone = Get.arguments[0];
    super.onInit();
  }

  void gotoMainPage() async {
    Get.offAllNamed(PlayerMainUi.namePath);
    await Future.delayed(const Duration(milliseconds: 300));
    showNewPasswordDialog();
  }

  void showNewPasswordDialog() {
    Get.dialog(
      Dialog(
        backgroundColor: Colors.transparent,
        insetPadding: const EdgeInsets.symmetric(horizontal: 16),
        child: SizedBox(
          width: Get.width,
          height: 273,
        ).blurred(
          blur: 7,
          blurColor: Colors.white,
          colorOpacity: 0,
          borderRadius: BorderRadius.circular(32),
          overlay: Container(
            width: Get.width,
            height: 273,
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
                Row(
                  children: [
                    SvgPicture.asset(
                      'assets/icons/key.svg',
                      width: 16,
                      height: 16,
                      color: kWhiteColor,
                    ),
                    const SizedBox(width: 8),
                    Text(
                      'Enter your new password',
                      style: blackTextStyle.copyWith(
                          fontSize: 16, fontWeight: medium),
                    ),
                  ],
                ),
                const SizedBox(height: 24),
                CustomTextFormField(
                  hintText: 'Password',
                  controller: TextEditingController(),
                  isPassword: true,
                  margin: defaultMargin,
                ),
                CustomTextFormField(
                  hintText: 'Confirm Password',
                  controller: TextEditingController(),
                  isPassword: true,
                  margin: defaultMargin,
                ),
                const SizedBox(height: 8),
                Row(
                  children: [
                    CircleButtonTransparentWidget(
                      onTap: Get.back,
                      widget: SvgPicture.asset('assets/icons/back.svg'),
                    ),
                    const SizedBox(width: 8),
                    Expanded(
                      child: CustomButton(
                        isBlack: true,
                        onTap: Get.back,
                        title: 'Update',
                      ),
                    ),
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
