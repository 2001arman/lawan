// ignore_for_file: deprecated_member_use

import 'package:flutter/material.dart';
import 'package:flutter_svg/svg.dart';
import 'package:get/get.dart';
import 'package:lawan/features/presentation/referee/referee_logic.dart';
import 'package:lawan/utility/shared/widgets/buttons/filter_button.dart';

import '../../../utility/shared/constants/constants_ui.dart';
import '../../../utility/shared/constants/mode_type.dart';
import '../../../utility/shared/widgets/bottom_navbar_item.dart';
import '../../../utility/shared/widgets/navigations/custom_appbar_profile.dart';
import '../../../utility/shared/widgets/navigations/custom_bottom_navbar.dart';
import '../../../utility/util/dialogs/custom_dialog_profile.dart';
import '../player/widgets/player_session_content_section.dart';

class RefereeUi extends StatelessWidget {
  static const String namePath = '/referee-page';
  final logic = Get.find<RefereeLogic>();
  final state = Get.find<RefereeLogic>().state;
  RefereeUi({super.key});

  @override
  Widget build(BuildContext context) {
    Widget customNavbar() {
      return Stack(
        children: [
          Align(
            alignment: Alignment.bottomCenter,
            child: IgnorePointer(
              child: Container(
                width: double.infinity,
                height: 183,
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
            ),
          ),
          Align(
            alignment: Alignment.bottomCenter,
            child: Column(
              mainAxisAlignment: MainAxisAlignment.end,
              mainAxisSize: MainAxisSize.min,
              children: [
                Row(
                  mainAxisAlignment: MainAxisAlignment.center,
                  children: [
                    FilterButton(
                      paddingVertical: 12,
                      iconColor: kGreyColor,
                      textColor: kWhiteColor,
                      useBlur: true,
                    ),
                  ],
                ),
                CustomBottomNavbar(
                  useGradient: false,
                  navbarItemWidget: Obx(
                    () => Row(
                      children: state.listNavbarItem
                          .asMap()
                          .entries
                          .map(
                            (data) => Padding(
                              padding: EdgeInsets.only(
                                right:
                                    data.key != state.listNavbarItem.length - 1
                                        ? 4
                                        : 0,
                              ),
                              child: BottomNavbarItem(
                                title: data.value.name,
                                isActive:
                                    state.selectedNavbarIndex.value == data.key,
                                icon: data.value.icon,
                                onTap: () => logic.changeIndex(data.key),
                              ),
                            ),
                          )
                          .toList(),
                    ),
                  ),
                ),
              ],
            ),
          ),
        ],
      );
    }

    Widget sessionContentSection() {
      return PlayerSessionContentSection(
        emptySessionWidget: const SizedBox(),
        sessionList: state.sessionList,
        showDetailSession: (data) => logic.showDetailSession(data),
        paddingHorizontal: 0,
      );
    }

    return Scaffold(
      resizeToAvoidBottomInset: false,
      backgroundColor: kBackgroundColor,
      body: SafeArea(
        top: false,
        child: Stack(
          children: [
            Padding(
              padding: EdgeInsets.symmetric(horizontal: defaultMargin),
              child: Column(
                children: [
                  SizedBox(height: 58 + MediaQuery.of(context).padding.top),
                  const SizedBox(height: 8),
                  Container(
                    width: double.infinity,
                    padding: const EdgeInsets.all(14),
                    decoration: BoxDecoration(
                      borderRadius: BorderRadius.circular(32),
                      border: Border.all(width: 1, color: kGreyColor),
                    ),
                    child: Row(
                      mainAxisAlignment: MainAxisAlignment.center,
                      children: [
                        SvgPicture.asset(
                          'assets/icons/qrcode.svg',
                          color: kDarkgreyColor,
                          width: 16,
                          height: 16,
                        ),
                        const SizedBox(width: 4),
                        Text(
                          'Scan QR Code from Gallery',
                          style: blackTextStyle.copyWith(
                            fontSize: 14,
                            fontWeight: medium,
                            height: 21 / 14,
                          ),
                        ),
                      ],
                    ),
                  ),
                  // available session
                  SizedBox(height: defaultMargin),
                  Row(
                    children: [
                      Container(
                        padding: const EdgeInsets.symmetric(horizontal: 8),
                        decoration: BoxDecoration(
                          borderRadius: BorderRadius.circular(50),
                          color: kWhiteColor,
                        ),
                        child: Obx(
                          () => Text(
                            '${state.sessionList.length}',
                            style: blackTextStyle.copyWith(
                                fontSize: 11, fontWeight: medium),
                          ),
                        ),
                      ),
                      const SizedBox(width: 8),
                      Text(
                        'Available Session',
                        style: darkGreyTextStyle.copyWith(fontSize: 12),
                      ),
                    ],
                  ),
                  Obx(
                    () => Visibility(
                      visible: state.sessionList.isEmpty,
                      child: SizedBox(height: defaultMargin),
                    ),
                  ),
                  sessionContentSection(),
                ],
              ),
            ),
            // appbar
            Padding(
              padding: EdgeInsets.only(top: MediaQuery.paddingOf(context).top),
              child: CustomAppbarProfile(
                onTap: () => CustomDialogProfile.showDialogProfile(
                  source: ModeType.referee,
                ),
              ),
            ),

            // buttons
            Align(
              alignment: Alignment.bottomCenter,
              child: customNavbar(),
            ),
          ],
        ),
      ),
    );
  }
}
