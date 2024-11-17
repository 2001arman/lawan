import 'package:flutter/material.dart';
import 'package:get/get.dart';
import 'package:lawan/features/presentation/settings/notification_setting/notification_setting_logic.dart';
import 'package:lawan/utility/shared/constants/constants_ui.dart';
import 'package:lawan/utility/shared/widgets/gradient/horizontal_black_gradient.dart';

import '../../../../utility/shared/widgets/gradient/horizontal_white_gradient.dart';
import '../../../../utility/shared/widgets/navigations/custom_appbar.dart';
import '../widgets/settings_list_container.dart';

class NotificationSettingUi extends StatelessWidget {
  static const String namePath = '/notification_setting_page';
  final logic = Get.find<NotificationSettingLogic>();
  final state = Get.find<NotificationSettingLogic>().state;
  NotificationSettingUi({super.key});

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      backgroundColor: kBackgroundColor,
      body: Stack(
        children: [
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
                  title: 'Notifications',
                  iconColor: kDarkgreyColor,
                  borderColor: kGreyColor,
                  textColor: kBlackColor,
                ),
                Expanded(
                  child: Stack(
                    children: [
                      ListView(
                        padding:
                            EdgeInsets.only(top: defaultMargin, bottom: 50),
                        children: [
                          SettingsListContainer(
                            listSettings: state.allowItems,
                            title:
                                'Get notified about important updates and spot any suspicious account activity',
                          ),
                          SettingsListContainer(
                            listSettings: state.invitationItems,
                            title: 'Notifications about session invitation',
                          ),
                          SettingsListContainer(
                            listSettings: state.activitiesItems,
                            title: 'Notifications about following actitivities',
                          ),
                          SettingsListContainer(
                            listSettings: state.newsItems,
                            title:
                                'News about our latest and greatest work. Plus tips on using Lawan.',
                          ),
                          SettingsListContainer(
                            listSettings: state.productsItems,
                            title:
                                'Invite to test new products and share feedback',
                          ),
                          SettingsListContainer(
                            listSettings: state.updateItems,
                            title:
                                'Updates about causes we care about. Chances to get involved.',
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
