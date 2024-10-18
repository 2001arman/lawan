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

  List<ChatModel> listChat = [
    ChatModel(
      name: 'Saiful Bukhari',
      avatarImage: 'assets/avatars/avatar3.png',
      listChatData: [
        ChatData(chatText: 'Hi, Where is everyone?', time: '10:01 am'),
      ],
    ),
    ChatModel(
      name: 'Saiful Bukhari',
      avatarImage: 'assets/avatars/avatar3.png',
      isMe: true,
      listChatData: [
        ChatData(chatText: 'Still waiting for them ...', time: '10:20 am'),
      ],
    ),
    ChatModel(
      name: 'Syed Mokhtar',
      avatarImage: 'assets/avatars/avatar2.png',
      listChatData: [
        ChatData(chatText: 'Cominggg!', time: '11:01 am'),
        ChatData(chatText: 'Coming!', time: '11:24 am'),
      ],
    ),
    ChatModel(
      name: 'Saiful Bukhari',
      avatarImage: 'assets/avatars/avatar3.png',
      isMe: true,
      listChatData: [
        ChatData(chatText: 'Sure', time: '11:45 am'),
        ChatData(chatText: 'Okay ...', time: '12:20 pm'),
      ],
    ),
    ChatModel(
      name: 'Chee Lin',
      avatarImage: 'assets/avatars/avatar2.png',
      listChatData: [
        ChatData(chatText: 'Patience!', time: '12:20 pm'),
      ],
    ),
  ];
}

class ChatModel {
  final String avatarImage;
  final String name;
  final List<ChatData> listChatData;
  final bool isMe;

  ChatModel({
    required this.name,
    required this.avatarImage,
    required this.listChatData,
    this.isMe = false,
  });
}

class ChatData {
  final String chatText;
  final String time;

  ChatData({required this.chatText, required this.time});
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
