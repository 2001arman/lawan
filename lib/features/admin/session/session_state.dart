class SessionState {
  var listSession = [
    SessionDate(
      date: '23 Sep',
      dayName: 'Sun, Today',
      totalData: 0,
    ),
    SessionDate(
      date: '24 Sep',
      dayName: 'Mon, Tomorrow',
      totalData: 2,
    ),
    SessionDate(
      date: '25 Sep',
      dayName: 'Tue',
      totalData: 1,
    ),
    SessionDate(
      date: '26 Sep',
      dayName: 'Wed',
      totalData: 2,
    ),
    SessionDate(
      date: '27 Sep',
      dayName: 'Thu',
      totalData: 2,
    ),
  ];
}

class SessionDate {
  final String date;
  final String dayName;
  final int totalData;

  SessionDate(
      {required this.date, required this.dayName, required this.totalData});
}
