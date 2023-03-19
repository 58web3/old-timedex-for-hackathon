import 'dart:ui';

import 'package:freezed_annotation/freezed_annotation.dart';
import 'package:googleapis/calendar/v3.dart' as gapi;
import 'package:icalendar_parser/icalendar_parser.dart';
import 'package:time_dex/constants/enums.dart';

part 'generated/calendar_event_detail.freezed.dart';

@freezed
class TimedexCalendar with _$TimedexCalendar {
  const factory TimedexCalendar({
    @Default('') String id,
    @Default('') String walletAddress,
    @Default([]) List<CalendarEventDetail> events,
  }) = _TimedexCalendar;
}

@freezed
class CalendarEventDetail with _$CalendarEventDetail {
  const factory CalendarEventDetail({
    @Default('') String id,
    @Default('') String title,
    @Default(null) DateTime? start,
    @Default(null) DateTime? end,
    @Default([]) List<String> walletAddresses,
    @Default(EventFilterType.priority_2) EventFilterType priority,
    @Default('') String description,
  }) = _CalendarEventDetail;

  const CalendarEventDetail._();

  factory CalendarEventDetail.fromGoogle(gapi.Event event) {
    return CalendarEventDetail(
      title: event.summary ?? '',
      start: event.start?.dateTime,
      end: event.end?.dateTime,
      walletAddresses: [],
      priority: EventFilterType.priority_2,
      description: event.description ?? '',
    );
  }

  factory CalendarEventDetail.fromIcalendar(Map<String, dynamic> event) {
    return CalendarEventDetail(
      title: event['summary'] as String? ?? '',
      start: (event['dtstart'] as IcsDateTime).toDateTime(),
      end: (event['dtend'] as IcsDateTime).toDateTime(),
      walletAddresses: [],
      priority: EventFilterType.priority_2,
      description: event['DESCRIPTION'] as String? ?? '',
    );
  }
}

@freezed
class CalendarEvent with _$CalendarEvent {
  const factory CalendarEvent({
    @Default(CalendarEventDetail()) CalendarEventDetail detail,
    @Default(Color.fromRGBO(0, 0, 0, 0)) Color background,
  }) = _CalendarEvent;
}
