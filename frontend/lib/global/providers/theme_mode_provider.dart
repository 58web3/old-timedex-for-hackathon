import 'package:flutter/material.dart';
import 'package:hooks_riverpod/hooks_riverpod.dart';

import 'singleton_provider.dart';

// Theme情報をLocalに保存して
final themeSelectorProvider = StateNotifierProvider<ThemeSelector, ThemeMode>(
  ThemeSelector.new,
);

const _themePrefsKey = 'selectedThemeKey';

class ThemeSelector extends StateNotifier<ThemeMode> {
  ThemeSelector(this._ref) : super(ThemeMode.system) {
    final themeIndex = _prefs.getInt(_themePrefsKey);
    if (themeIndex == null) {
      return;
    }
    final themeMode = ThemeMode.values.firstWhere(
      (e) => e.index == themeIndex,
      orElse: () => ThemeMode.system,
    );
    state = themeMode;
  }

  final Ref _ref;
  late final _prefs = _ref.read(sharedPrefsProvider);

  Future<void> changeAndSave(ThemeMode theme) async {
    await _prefs.setInt(_themePrefsKey, theme.index);
    state = theme;
  }
}
