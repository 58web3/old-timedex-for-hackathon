enum CalendarMode {
  private(indexNum: 0),
  team(indexNum: 0);

  const CalendarMode({required this.indexNum});
  final int indexNum;

  bool get isTeam => this == team;
  bool get isPrivate => this == private;
}

extension CalendarModeExt on List<CalendarMode> {
  // 文字列からCalendarModeのインスタンスを作成
  CalendarMode from(int index) => firstWhere(
        (mode) => mode.indexNum == index,
        orElse: () => throw AssertionError(),
      );
}
