import 'package:flutter/material.dart';
import 'package:time_dex/constants/ui.dart';

enum SettingContentType {
  user(
    id: 1,
    label: 'user',
    icon: Icons.person,
    title: 'User setting',
  ),
  team(
    id: 2,
    label: 'team',
    icon: Icons.groups,
    title: 'Manage team',
  ),
  calendar(
    id: 3,
    label: 'calendar',
    icon: Icons.calendar_month,
    title: 'Import external calendars',
  ),
  delegation(
    id: 4,
    label: 'delegation',
    icon: CustomIcons.tenancy,
    title: 'Manage delegation',
  );

  const SettingContentType({
    required this.id,
    required this.label,
    required this.title,
    required this.icon,
  });
  final int id;
  final String label;
  final String title;
  final IconData icon;
}

extension SettingContentTypesExt on List<SettingContentType> {
  // 文字列からFlavorのインスタンスを作成
  SettingContentType from(String value) => firstWhere(
        (content) => content.label == value,
        orElse: () => throw AssertionError('$value is not content'),
      );

  List<SettingContentType> get sorted =>
      this..sort((a, b) => a.id.compareTo(b.id));
}
