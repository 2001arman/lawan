// ignore_for_file: deprecated_member_use

import 'package:flutter/material.dart';
import 'package:flutter/services.dart';
import 'package:flutter_svg/svg.dart';
import 'package:get/get.dart';
import 'package:lawan/features/presentation/auth/auth_logic.dart';
import 'package:lawan/features/presentation/auth/information/auth_information_ui.dart';
import 'package:lawan/utility/shared/constants/constants_ui.dart';
import 'package:lawan/utility/shared/widgets/buttons/custom_button.dart';
import 'package:lawan/utility/shared/widgets/buttons/gradient_button.dart';
import 'package:lawan/utility/shared/widgets/navigations/custom_appbar.dart';

import '../../../utility/shared/widgets/custom_text_form_fields.dart';
import '../../../utility/shared/widgets/navigations/tab_bar_widget.dart';
import '../../../utility/util/helper.dart';

class AuthUi extends StatelessWidget {
  static const String namePath = '/auth_page';
  AuthUi({super.key});
  final logic = Get.find<AuthLogic>();
  final state = Get.find<AuthLogic>().state;

  @override
  Widget build(BuildContext context) {
    Widget contentSection() {
      return Align(
        alignment: Alignment.bottomCenter,
        child: Container(
          padding: EdgeInsets.symmetric(horizontal: defaultMargin),
          width: double.infinity,
          height: 311,
          margin: const EdgeInsets.only(bottom: 24),
          child: Column(
            crossAxisAlignment: CrossAxisAlignment.start,
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
              Text(
                'Phone',
                style: darkGreyTextStyle,
              ),
              const SizedBox(height: 4),
              Row(
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
                      controller: TextEditingController(),
                      margin: defaultMargin,
                      textInputType: TextInputType.number,
                      validator: (data) => Helper.numberValidator(data),
                      inputFormatters: [
                        FilteringTextInputFormatter.digitsOnly,
                      ],
                    ),
                  ),
                ],
              ),
              Row(
                crossAxisAlignment: CrossAxisAlignment.center,
                children: [
                  Expanded(
                    child: CustomTextFormField(
                      hintText: 'Phone number',
                      controller: TextEditingController(),
                      textInputType: TextInputType.number,
                      validator: (data) => Helper.numberValidator(data),
                      margin: 0,
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
              ),
              SizedBox(height: defaultMargin),
              GradientButton(
                onTap: () => Get.toNamed(AuthInformationUi.namePath),
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
              )
            ],
          ),
        ),
      );
    }

    Widget backgroundSection() {
      return Container(
        width: Get.width,
        height: Get.height - 311,
        color: kBlackColor,
        child: Stack(
          children: [
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
                MediaQuery.of(context).padding.top,
                defaultMargin,
                0,
              ),
              child: Column(
                children: [
                  CustomAppbar(
                    title: 'Sign Up',
                    iconColor: kWhiteColor,
                    borderColor: kGreyColor,
                    textColor: kWhiteColor,
                  ),
                  Expanded(
                    child: Column(
                      mainAxisAlignment: MainAxisAlignment.center,
                      children: [
                        Image.asset(
                          'assets/icons/logo_and_title.png',
                          width: 236,
                        ),
                        const SizedBox(height: 48),
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
                      ],
                    ),
                  ),
                ],
              ),
            ),
          ],
        ),
      );
    }

    return Scaffold(
      backgroundColor: kBackgroundColor,
      body: Stack(
        children: [
          backgroundSection(),
          contentSection(),
        ],
      ),
    );
  }
}
