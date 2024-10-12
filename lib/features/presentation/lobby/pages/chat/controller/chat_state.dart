import 'package:lawan/utility/shared/constants/action_type.dart';

class ChatState {
  List<ActionItem> actionItemList = [
    ActionItem(
      actionType: ActionType.alertAdmin,
      icon: 'assets/icons/headset.svg',
      name: 'Chat with Admin',
    ),
    ActionItem(
      actionType: ActionType.badWeather,
      icon: 'assets/icons/umbrella.svg',
      name: 'Bad weather',
    ),
    ActionItem(
      actionType: ActionType.reschedule,
      icon: 'assets/icons/calendar.svg',
      name: 'Reschedule session',
    ),
  ];
}

class ActionItem {
  final ActionType actionType;
  final String icon;
  final String name;

  ActionItem({
    required this.actionType,
    required this.icon,
    required this.name,
  });
}
