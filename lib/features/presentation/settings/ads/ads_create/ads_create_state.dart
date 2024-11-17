import 'package:get/get.dart';
import 'package:lawan/features/presentation/settings/ads/ads_create/ads_create_logic.dart';

import '../../settings_state.dart';

class AdsCreateState {
  final List<SettingItem> moreItems = [
    SettingItem(
      icon: 'assets/icons/dollar-outline.svg',
      title: 'Budget',
      subTitle: 'Unlimited',
      onTap: () => AdsCreateLogic().budgetSheet(),
    ),
    SettingItem(
      icon: 'assets/icons/hourglass.svg',
      title: 'Duration',
      subTitle: '23 Sep 2024 - 23 Oct 2024',
      onTap: () => AdsCreateLogic().durationSheet(),
    ),
    SettingItem(
      icon: 'assets/icons/clapperboard-play-outline.svg',
      title: 'Placement',
      subTitle: 'Session, Stories',
      onTap: () {},
    ),
  ];

  final List<SettingItem> bindingItems = [
    SettingItem(
      icon: 'assets/icons/theme.svg',
      title: 'Method',
      subTitle: 'Auto Bidding (Maximize Reach)',
      onTap: () {},
    ),
  ];

  var selectedBudget = 'Set daily budget'.obs;
  var selectedDuration = 'Set start/end date'.obs;

  var imagePath = ''.obs;
  var videoPath = ''.obs;
}
