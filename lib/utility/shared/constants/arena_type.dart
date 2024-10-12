enum ArenaType {
  arena,
  court;

  String get title {
    switch (this) {
      case ArenaType.arena:
        return 'Arena';
      case ArenaType.court:
        return 'Court';
      default:
        return '';
    }
  }
}
