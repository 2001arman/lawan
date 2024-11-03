enum SessionType {
  friendly,
  ranked;

  String get title {
    switch (this) {
      case SessionType.friendly:
        return 'Friendly';
      case SessionType.ranked:
        return 'Ranked';
      default:
        return '';
    }
  }
}
