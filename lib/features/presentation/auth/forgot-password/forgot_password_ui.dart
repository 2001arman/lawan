// ignore_for_file: deprecated_member_use

import 'package:flutter/material.dart';
import 'package:flutter/services.dart';
import 'package:flutter_svg/svg.dart';
import 'package:get/get.dart';
import 'package:lawan/features/presentation/auth/forgot-password/forgot_password_logic.dart';
import 'package:lawan/utility/shared/constants/constants_ui.dart';
import 'package:lawan/utility/shared/widgets/buttons/gradient_button.dart';
import 'package:lawan/utility/shared/widgets/navigations/custom_appbar.dart';

import '../../../../utility/shared/widgets/buttons/custom_button.dart';
import '../../../../utility/shared/widgets/custom_text_form_fields.dart';
import '../../../../utility/util/helper.dart';

class ForgotPasswordUi extends StatelessWidget {
  static const String namePath = '/forgot_password_page';
  final logic = Get.find<ForgotPasswordLogic>();
  ForgotPasswordUi({super.key});

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
              controller: TextEditingController(),
              margin: defaultMargin,
              textInputType: const TextInputType.numberWithOptions(
                  signed: true, decimal: false),
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
              controller: TextEditingController(),
              textInputType: const TextInputType.numberWithOptions(
                  signed: true, decimal: false),
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

    Widget phoneSection() {
      return Padding(
        padding: EdgeInsets.symmetric(horizontal: defaultMargin),
        child: Column(
          crossAxisAlignment: CrossAxisAlignment.start,
          children: [
            Text(
              'We’ll send a code to your phone.',
              style: darkGreyTextStyle,
            ),
            const SizedBox(height: 4),
            phoneNumberSection(),
            digitCodeSection(),
          ],
        ),
      );
    }

    Widget emailSection() {
      return Padding(
        padding: EdgeInsets.symmetric(horizontal: defaultMargin),
        child: Column(
          crossAxisAlignment: CrossAxisAlignment.start,
          children: [
            Text(
              'We’ll email you a code to reset your password.',
              style: darkGreyTextStyle,
            ),
            const SizedBox(height: 4),
            CustomTextFormField(
              hintText: 'Email address',
              controller: TextEditingController(),
              margin: defaultMargin,
              prefix: Padding(
                padding: const EdgeInsets.symmetric(vertical: 14),
                child: SvgPicture.asset(
                  'assets/icons/mail.svg',
                  color: kMidgreyColor,
                ),
              ),
            ),
          ],
        ),
      );
    }

    return Scaffold(
      backgroundColor: kBackgroundColor,
      body: Column(
        crossAxisAlignment: CrossAxisAlignment.start,
        children: [
          SizedBox(height: MediaQuery.of(context).padding.top),
          Padding(
            padding: EdgeInsets.symmetric(horizontal: defaultMargin),
            child: CustomAppbar(
              title: 'Enter your phone number',
              iconColor: kBlackColor,
              borderColor: kGreyColor,
              textColor: kBlackColor,
            ),
          ),
          SizedBox(height: defaultMargin),
          Visibility(
            visible: logic.isPhone,
            replacement: emailSection(),
            child: phoneSection(),
          ),
          const Spacer(),
          SizedBox(
            height: 110,
            width: double.infinity,
            child: Stack(
              children: [
                Container(
                  width: double.infinity,
                  height: 110,
                  padding: const EdgeInsets.only(top: 12),
                  decoration: BoxDecoration(
                    gradient: LinearGradient(
                      begin: Alignment.topCenter,
                      end: Alignment.bottomCenter,
                      colors: [
                        kBlackColor.withOpacity(0),
                        kBlackColor.withOpacity(0.4),
                      ],
                    ),
                  ),
                ),
                Align(
                  alignment: Alignment.bottomCenter,
                  child: Container(
                    height: 48,
                    margin: EdgeInsets.fromLTRB(
                      16,
                      0,
                      16,
                      MediaQuery.of(context).padding.bottom,
                    ),
                    child: GradientButton(
                      widget: Text(
                        'Reset',
                        style: whiteTextStyle.copyWith(fontWeight: medium),
                      ),
                      onTap: logic.gotoMainPage,
                    ),
                  ),
                ),
              ],
            ),
          ),
        ],
      ),
    );
  }
}
