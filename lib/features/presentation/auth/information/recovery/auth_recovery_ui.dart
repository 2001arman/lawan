// ignore_for_file: deprecated_member_use

import 'package:flutter/material.dart';
import 'package:flutter_svg/svg.dart';
import 'package:get/get.dart';
import 'package:lawan/features/presentation/auth/information/recovery/auth_recovery_logic.dart';
import 'package:lawan/utility/shared/widgets/buttons/gradient_button.dart';
import 'package:lawan/utility/shared/widgets/navigations/custom_will_pop_scope.dart';

import '../../../../../utility/shared/constants/constants_ui.dart';
import '../../../../../utility/shared/widgets/custom_text_form_fields.dart';
import '../../../../../utility/shared/widgets/gradient/horizontal_white_gradient.dart';
import '../../../../../utility/shared/widgets/navigations/custom_appbar.dart';

class AuthRecoveryUi extends StatelessWidget {
  static const String namePath = '/auth_recovery_page';
  final logic = Get.find<AuthRecoveryLogic>();
  final state = Get.find<AuthRecoveryLogic>().state;
  AuthRecoveryUi({super.key});

  @override
  Widget build(BuildContext context) {
    Widget recoverySection() {
      return Expanded(
        child: Column(
          crossAxisAlignment: CrossAxisAlignment.start,
          children: [
            const SizedBox(height: 8),
            const HorizontalWhiteGradient(),
            Text('Account Recovery Details', style: darkGreyTextStyle),
            const SizedBox(height: 8),
            CustomTextFormField(
              hintText: 'Password',
              controller: state.passwordController,
              isPassword: true,
              prefix: Padding(
                padding: const EdgeInsets.symmetric(vertical: 14),
                child: SvgPicture.asset(
                  'assets/icons/key.svg',
                  color: kMidgreyColor,
                ),
              ),
            ),
            CustomTextFormField(
              hintText: 'Email address',
              controller: state.emailController,
              prefix: Padding(
                padding: const EdgeInsets.symmetric(vertical: 14),
                child: SvgPicture.asset(
                  'assets/icons/mail.svg',
                  color: kMidgreyColor,
                ),
              ),
            ),
            SizedBox(
              width: double.infinity,
              child: Text(
                'You can add this information later in your account settings',
                textAlign: TextAlign.center,
                style: darkGreyTextStyle.copyWith(fontSize: 10),
              ),
            ),
          ],
        ),
      );
    }

    Widget settingsSection(int index) {
      return Expanded(
        child: Column(
          mainAxisAlignment: MainAxisAlignment.center,
          crossAxisAlignment: CrossAxisAlignment.center,
          children: [
            Center(
              child: SvgPicture.asset(state.listIcons[index - 1]),
            ),
            SizedBox(height: defaultMargin),
            Text(
              state.listTitle[index - 1],
              style: blackTextStyle.copyWith(
                fontSize: 24,
                fontWeight: medium,
              ),
              textAlign: TextAlign.center,
            ),
            const SizedBox(height: 8),
            Text(
              state.listDescription[index - 1],
              style: darkGreyTextStyle.copyWith(
                fontSize: 12,
              ),
              textAlign: TextAlign.center,
            ),
          ],
        ),
      );
    }

    return Scaffold(
      backgroundColor: kBackgroundColor,
      body: CustomWillPopScope(
        action: () => logic.previousIndex(),
        onWillPop: false,
        child: Container(
          width: double.infinity,
          padding: EdgeInsets.fromLTRB(
            defaultMargin,
            MediaQuery.of(context).padding.top + defaultMargin,
            defaultMargin,
            MediaQuery.of(context).padding.bottom + defaultMargin,
          ),
          child: Column(
            crossAxisAlignment: CrossAxisAlignment.start,
            children: [
              Obx(
                () => CustomAppbar(
                  title:
                      state.stepIndex.value == 0 ? 'Recovery information' : '',
                  iconColor: kBlackColor,
                  borderColor: kGreyColor,
                  textColor: kBlackColor,
                  onTap: logic.previousIndex,
                ),
              ),
              // recoverySection(),
              Obx(
                () => state.stepIndex.value == 0
                    ? recoverySection()
                    : settingsSection(state.stepIndex.value),
              ),

              Obx(
                () => Row(
                  children: [
                    if (state.stepIndex.value == 6)
                      Expanded(
                        child: GradientButton(
                          onTap: logic.nextIndex,
                          boxShadow: greenBoxShadow,
                          widget: SvgPicture.asset('assets/icons/camera.svg'),
                        ),
                      ),
                    if (state.stepIndex.value == 6) const SizedBox(width: 8),
                    Expanded(
                      child: GradientButton(
                        onTap: logic.nextIndex,
                        boxShadow: greenBoxShadow,
                        widget: Text(
                          state.textButton[state.stepIndex.value],
                          style: whiteTextStyle.copyWith(fontWeight: medium),
                        ),
                      ),
                    ),
                  ],
                ),
              ),
              const SizedBox(height: 27),
              GestureDetector(
                onTap: logic.nextIndex,
                child: SizedBox(
                  width: double.infinity,
                  child: Obx(
                    () => Text(
                      state.textSkip[state.stepIndex.value],
                      style: greenTextStyle.copyWith(fontWeight: medium),
                      textAlign: TextAlign.center,
                    ),
                  ),
                ),
              )
            ],
          ),
        ),
      ),
    );
  }
}
