// ignore_for_file: deprecated_member_use

import 'package:country_state_city_pro/country_state_city_pro.dart';
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
import '../../../../utility/util/dialogs/custom_dialog.dart';
import '../../../../utility/util/helper.dart';

class AuthInformationUi extends StatelessWidget {
  static const String namePath = '/auth_information_page';
  AuthInformationUi({super.key});
  final logic = Get.find<AuthInformationLogic>();
  final state = Get.find<AuthInformationLogic>().state;

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
                        hintText: 'Last Name / Family Name',
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
                      CountryStateCityPicker(
                        country: state.countryController,
                        state: state.stateController,
                        city: state.cityController,
                        dialogColor: Colors.grey.shade200,
                        textFieldDecoration: InputDecoration(
                          counterText: "",
                          suffixIcon: Padding(
                            padding: const EdgeInsets.symmetric(vertical: 12),
                            child: SvgPicture.asset(
                              'assets/icons/chevron-down.svg',
                              color: kBlackColor,
                            ),
                          ),
                          hintStyle: midGreyTextStyle.copyWith(
                            fontSize: 14,
                            fontWeight: FontWeight.normal,
                          ),
                          isDense: false,
                          contentPadding: const EdgeInsets.symmetric(
                              vertical: 12, horizontal: 16),
                          filled: true,
                          focusColor: kWhiteColor,
                          fillColor: kWhiteColor,
                          enabledBorder: OutlineInputBorder(
                            borderRadius:
                                BorderRadius.circular(30.0), // Rounded corners
                            borderSide:
                                const BorderSide(color: Colors.transparent),
                          ),
                          focusedBorder: OutlineInputBorder(
                            borderRadius:
                                BorderRadius.circular(30.0), // Rounded corners
                            borderSide:
                                const BorderSide(color: Colors.transparent),
                          ),
                          border: OutlineInputBorder(
                            borderRadius:
                                BorderRadius.circular(30.0), // Rounded corners
                            borderSide:
                                const BorderSide(color: Colors.transparent),
                          ),
                        ),
                      ),
                      const SizedBox(height: 12),
                      ChooseGenderWidget(
                        isMaleSelected: false.obs,
                        isFemaleSelected: true.obs,
                        borderColor: kGreyColor,
                        isMultipe: false,
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
                              maxLength: 2,
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
                              controller: state.monthController,
                              isReadOnly: true,
                              onTap: () => CustomDialog.chooseMonth(
                                selectedMonth: 0,
                                showAllData: false,
                                onSelected: (index) {
                                  state.monthController.text =
                                      Helper.monthNames[index + 1];
                                },
                              ),
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
                              maxLength: 4,
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
                          child: GradientButton(
                            onTap: () => Get.toNamed(AuthRecoveryUi.namePath),
                            paddingVertical: 19.5,
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
