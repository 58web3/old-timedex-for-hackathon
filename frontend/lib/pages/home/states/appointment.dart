import 'package:flutter/material.dart';
import 'package:syncfusion_flutter_calendar/calendar.dart';
import 'package:time_dex/global/models.dart';


class EventDataSource extends CalendarDataSource {
  EventDataSource(List<CalendarEvent> source) {
    appointments = source;
  }

  @override
  DateTime getStartTime(int index) {
    return (appointments as List<CalendarEvent>?)![index].detail.start!;
  }

  @override
  DateTime getEndTime(int index) {
    return (appointments as List<CalendarEvent>?)![index].detail.end!;
  }

  @override
  String getSubject(int index) {
    return (appointments as List<CalendarEvent>?)![index].detail.title;
  }

  @override
  Color getColor(int index) {
    final color = (appointments as List<CalendarEvent>?)![index].background;
    final detail = (appointments as List<CalendarEvent>?)![index].detail;
    final baseCoef = 1 - detail.priority.opacity;
    final faceCoef = detail.priority.opacity;
    final base = detail.priority.baseColor;

    final cr = (color.red * faceCoef + base * baseCoef).round();
    final cg = (color.green * faceCoef + base * baseCoef).round();
    final cb = (color.blue * faceCoef + base * baseCoef).round();
    return Color.fromARGB(255, cr, cg, cb);
  }

  @override
  bool isAllDay(int index) {
    return false;
  }
}
