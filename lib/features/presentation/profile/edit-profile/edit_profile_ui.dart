// ignore_for_file: deprecated_member_use

import 'package:country_state_city_pro/country_state_city_pro.dart';
import 'package:flutter/material.dart';
import 'package:flutter_svg/svg.dart';
import 'package:get/get.dart';
import 'package:lawan/features/presentation/profile/edit-profile/edit_profile_logic.dart';
import 'package:lawan/utility/shared/widgets/buttons/circle_button_transparent_widget.dart';

import '../../../../utility/shared/constants/constants_ui.dart';
import '../../../../utility/shared/constants/mode_type.dart';
import '../../../../utility/shared/widgets/avatar_shadow_with_text.dart';
import '../../../../utility/shared/widgets/container/achievement_container.dart';
import '../../../../utility/shared/widgets/custom_text_form_fields.dart';
import '../../../../utility/shared/widgets/navigations/custom_appbar_profile.dart';
import '../../../../utility/util/dialogs/custom_dialog_profile.dart';

class EditProfileUi extends StatelessWidget {
  static const String namePath = '/edit_profile_page';
  final logic = Get.find<EditProfileLogic>();
  final state = Get.find<EditProfileLogic>().state;
  EditProfileUi({super.key});

  @override
  Widget build(BuildContext context) {
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

    Widget body() {
      return Expanded(
        child: Padding(
          padding: EdgeInsets.symmetric(
            horizontal: defaultMargin,
            vertical: defaultMargin,
          ),
          child: Stack(
            children: [
              ListView(
                // crossAxisAlignment: CrossAxisAlignment.start,
                children: [
                  const Center(child: AvatarShadowWithText()),
                  SizedBox(height: defaultMargin),
                  Text('Preferred Name', style: darkGreyTextStyle),
                  const SizedBox(height: 8),
                  CustomTextFormField(
                    hintText: 'First Name',
                    prefix: Column(
                      mainAxisAlignment: MainAxisAlignment.center,
                      children: [
                        SvgPicture.asset(
                          'assets/icons/user.svg',
                          width: 18,
                          height: 18,
                          color: kMidgreyColor,
                        ),
                      ],
                    ),
                    controller: TextEditingController(text: 'Jese Leos'),
                  ),
                  Center(
                    child: Text(
                      'This will appear on your player profile',
                      textAlign: TextAlign.center,
                      style: darkGreyTextStyle.copyWith(fontSize: 10),
                    ),
                  ),
                  SizedBox(height: defaultMargin),
                  Text('Where are you located', style: darkGreyTextStyle),
                  const SizedBox(height: 8),
                  locationSection(),
                  SizedBox(height: defaultMargin),
                  Text('Achievement', style: darkGreyTextStyle),
                  SizedBox(height: defaultMargin),
                  Container(
                    width: double.infinity,
                    padding: EdgeInsets.fromLTRB(
                      defaultMargin,
                      12,
                      defaultMargin,
                      defaultMargin,
                    ),
                    decoration: BoxDecoration(
                      borderRadius: BorderRadius.circular(32),
                      color: kWhiteColor,
                    ),
                    child: Obx(
                      () => Column(
                        children: [
                          Row(
                            crossAxisAlignment: CrossAxisAlignment.start,
                            children: state.listAchievement
                                .map(
                                  (data) => Expanded(
                                    child: Column(
                                      crossAxisAlignment:
                                          CrossAxisAlignment.center,
                                      children: [
                                        GestureDetector(
                                          onTap: data.isSelected.toggle,
                                          child: AchievementContainer(
                                            icon: data.icon,
                                            size: 53,
                                            isSelected: data.isSelected.value,
                                          ),
                                        ),
                                        const SizedBox(height: 8),
                                        Text(
                                          data.title,
                                          style: darkGreyTextStyle.copyWith(
                                              fontSize: 10, fontWeight: medium),
                                        ),
                                      ],
                                    ),
                                  ),
                                )
                                .toList(),
                          ),
                          SizedBox(height: defaultMargin),
                          Row(
                            crossAxisAlignment: CrossAxisAlignment.start,
                            children: state.listAchievement2
                                .map(
                                  (data) => Expanded(
                                    child: Column(
                                      crossAxisAlignment:
                                          CrossAxisAlignment.center,
                                      children: [
                                        GestureDetector(
                                          onTap: data.isSelected.toggle,
                                          child: AchievementContainer(
                                            icon: data.icon,
                                            size: 53,
                                            isSelected: data.isSelected.value,
                                          ),
                                        ),
                                        const SizedBox(height: 8),
                                        Text(
                                          data.title,
                                          style: darkGreyTextStyle.copyWith(
                                              fontSize: 10, fontWeight: medium),
                                        ),
                                      ],
                                    ),
                                  ),
                                )
                                .toList(),
                          ),
                        ],
                      ),
                    ),
                  )
                ],
              ),
              Align(
                alignment: Alignment.topLeft,
                child: CircleButtonTransparentWidget(
                  onTap: Get.back,
                  widget: SvgPicture.asset(
                    'assets/icons/back.svg',
                    color: kDarkgreyColor,
                  ),
                  backgroundColor: kModalColor,
                ),
              ),
            ],
          ),
        ),
      );
    }

    return Scaffold(
      backgroundColor: kBackgroundColor,
      body: Stack(
        children: [
          Container(
            width: double.infinity,
            height: 500,
            decoration: BoxDecoration(
              gradient: backgroundGradient,
            ),
          ),
          // content
          Padding(
            padding: EdgeInsets.only(top: MediaQuery.paddingOf(context).top),
            child: Column(
              children: [
                CustomAppbarProfile(
                  onTap: () => CustomDialogProfile.showDialogProfile(
                    source: ModeType.player,
                  ),
                ),
                body(),
              ],
            ),
          ),
          // buttons
          Align(
            alignment: Alignment.bottomCenter,
            child: Container(
              width: double.infinity,
              height: 100,
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
          ),
        ],
      ),
    );
  }
}
