import '../settings_state.dart';

class NotificationSettingState {
  final List<SettingItem> allowItems = [
    SettingItem(
      icon: 'assets/icons/bell.svg',
      title: 'Allow notifications',
      onTap: () {},
      valueRadio: true,
    ),
  ];

  final List<SettingItem> invitationItems = [
    SettingItem(
      icon: 'assets/icons/mail.svg',
      title: 'Email',
      onTap: () {},
      valueRadio: true,
    ),
    SettingItem(
      icon: 'assets/icons/device-mobile-bold.svg',
      title: 'Email',
      onTap: () {},
      valueRadio: true,
    ),
  ];
  final List<SettingItem> activitiesItems = [
    SettingItem(
      icon: 'assets/icons/mail.svg',
      title: 'Email',
      onTap: () {},
      valueRadio: true,
    ),
    SettingItem(
      icon: 'assets/icons/device-mobile-bold.svg',
      title: 'Email',
      onTap: () {},
      valueRadio: true,
    ),
  ];

  final List<SettingItem> newsItems = [
    SettingItem(
      icon: 'assets/icons/mail.svg',
      title: 'Email',
      onTap: () {},
      valueRadio: true,
    ),
    SettingItem(
      icon: 'assets/icons/device-mobile-bold.svg',
      title: 'Email',
      onTap: () {},
      valueRadio: true,
    ),
  ];

  final List<SettingItem> productsItems = [
    SettingItem(
      icon: 'assets/icons/mail.svg',
      title: 'Email',
      onTap: () {},
      valueRadio: true,
    ),
  ];

  final List<SettingItem> updateItems = [
    SettingItem(
      icon: 'assets/icons/mail.svg',
      title: 'Email',
      onTap: () {},
      valueRadio: false,
    ),
  ];
}
