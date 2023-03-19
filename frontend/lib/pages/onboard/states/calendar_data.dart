import 'package:freezed_annotation/freezed_annotation.dart';
part 'generated/calendar_data.freezed.dart';

@freezed
class CalendarData with _$CalendarData {
  const factory CalendarData({
    @Default([]) List<GoogleCalendarData> google,
    @Default([]) List<ICalendarData> icalendar,
    @Default([]) List<String> outlook,
  }) = _CalendarData;

  const CalendarData._();

  bool get hasAtLeastOne =>
      !(google.isEmpty && icalendar.isEmpty && outlook.isEmpty);
}

@freezed
class GoogleCalendarData with _$GoogleCalendarData {
  const factory GoogleCalendarData({
    @Default('') String email,
    @Default('') String token,
  }) = _GoogleCalendarData;
}

@freezed
class ICalendarData with _$ICalendarData {
  const factory ICalendarData({
    @Default('') String id,
    @Default('') String name,
    @Default('') String file,
  }) = _ICalendarData;
}
