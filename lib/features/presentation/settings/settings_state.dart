import 'package:flutter/material.dart';
import 'package:get/get.dart';
import 'package:lawan/features/presentation/settings/personal_details/personal_details_ui.dart';

class SettingsState {
  final List<SettingItem> generalItems = [
    SettingItem(
      icon: 'assets/icons/shield.svg',
      title: 'Privacy and security',
      onTap: () {},
    ),
    SettingItem(
      icon: 'assets/icons/bell.svg',
      title: 'Notifications',
      onTap: () {},
    ),
    SettingItem(
      icon: 'assets/icons/theme.svg',
      title: 'Appearance',
      subTitle: 'Light',
      onTap: () {},
    ),
    SettingItem(
      icon: 'assets/icons/globe.svg',
      title: 'App language',
      subTitle: 'English',
      onTap: () {},
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
      onTap: () {},
    ),
    SettingItem(
      icon: 'assets/icons/credit-card.svg',
      title: 'Payment Method',
      subTitle: 'Update your preferred payment method',
      onTap: () {},
    ),
    SettingItem(
      icon: 'assets/icons/user_thin.svg',
      title: 'Ads',
      subTitle: 'Promote your ads on Lawan',
      onTap: () {},
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
}

class SettingItem {
  final String icon;
  final String title;
  final String? subTitle;
  final VoidCallback onTap;

  SettingItem({
    required this.icon,
    required this.title,
    this.subTitle,
    required this.onTap,
  });
}
