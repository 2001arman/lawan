import 'package:flutter/material.dart';
import 'package:get/get.dart';
import 'package:lawan/features/presentation/settings/privacy_and_security/privacy_and_security_logic.dart';
import 'package:lawan/utility/shared/constants/constants_ui.dart';
import 'package:lawan/utility/shared/widgets/navigations/custom_appbar.dart';

import '../../../../utility/shared/widgets/gradient/horizontal_white_gradient.dart';
import '../widgets/settings_list_container.dart';

class PrivacyAndSecurityUi extends StatelessWidget {
  static const String namePath = '/privacy_and_policy_page';
  final logic = Get.find<PrivacyAndSecurityLogic>();
  final state = Get.find<PrivacyAndSecurityLogic>().state;
  PrivacyAndSecurityUi({super.key});

  @override
  Widget build(BuildContext context) {
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
              title: 'Privacy and security',
              iconColor: kDarkgreyColor,
              borderColor: kGreyColor,
              textColor: kBlackColor,
            ),
            Expanded(
              child: Stack(
                children: [
                  ListView(
                    padding: EdgeInsets.only(top: defaultMargin, bottom: 50),
                    children: [
                      SettingsListContainer(
                        listSettings: state.securityItems,
                        title: 'Security',
                      ),
                      SettingsListContainer(
                        listSettings: state.privacyItems,
                        title: 'Privacy',
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
    );
  }
}
