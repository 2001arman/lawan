// ignore_for_file: deprecated_member_use

import 'package:country_state_city_pro/country_state_city_pro.dart';
import 'package:flutter/material.dart';
import 'package:flutter/services.dart';
import 'package:flutter_svg/svg.dart';
import 'package:get/get.dart';
import 'package:lawan/features/presentation/settings/personal_details/personal_details_logic.dart';
import 'package:lawan/utility/shared/constants/constants_ui.dart';
import 'package:lawan/utility/shared/widgets/gradient/horizontal_white_gradient.dart';
import 'package:lawan/utility/shared/widgets/navigations/custom_appbar.dart';

import '../../../../utility/shared/widgets/buttons/custom_button.dart';
import '../../../../utility/shared/widgets/buttons/gradient_button.dart';
import '../../../../utility/shared/widgets/custom_text_form_fields.dart';
import '../../../../utility/shared/widgets/inputs/choose_gender_widget.dart';
import '../../../../utility/shared/widgets/inputs/choose_language_widget.dart';
import '../../../../utility/util/dialogs/custom_dialog.dart';
import '../../../../utility/util/helper.dart';

class PersonalDetailsUi extends StatelessWidget {
  static const String namePath = '/personal_detail_page';
  final logic = Get.find<PersonalDetailsLogic>();
  final state = Get.find<PersonalDetailsLogic>().state;
  PersonalDetailsUi({super.key});

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

    Widget dateBirthSection() {
      return Row(
        children: [
          Expanded(
            child: CustomTextFormField(
              hintText: 'Date',
              controller: TextEditingController(),
              margin: defaultMargin,
              maxLength: 2,
              textInputType: const TextInputType.numberWithOptions(
                  signed: true, decimal: false),
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
                  state.monthController.text = Helper.monthNames[index + 1];
                },
              ),
              margin: defaultMargin,
              textInputType: const TextInputType.numberWithOptions(
                  signed: true, decimal: false),
              validator: (data) => Helper.numberValidator(data),
              inputFormatters: [
                FilteringTextInputFormatter.digitsOnly,
              ],
              showSuffix: true,
              suffix: Padding(
                padding: const EdgeInsets.symmetric(vertical: 12),
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

    Widget locationSection() {
      return CountryStateCityPicker(
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
          contentPadding:
              const EdgeInsets.symmetric(vertical: 12, horizontal: 16),
          filled: true,
          focusColor: kWhiteColor,
          fillColor: kWhiteColor,
          enabledBorder: OutlineInputBorder(
            borderRadius: BorderRadius.circular(30.0), // Rounded corners
            borderSide: const BorderSide(color: Colors.transparent),
          ),
          focusedBorder: OutlineInputBorder(
            borderRadius: BorderRadius.circular(30.0), // Rounded corners
            borderSide: const BorderSide(color: Colors.transparent),
          ),
          border: OutlineInputBorder(
            borderRadius: BorderRadius.circular(30.0), // Rounded corners
            borderSide: const BorderSide(color: Colors.transparent),
          ),
        ),
      );
    }

    return Scaffold(
      backgroundColor: kBackgroundColor,
      body: Padding(
        padding: EdgeInsets.fromLTRB(
          defaultMargin,
          MediaQuery.of(context).padding.top,
          defaultMargin,
          0,
        ),
        child: Column(
          children: [
            CustomAppbar(
              title: 'Tell us about yourself',
              iconColor: kDarkgreyColor,
              borderColor: kGreyColor,
              textColor: kBlackColor,
            ),
            Expanded(
              child: Stack(
                children: [
                  ListView(
                    padding: EdgeInsets.only(top: defaultMargin, bottom: 150),
                    children: [
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
                      Text('Date of birth', style: darkGreyTextStyle),
                      const SizedBox(height: 8),
                      dateBirthSection(),
                      Text(
                        'Your birthday won’t be shown publicly',
                        textAlign: TextAlign.center,
                        style: darkGreyTextStyle.copyWith(fontSize: 10),
                      ),
                      const SizedBox(height: 12),
                      Text(
                        'Phone',
                        style: darkGreyTextStyle,
                      ),
                      const SizedBox(height: 4),
                      phoneNumberSection(),
                      digitCodeSection(),
                      const SizedBox(height: 12),
                      Text(
                        'Request for OTP to change phone number',
                        textAlign: TextAlign.center,
                        style: darkGreyTextStyle.copyWith(fontSize: 10),
                      ),
                      const SizedBox(height: 12),
                      Text('Where are you located', style: darkGreyTextStyle),
                      const SizedBox(height: 8),
                      locationSection(),
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
                            onTap: () {},
                            paddingVertical: 19.5,
                            boxShadow: greenBoxShadow,
                            widget: Text(
                              'Save',
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
