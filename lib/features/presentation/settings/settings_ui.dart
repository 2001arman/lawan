// ignore_for_file: deprecated_member_use

import 'package:flutter/material.dart';
import 'package:flutter_svg/svg.dart';
import 'package:get/get.dart';
import 'package:lawan/features/presentation/settings/settings_logic.dart';
import 'package:lawan/features/presentation/settings/settings_state.dart';
import 'package:lawan/utility/shared/constants/constants_ui.dart';
import 'package:lawan/utility/shared/widgets/buttons/circle_button_transparent_widget.dart';
import 'package:lawan/utility/shared/widgets/gradient/horizontal_white_gradient.dart';
import 'package:lawan/utility/shared/widgets/navigations/custom_appbar.dart';

class SettingsUi extends StatelessWidget {
  static const String namePath = '/setting_page';
  final logic = Get.find<SettingsLogic>();
  final state = Get.find<SettingsLogic>().state;
  SettingsUi({super.key});

  @override
  Widget build(BuildContext context) {
    Widget settingsListContainer({
      required List<SettingItem> listSettings,
    }) {
      return Container(
        width: double.infinity,
        padding: EdgeInsets.all(defaultMargin),
        margin: EdgeInsets.only(bottom: defaultMargin),
        decoration: BoxDecoration(
          borderRadius: BorderRadius.circular(20),
          color: kWhiteColor,
        ),
        child: Column(
          crossAxisAlignment: CrossAxisAlignment.start,
          children: [
            Text(
              'General',
              style: darkGreyTextStyle.copyWith(fontWeight: medium),
            ),
            ...listSettings.map(
              (data) => GestureDetector(
                onTap: data.onTap,
                child: Padding(
                  padding: EdgeInsets.only(top: defaultMargin),
                  child: Row(
                    children: [
                      CircleButtonTransparentWidget(
                        onTap: () {},
                        widget: SvgPicture.asset(
                          data.icon,
                          color: kBlackColor,
                          width: 24,
                          height: 24,
                        ),
                        borderColor: kGreyColor,
                      ),
                      const SizedBox(width: 12),
                      Expanded(
                        child: Column(
                          crossAxisAlignment: CrossAxisAlignment.start,
                          children: [
                            Text(
                              data.title,
                              style:
                                  blackTextStyle.copyWith(fontWeight: medium),
                            ),
                            if (data.subTitle != null)
                              Text(
                                data.subTitle!,
                                style: darkGreyTextStyle.copyWith(fontSize: 12),
                              )
                          ],
                        ),
                      ),
                      SvgPicture.asset(
                        'assets/icons/chevron-right.svg',
                        width: 24,
                        height: 24,
                      ),
                    ],
                  ),
                ),
              ),
            ),
          ],
        ),
      );
    }

    return Scaffold(
      backgroundColor: kBackgroundColor,
      body: Padding(
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
                    padding: EdgeInsets.only(top: defaultMargin, bottom: 50),
                    children: [
                      settingsListContainer(listSettings: state.generalItems),
                      settingsListContainer(listSettings: state.accountItems),
                      settingsListContainer(listSettings: state.moreItems),
                    ],
                  ),
                  const HorizontalWhiteGradient(),
                ],
              ),
            ),
          ],
        ),
      ),
    );
  }
}
