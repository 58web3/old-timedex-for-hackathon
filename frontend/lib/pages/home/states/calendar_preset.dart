import 'package:freezed_annotation/freezed_annotation.dart';

part 'generated/calendar_preset.g.dart';
part 'generated/calendar_preset.freezed.dart';

@freezed
class CalendarPreset with _$CalendarPreset {
  const factory CalendarPreset({
    @Default(null) DateTime? first,
    @Default(null) DateTime? last,
    @Default(null) DateTime? focused,
  }) = _CalendarPreset;

  factory CalendarPreset.fromJson(Map<String, dynamic> json) =>
      _$CalendarPresetFromJson(json);
}
