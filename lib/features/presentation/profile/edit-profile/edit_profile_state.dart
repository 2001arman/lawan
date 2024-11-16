import 'package:flutter/cupertino.dart';
import 'package:get/get.dart';

class EditProfileState {
  TextEditingController countryController = TextEditingController();
  TextEditingController stateController = TextEditingController();
  TextEditingController cityController = TextEditingController();

  final List<AchievementItem> listAchievement = [
    AchievementItem(
      icon: 'assets/achievement/Award.svg',
      title: 'LPL 2021\nChampion',
      isSelected: true.obs,
    ),
    AchievementItem(
      icon: 'assets/achievement/Award.svg',
      title: 'LPL 2021\nChampion',
      isSelected: true.obs,
    ),
    AchievementItem(
      icon: 'assets/achievement/Award.svg',
      title: 'LPL 2021\nChampion',
      isSelected: false.obs,
    ),
    AchievementItem(
      icon: 'assets/achievement/Medal.svg',
      title: 'Finisher',
      isSelected: false.obs,
    ),
    AchievementItem(
      icon: 'assets/achievement/Medal.svg',
      title: 'MVP\nHunter',
      isSelected: false.obs,
    ),
    AchievementItem(
      icon: 'assets/achievement/Award.svg',
      title: 'LPL 2021\nChampion',
      isSelected: false.obs,
    ),
    AchievementItem(
      icon: 'assets/achievement/Award.svg',
      title: 'LPL 2021\nChampion',
      isSelected: false.obs,
    ),
    AchievementItem(
      icon: 'assets/achievement/Award.svg',
      title: 'LPL 2021\nChampion',
      isSelected: true.obs,
    ),
    AchievementItem(
      icon: 'assets/achievement/Medal.svg',
      title: 'Finisher',
      isSelected: false.obs,
    ),
    AchievementItem(
      icon: 'assets/achievement/Medal.svg',
      title: 'MVP\nHunter',
      isSelected: false.obs,
    ),
  ];
}

class AchievementItem {
  final String icon;
  final String title;
  final RxBool isSelected;

  AchievementItem({
    required this.icon,
    required this.title,
    required this.isSelected,
  });
}
