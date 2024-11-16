// ignore_for_file: deprecated_member_use

import 'package:flutter/material.dart';
import 'package:get/get.dart';
import 'package:lawan/features/presentation/settings/settings_logic.dart';
import 'package:lawan/features/presentation/settings/widgets/settings_list_container.dart';
import 'package:lawan/utility/shared/constants/constants_ui.dart';
import 'package:lawan/utility/shared/widgets/gradient/horizontal_white_gradient.dart';
import 'package:lawan/utility/shared/widgets/navigations/custom_appbar.dart';

import '../../../utility/shared/widgets/gradient/horizontal_black_gradient.dart';

class SettingsUi extends StatelessWidget {
  static const String namePath = '/setting_page';
  final logic = Get.find<SettingsLogic>();
  final state = Get.find<SettingsLogic>().state;
  SettingsUi({super.key});

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      backgroundColor: kBackgroundColor,
      body: Stack(
        children: [
          Padding(
            padding: EdgeInsets.fromLTRB(defaultMargin,
                MediaQuery.of(context).padding.top, defaultMargin, 0),
            child: Column(
              children: [
                CustomAppbar(
                  title: 'Settings',
                  iconColor: kDarkgreyColor,
                  borderColor: kGreyColor,
                  textColor: kBlackColor,
                  prefixIcon: 'assets/icons/settings.svg',
                ),
                Expanded(
                  child: Stack(
                    children: [
                      ListView(
                        padding:
                            EdgeInsets.only(top: defaultMargin, bottom: 50),
                        children: [
                          SettingsListContainer(
                            listSettings: state.generalItems,
                            title: 'General',
                          ),
                          SettingsListContainer(
                            listSettings: state.accountItems,
                            title: 'Account actions',
                          ),
                          SettingsListContainer(
                            listSettings: state.moreItems,
                            title: 'More',
                          ),
                        ],
                      ),
                      const HorizontalWhiteGradient(),
                    ],
                  ),
                ),
              ],
            ),
          ),
          const Align(
            alignment: Alignment.bottomCenter,
            child: HorizontalBlackGradient(),
          ),
        ],
      ),
    );
  }
}
