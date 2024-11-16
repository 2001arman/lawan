import 'package:get/get.dart';

class NotificationState {
  RxString selectedType = 'All'.obs;
  final List<String> listType = [
    'All',
    'Friend',
    'Session',
    'Referee',
    'Achievement',
  ];
}

enum NotificationType {
  requestFollow,
  following,
  inviteSession;

  String get decline {
    switch (this) {
      case NotificationType.requestFollow:
        return 'Decline';
      case NotificationType.following:
        return 'Ignore';
      default:
        return 'Decline';
    }
  }

  String get accept {
    switch (this) {
      case NotificationType.requestFollow:
        return 'Accept';
      case NotificationType.following:
        return 'Follow';
      default:
        return 'View';
    }
  }

  String get subTitle {
    switch (this) {
      case NotificationType.requestFollow:
        return ' request to follow.';
      case NotificationType.following:
        return ' started following you.';
      default:
        return ' invited you to session.';
    }
  }
}
