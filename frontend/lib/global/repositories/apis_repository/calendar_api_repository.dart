import 'dart:convert';

import 'package:hooks_riverpod/hooks_riverpod.dart';
// ignore: depend_on_referenced_packages
import 'package:http/http.dart' as http;
import 'package:openapi/api.dart';
import 'package:time_dex/global/providers.dart';
import 'package:time_dex/pages/onboard/states.dart';

import 'api_client_repository.dart';

abstract class CalendarApiRepository {
  Future<void> addBooking(
    String jwt,
    String calendarId, {
    required Booking booking,
  });

  Future<void> updateBooking(
    String jwt,
    String calendarId,
    String bookingId, {
    required Booking booking,
  });

  Future<void> deleteBooking(
    String jwt,
    String calendarId,
    String bookingId,
  );

  Future<List<CalendarDetail>> getCalendars(
    String jwt,
    String walletAddress, {
    String? teamId,
    num? count,
    num? page,
  });

  Future<void> addBookingFromOtherCalendar(
    String jwt, {
    required Calendar calendar,
  });

  Future<String> publishCalendar(
    CalendarData calendars,
    List<GoogleCalendarData> googleCalendars,
  );
}

final calendarApiRepositoryProvider = Provider<CalendarApiRepository>(
  CalendarApiRepositoryImpl.new,
);

class CalendarApiRepositoryImpl extends CalendarApiRepository {
  CalendarApiRepositoryImpl(this.ref) {
    client = ref.watch(apiClientRepository);
    api = CalendarApi(client);
  }
  final Ref ref;
  late CalendarApi api;
  late ApiClient client;

  @override
  Future<void> addBooking(
    String jwt,
    String calendarId, {
    required Booking booking,
  }) async {
    late CommonResponse? response;
    try {
      response = await api.addBooking(jwt, calendarId, booking: booking);
      ref.watch(loggerProvider).i(response);
    } on Exception catch (err) {
      throw Exception(err);
    }
  }

  @override
  Future<void> updateBooking(
    String jwt,
    String calendarId,
    String bookingId, {
    required Booking booking,
  }) async {
    late CommonResponse? response;
    try {
      response = await api.updateBooking(
        jwt,
        calendarId,
        bookingId,
        booking: booking,
      );
      ref.watch(loggerProvider).i(response);
    } on Exception catch (err) {
      throw Exception(err);
    }
  }

  @override
  Future<void> deleteBooking(
    String jwt,
    String calendarId,
    String bookingId,
  ) async {
    late CommonResponse? response;
    try {
      response = await api.deleteBooking(jwt, calendarId, bookingId);
      ref.watch(loggerProvider).i(response);
    } on Exception catch (err) {
      throw Exception(err);
    }
  }

  @override
  Future<String> publishCalendar(
    CalendarData calendars,
    List<GoogleCalendarData> googleCalendars,
  ) async {
    try {
      final url = Uri.parse('${client.basePath}/v1/user');
      final headers = {
        'content-type': 'application/json',
        'Authorization': await _getJWT()
      };

      final body = json.encode({
        'google_calendars': [
          {
            'email': googleCalendars.first.email,
            'access_token': googleCalendars.first.token,
          }
        ],
        'outlook_calendars': <String>[],
        'ics_contents': calendars.icalendar
      });

      final resp = await http.post(url, headers: headers, body: body);
      if (resp.statusCode == 200) {
        final resBody = json.decode(resp.body) as Map<String, dynamic>;
        final calendarId = resBody['calendar_id'] as String;
        return calendarId;
      } else {
        throw Exception();
      }
    } on Exception catch (err) {
      throw Exception(err);
    }
  }

  @override
  Future<void> addBookingFromOtherCalendar(
    String jwt, {
    required Calendar calendar,
  }) async {
    late CommonResponse? response;
    try {
      response = await api.addBookingFromOtherCalendar(
        jwt,
        calendar: calendar,
      );
      ref.watch(loggerProvider).i(response);
    } on Exception catch (err) {
      throw Exception(err);
    }
  }

  @override
  Future<List<CalendarDetail>> getCalendars(
    String jwt,
    String walletAddress, {
    String? teamId,
    num? count,
    num? page,
  }) async {
    try {
      final response = await api.getCalendars(
        jwt,
        walletAddress,
        teamId: teamId,
        count: count,
        page: page,
      );
      return response!;
    } on Exception catch (err) {
      throw Exception(err);
    }
  }

  Future<String> _getJWT() async {
    final jwt = await ref.watch(secureStorageProvider).read(key: 'jwt');
    if (jwt == null) {
      throw Exception('Access token in not exists');
    }
    return jwt;
  }
}
