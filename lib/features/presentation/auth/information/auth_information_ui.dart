// ignore_for_file: deprecated_member_use

import 'package:flutter/material.dart';
import 'package:flutter/services.dart';
import 'package:flutter_svg/svg.dart';
import 'package:get/get.dart';
import 'package:lawan/features/presentation/auth/information/auth_information_logic.dart';
import 'package:lawan/features/presentation/auth/information/recovery/auth_recovery_ui.dart';
import 'package:lawan/utility/shared/widgets/buttons/gradient_button.dart';
import 'package:lawan/utility/shared/widgets/custom_text_form_fields.dart';
import 'package:lawan/utility/shared/widgets/gradient/horizontal_white_gradient.dart';
import 'package:lawan/utility/shared/widgets/inputs/choose_gender_widget.dart';
import 'package:lawan/utility/shared/widgets/inputs/choose_language_widget.dart';

import '../../../../utility/shared/constants/constants_ui.dart';
import '../../../../utility/shared/widgets/navigations/custom_appbar.dart';
import '../../../../utility/util/helper.dart';

class AuthInformationUi extends StatelessWidget {
  static const String namePath = '/auth_information_page';
  AuthInformationUi({super.key});
  final logic = Get.find<AuthInformationLogic>();

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      backgroundColor: kBackgroundColor,
      body: Padding(
        padding: EdgeInsets.fromLTRB(
          defaultMargin,
          MediaQuery.of(context).padding.top + defaultMargin,
          defaultMargin,
          MediaQuery.of(context).padding.bottom + defaultMargin,
        ),
        child: Column(
          children: [
            CustomAppbar(
              title: 'Profile Information',
              iconColor: kBlackColor,
              borderColor: kGreyColor,
              textColor: kBlackColor,
            ),
            Expanded(
              child: Stack(
                clipBehavior: Clip.none,
                children: [
                  ListView(
                    padding: EdgeInsets.zero,
                    children: [
                      const SizedBox(height: 8),
                      const HorizontalWhiteGradient(),
                      Text('Personal Details', style: darkGreyTextStyle),
                      const SizedBox(height: 8),
                      CustomTextFormField(
                        hintText: 'First Name',
                        controller: TextEditingController(),
                      ),
                      CustomTextFormField(
                        hintText: 'Last Name',
                        controller: TextEditingController(),
                      ),
                      Text('Nickname', style: darkGreyTextStyle),
                      const SizedBox(height: 8),
                      CustomTextFormField(
                        hintText: 'Fe.g. Aiman Along',
                        controller: TextEditingController(),
                        prefix: Padding(
                          padding: const EdgeInsets.symmetric(vertical: 14),
                          child: SvgPicture.asset(
                            'assets/icons/user.svg',
                            color: kMidgreyColor,
                          ),
                        ),
                      ),
                      Text(
                        'This will appear on your player profile',
                        textAlign: TextAlign.center,
                        style: darkGreyTextStyle.copyWith(fontSize: 10),
                      ),
                      const SizedBox(height: 12),
                      Text('Where are you located', style: darkGreyTextStyle),
                      const SizedBox(height: 8),
                      CustomTextFormField(
                        hintText: 'First Name',
                        controller: TextEditingController(text: 'Malaysia'),
                        showSuffix: true,
                        suffix: Padding(
                          padding: const EdgeInsets.symmetric(vertical: 12),
                          child: SvgPicture.asset(
                            'assets/icons/chevron-down.svg',
                            color: kBlackColor,
                          ),
                        ),
                      ),
                      CustomTextFormField(
                        hintText: 'State',
                        controller: TextEditingController(),
                        showSuffix: true,
                        suffix: Padding(
                          padding: const EdgeInsets.symmetric(vertical: 12),
                          child: SvgPicture.asset(
                            'assets/icons/chevron-down.svg',
                            color: kBlackColor,
                          ),
                        ),
                      ),
                      CustomTextFormField(
                        hintText: 'Region',
                        controller: TextEditingController(),
                        showSuffix: true,
                        suffix: Padding(
                          padding: const EdgeInsets.symmetric(vertical: 12),
                          child: SvgPicture.asset(
                            'assets/icons/chevron-down.svg',
                            color: kBlackColor,
                          ),
                        ),
                      ),
                      ChooseGenderWidget(
                        isMaleSelected: false.obs,
                        isFemaleSelected: true.obs,
                        borderColor: kGreyColor,
                      ),
                      const SizedBox(height: 12),
                      ChooseLanguageWidget(
                        isMalaySelected: false.obs,
                        isEnglishSelected: true.obs,
                        borderColor: kGreyColor,
                      ),
                      const SizedBox(height: 12),
                      Text('Date of birth', style: darkGreyTextStyle),
                      const SizedBox(height: 8),
                      Row(
                        children: [
                          Expanded(
                            child: CustomTextFormField(
                              hintText: 'Date',
                              controller: TextEditingController(),
                              margin: defaultMargin,
                              textInputType: TextInputType.number,
                              validator: (data) => Helper.numberValidator(data),
                              inputFormatters: [
                                FilteringTextInputFormatter.digitsOnly,
                              ],
                            ),
                          ),
                          const SizedBox(width: 12),
                          Expanded(
                            child: CustomTextFormField(
                              hintText: 'Month',
                              controller: TextEditingController(),
                              margin: defaultMargin,
                              textInputType: TextInputType.number,
                              validator: (data) => Helper.numberValidator(data),
                              inputFormatters: [
                                FilteringTextInputFormatter.digitsOnly,
                              ],
                              showSuffix: true,
                              suffix: Padding(
                                padding:
                                    const EdgeInsets.symmetric(vertical: 12),
                                child: SvgPicture.asset(
                                  'assets/icons/chevron-down.svg',
                                  color: kBlackColor,
                                ),
                              ),
                            ),
                          ),
                          const SizedBox(width: 12),
                          Expanded(
                            child: CustomTextFormField(
                              hintText: 'Year',
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
                      const SizedBox(height: 150),
                    ],
                  ),
                  const HorizontalWhiteGradient(),
                  Align(
                    alignment: Alignment.bottomCenter,
                    child: Column(
                      mainAxisAlignment: MainAxisAlignment.end,
                      children: [
                        IgnorePointer(
                          child: Container(
                            width: double.infinity,
                            height: 100,
                            decoration: BoxDecoration(
                              gradient: LinearGradient(
                                begin: Alignment.bottomCenter,
                                end: Alignment.topCenter,
                                colors: [
                                  kBackgroundColor,
                                  kBackgroundColor.withOpacity(0),
                                ],
                              ),
                            ),
                          ),
                        ),
                        Container(
                          color: kBackgroundColor,
                          padding: EdgeInsets.only(
                            bottom: MediaQuery.of(context).padding.bottom,
                          ),
                          child: GradientButton(
                            onTap: () => Get.toNamed(AuthRecoveryUi.namePath),
                            boxShadow: greenBoxShadow,
                            widget: Text(
                              'Continue',
                              style:
                                  whiteTextStyle.copyWith(fontWeight: medium),
                            ),
                          ),
                        ),
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
}
