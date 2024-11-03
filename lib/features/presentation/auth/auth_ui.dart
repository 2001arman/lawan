// ignore_for_file: deprecated_member_use

import 'package:flutter/material.dart';
import 'package:flutter/services.dart';
import 'package:flutter_svg/svg.dart';
import 'package:get/get.dart';
import 'package:lawan/features/presentation/auth/auth_logic.dart';
import 'package:lawan/utility/shared/constants/constants_ui.dart';
import 'package:lawan/utility/shared/widgets/buttons/custom_button.dart';
import 'package:lawan/utility/shared/widgets/buttons/gradient_button.dart';
import 'package:lawan/utility/shared/widgets/navigations/custom_appbar.dart';

import '../../../utility/shared/widgets/custom_text_form_fields.dart';
import '../../../utility/shared/widgets/navigations/tab_bar_widget.dart';
import '../../../utility/shared/widgets/video/video_widget.dart';
import '../../../utility/util/helper.dart';

class AuthUi extends StatelessWidget {
  static const String namePath = '/auth_page';
  AuthUi({super.key});
  final logic = Get.find<AuthLogic>();
  final state = Get.find<AuthLogic>().state;

  @override
  Widget build(BuildContext context) {
    Widget phoneNumberSection() {
      return Row(
        children: [
          SizedBox(
            width: 90,
            child: CustomTextFormField(
              hintText: '+60',
              margin: defaultMargin,
              controller: TextEditingController(),
              prefix: Column(
                mainAxisAlignment: MainAxisAlignment.center,
                mainAxisSize: MainAxisSize.max,
                children: [
                  SvgPicture.asset(
                    'assets/images/malaysia.svg',
                    height: 16,
                    width: 16,
                  ),
                ],
              ),
              isReadOnly: true,
              verticalPadding: 14,
              horizontalPadding: 16,
            ),
          ),
          const SizedBox(width: 12),
          Expanded(
            child: CustomTextFormField(
              hintText: 'Phone number',
              controller: state.phoneController,
              margin: defaultMargin,
              textInputType: TextInputType.number,
              validator: (data) => Helper.numberValidator(data),
              inputFormatters: [
                FilteringTextInputFormatter.digitsOnly,
              ],
            ),
          ),
        ],
      );
    }

    Widget digitCodeSection() {
      return Row(
        crossAxisAlignment: CrossAxisAlignment.center,
        children: [
          Expanded(
            child: CustomTextFormField(
              hintText: 'Enter 6-digit code',
              controller: state.codeController,
              textInputType: TextInputType.number,
              validator: (data) => Helper.numberValidator(data),
              margin: 0,
              maxLength: 6,
              inputFormatters: [
                FilteringTextInputFormatter.digitsOnly,
              ],
            ),
          ),
          const SizedBox(width: 12),
          SizedBox(
            width: 112,
            child: CustomButton(
              isBlack: true,
              onTap: () {},
              title: 'Send code',
            ),
          ),
        ],
      );
    }

    Widget signUpSection() {
      return Column(
        crossAxisAlignment: CrossAxisAlignment.start,
        children: [
          Text(
            'Phone',
            style: darkGreyTextStyle,
          ),
          const SizedBox(height: 4),
          phoneNumberSection(),
          digitCodeSection(),
          SizedBox(height: defaultMargin),
          GradientButton(
            onTap: logic.goToSecondScreen,
            boxShadow: greenBoxShadow,
            widget: Text(
              'Create Account',
              style: whiteTextStyle.copyWith(fontWeight: medium),
            ),
          ),
          SizedBox(height: defaultMargin),
          RichText(
            textAlign: TextAlign.center,
            text: TextSpan(
              text:
                  "By continuing with ’Create Account’, you agree to the Lawan ",
              style: blackTextStyle.copyWith(fontSize: 12),
              children: [
                TextSpan(
                  text: 'Terms of Service ',
                  style: greenTextStyle.copyWith(fontWeight: medium),
                ),
                const TextSpan(text: 'and '),
                TextSpan(
                  text: 'Privacy Policy',
                  style: greenTextStyle.copyWith(fontWeight: medium),
                ),
                const TextSpan(text: '.'),
              ],
            ),
          ),
        ],
      );
    }

    Widget loginWithEmail() {
      return Column(
        children: [
          CustomTextFormField(
            hintText: 'Email address',
            controller: state.emailController,
            margin: defaultMargin,
            prefix: Padding(
              padding: const EdgeInsets.symmetric(vertical: 14),
              child: SvgPicture.asset(
                'assets/icons/mail.svg',
                color: kMidgreyColor,
              ),
            ),
          ),
          CustomTextFormField(
            hintText: 'Password',
            controller: state.passwordController,
            isPassword: true,
            margin: 3,
            prefix: Padding(
              padding: const EdgeInsets.symmetric(vertical: 14),
              child: SvgPicture.asset(
                'assets/icons/key.svg',
                color: kMidgreyColor,
              ),
            ),
          ),
        ],
      );
    }

    Widget loginWithPhone() {
      return Column(
        children: [
          phoneNumberSection(),
          digitCodeSection(),
        ],
      );
    }

    Widget loginSection() {
      return Column(
        children: [
          Center(
            child: SvgPicture.asset(
              'assets/icons/fingerprint.svg',
              width: 36,
              color: kBlackColor,
            ),
          ),
          SizedBox(height: defaultMargin),
          Row(
            children: [
              Expanded(
                child: Container(height: 1, color: kGreyColor),
              ),
              Padding(
                padding: const EdgeInsets.symmetric(horizontal: 12),
                child: Text(
                  'Or continue with',
                  style: darkGreyTextStyle.copyWith(fontSize: 12),
                ),
              ),
              Expanded(
                child: Container(height: 1, color: kGreyColor),
              ),
            ],
          ),
          SizedBox(height: defaultMargin),
          Row(
            mainAxisAlignment: MainAxisAlignment.spaceBetween,
            children: state.listLoginIcon
                .asMap()
                .entries
                .map(
                  (data) => GestureDetector(
                    onTap: () => logic.handleTapOptionLogin(data.key),
                    child: Container(
                      padding: const EdgeInsets.symmetric(
                          horizontal: 27, vertical: 12),
                      decoration: BoxDecoration(
                        border: Border.all(width: 1, color: kGreyColor),
                        borderRadius: BorderRadius.circular(80),
                      ),
                      child: SvgPicture.asset(
                        data.value,
                        width: 24,
                        height: 24,
                        color: data.key == 0 ? kDarkgreyColor : null,
                      ),
                    ),
                  ),
                )
                .toList(),
          ),
          SizedBox(height: defaultMargin),
          Obx(
            () => state.loginPhone.value ? loginWithPhone() : loginWithEmail(),
          ),
          SizedBox(height: defaultMargin),
          GradientButton(
            onTap: logic.goToSecondScreen,
            boxShadow: greenBoxShadow,
            widget: Text(
              'Log In',
              style: whiteTextStyle.copyWith(fontWeight: medium),
            ),
          ),
          SizedBox(height: defaultMargin),
          Text(
            'Trouble logging in?',
            style: greenTextStyle.copyWith(fontWeight: medium),
          ),
        ],
      );
    }

    Widget contentSection() {
      return Align(
        alignment: Alignment.bottomCenter,
        child: Obx(
          () => AnimatedContainer(
            duration: const Duration(milliseconds: 600),
            curve: Curves.easeOutSine,
            padding: EdgeInsets.symmetric(horizontal: defaultMargin),
            width: double.infinity,
            // height:442,
            height: state.heightContainer.value,
            margin: const EdgeInsets.only(bottom: 24),
            child: ListView(
              // crossAxisAlignment: CrossAxisAlignment.start,
              padding: EdgeInsets.zero,
              physics: const NeverScrollableScrollPhysics(),
              children: [
                TabbarWidget(
                  tabBarTitle: state.lobbyTabBarTitle,
                  tabActive: state.lobbyTabActive,
                  backgroundColor: kGreyColor,
                  onTap: (title) {
                    state.lobbyTabActive.value = title;
                    logic.lobbyAlignmentTabbar(title);
                  },
                  alignment: state.lobbyActiveAlignment,
                ),
                SizedBox(height: defaultMargin),
                state.lobbyTabActive.value == 'Login'
                    ? loginSection()
                    : signUpSection(),
                SizedBox(height: defaultMargin),
              ],
            ),
          ),
        ),
      );
    }

    Widget backgroundSection() {
      return Obx(
        () => AnimatedContainer(
          duration: const Duration(milliseconds: 600),
          curve: Curves.easeOutSine,
          width: Get.width,
          height: Get.height - state.heightContainer.value,
          color: kBlackColor,
          child: Stack(
            children: [
              AnimatedContainer(
                duration: const Duration(milliseconds: 600),
                curve: Curves.easeOutSine,
                width: Get.width,
                height: Get.height - state.heightContainer.value,
                child:
                    VideoWidget(videoController: logic.videoPlayerController),
              ),
              Container(
                width: double.infinity,
                height: Get.height,
                color: kBlackColor.withOpacity(0.6),
              ),
              Container(
                width: double.infinity,
                height: 108,
                decoration: BoxDecoration(
                  gradient: LinearGradient(
                    begin: Alignment.topCenter,
                    end: Alignment.bottomCenter,
                    colors: [
                      kBackgroundColor,
                      kBlackColor.withOpacity(0),
                    ],
                  ),
                ),
              ),
              Align(
                alignment: Alignment.bottomCenter,
                child: Container(
                  width: double.infinity,
                  height: 80,
                  decoration: BoxDecoration(
                    gradient: LinearGradient(
                      end: Alignment.topCenter,
                      begin: Alignment.bottomCenter,
                      colors: [
                        kBackgroundColor,
                        kBlackColor.withOpacity(0),
                      ],
                    ),
                  ),
                ),
              ),
              Padding(
                padding: EdgeInsets.fromLTRB(
                  defaultMargin,
                  MediaQuery.of(context).padding.top + defaultMargin,
                  defaultMargin,
                  0,
                ),
                child: Column(
                  children: [
                    Obx(
                      () => CustomAppbar(
                        title: state.lobbyTabActive.value == 'Login'
                            ? 'Welcome Back'
                            : 'Sign Up',
                        iconColor: kWhiteColor,
                        borderColor: kGreyColor,
                        textColor: kWhiteColor,
                      ),
                    ),
                    Expanded(
                      child: Column(
                        children: [
                          const Spacer(),
                          Image.asset(
                            'assets/icons/logo_and_title.png',
                            width: 236,
                          ),
                          const Spacer(),
                          Text(
                            'Pahlawan.\nEnpowered.',
                            style: whiteTextStyle.copyWith(
                              fontSize: 28,
                              fontWeight: reguler,
                              shadows: [
                                Shadow(
                                  offset: const Offset(0, 4),
                                  blurRadius: 8,
                                  color: kWhiteColor.withOpacity(0.3),
                                ),
                                Shadow(
                                  offset: const Offset(0, 15),
                                  blurRadius: 15,
                                  color: kWhiteColor.withOpacity(0.2),
                                ),
                              ],
                            ),
                            textAlign: TextAlign.center,
                          ),
                          const Spacer(),
                        ],
                      ),
                    ),
                  ],
                ),
              ),
            ],
          ),
        ),
      );
    }

    return Scaffold(
      backgroundColor: kBackgroundColor,
      resizeToAvoidBottomInset: false,
      body: Stack(
        children: [
          backgroundSection(),
          contentSection(),
        ],
      ),
    );
  }
}
