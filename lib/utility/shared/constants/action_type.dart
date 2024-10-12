enum ActionType {
  delete,
  booking,
  edit,
  reschedule,
  confirmReschedule,
  alertAdmin,
  badWeather,
  ;

  String get title {
    switch (this) {
      case ActionType.delete:
        return 'Confirm Delete?';
      case ActionType.edit:
        return 'Confirm Update?';
      case ActionType.booking:
        return 'Confirm Booking';
      case ActionType.reschedule:
        return 'Do you want to reschedule?';
      case ActionType.confirmReschedule:
        return 'Confirm reschedule?';
      case ActionType.alertAdmin:
        return 'Confirm Alert to Admin?';
      case ActionType.badWeather:
        return 'Report for Bad Weather?';
      default:
        return '';
    }
  }

  String get description {
    switch (this) {
      case ActionType.delete:
        return 'Proceed with applying the changes.';
      case ActionType.edit:
        return 'Proceed with applying the changes.';
      case ActionType.booking:
        return 'Are you sure you want to add this booking?';
      case ActionType.reschedule:
        return 'This will add the Admin to the chat for confirmation.';
      case ActionType.confirmReschedule:
        return 'This will add the Admin to the chat for confirmation.';
      case ActionType.alertAdmin:
        return 'This will add the Admin to the chat for confirmation.';
      case ActionType.badWeather:
        return 'This will add the Admin to the chat for confirmation.';
      default:
        return '';
    }
  }
}
