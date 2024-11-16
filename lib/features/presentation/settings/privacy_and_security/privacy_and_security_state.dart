import '../settings_state.dart';

class PrivacyAndSecurityState {
  final List<SettingItem> securityItems = [
    SettingItem(
      icon: 'assets/icons/mail.svg',
      title: 'Change your email address',
      subTitle: 'address@email.com',
      onTap: () {},
    ),
    SettingItem(
      icon: 'assets/icons/lock.svg',
      title: 'Change password',
      subTitle: '******',
      onTap: () {},
    ),
    SettingItem(
      icon: 'assets/icons/logout.svg',
      title: 'Log out everywhere',
      subTitle:
          'If you notice any suspicious activity, log out of Lawan across all devices',
      onTap: () {},
    ),
  ];

  final List<SettingItem> privacyItems = [
    SettingItem(
      icon: 'assets/icons/users-outline.svg',
      title: 'Sync your phone contacts',
      subTitle: 'Send and request from your contacts who have a Lawan account',
      onTap: () {},
      valueRadio: false,
    ),
    SettingItem(
      icon: 'assets/icons/face-id.svg',
      title: 'Biometric data',
      subTitle:
          'Allow Lawan to store and use your selfie and IF for automated verficiation',
      onTap: () {},
      valueRadio: true,
    ),
    SettingItem(
      icon: 'assets/icons/info.svg',
      title: 'Privacy policy',
      onTap: () {},
    ),
  ];
}
