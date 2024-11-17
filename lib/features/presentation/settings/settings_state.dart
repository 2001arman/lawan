import 'package:flutter/material.dart';
import 'package:get/get.dart';
import 'package:lawan/features/presentation/player/payment/payment/payment_page.dart';
import 'package:lawan/features/presentation/settings/ads/ads_ui.dart';
import 'package:lawan/features/presentation/settings/balance/balance_ui.dart';
import 'package:lawan/features/presentation/settings/notification_setting/notification_setting_ui.dart';
import 'package:lawan/features/presentation/settings/personal_details/personal_details_ui.dart';
import 'package:lawan/features/presentation/settings/privacy_and_security/privacy_and_security_ui.dart';
import 'package:lawan/features/presentation/settings/settings_logic.dart';

class SettingsState {
  final List<SettingItem> generalItems = [
    SettingItem(
      icon: 'assets/icons/shield-outline.svg',
      title: 'Privacy and security',
      onTap: () => Get.toNamed(PrivacyAndSecurityUi.namePath),
    ),
    SettingItem(
      icon: 'assets/icons/bell-bold.svg',
      title: 'Notifications',
      onTap: () => Get.toNamed(NotificationSettingUi.namePath),
    ),
    SettingItem(
      icon: 'assets/icons/theme.svg',
      title: 'Appearance',
      subTitle: 'Light',
      onTap: () => SettingsLogic().appearanceSheet(),
    ),
    SettingItem(
      icon: 'assets/icons/globe.svg',
      title: 'App language',
      subTitle: 'English',
      onTap: () => SettingsLogic().languageSheet(),
    ),
  ];

  final List<SettingItem> accountItems = [
    SettingItem(
      icon: 'assets/icons/user_thin.svg',
      title: 'Personal details',
      subTitle: 'View and edit your account information',
      onTap: () => Get.toNamed(PersonalDetailsUi.namePath),
    ),
    SettingItem(
      icon: 'assets/icons/wallet.svg',
      title: 'Balance Overview',
      subTitle: 'Top up your wallet to add in-app coins',
      onTap: () => Get.toNamed(BalanceUi.namePath),
    ),
    SettingItem(
      icon: 'assets/icons/credit-card.svg',
      title: 'Payment Method',
      subTitle: 'Update your preferred payment method',
      onTap: () => Get.toNamed(
        PaymentPage.namePath,
        arguments: [false],
      ),
    ),
    SettingItem(
      icon: 'assets/icons/user_thin.svg',
      title: 'Ads',
      subTitle: 'Promote your ads on Lawan',
      onTap: () => Get.toNamed(AdsUi.namePath),
    ),
    SettingItem(
      icon: 'assets/icons/x-circle.svg',
      title: 'Close account',
      subTitle: 'Close your personal account',
      onTap: () {},
    ),
  ];

  final List<SettingItem> moreItems = [
    SettingItem(
      icon: 'assets/icons/question-mark.svg',
      title: 'Help',
      onTap: () {},
    ),
    SettingItem(
      icon: 'assets/icons/info.svg',
      title: 'Our  agreements',
      onTap: () {},
    ),
    SettingItem(
      icon: 'assets/icons/logout.svg',
      title: 'Log out',
      onTap: () {},
    ),
  ];

  var selectedTheme = 'Light'.obs;
  var selectedLanguage = 'English'.obs;
}

class SettingItem {
  final String icon;
  final String title;
  final String? subTitle;
  final VoidCallback onTap;
  bool? valueRadio;

  SettingItem({
    required this.icon,
    required this.title,
    this.subTitle,
    required this.onTap,
    this.valueRadio,
  });
}
