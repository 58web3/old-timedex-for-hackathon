//
// AUTO-GENERATED FILE, DO NOT MODIFY!
//
// @dart=2.12

// ignore_for_file: unused_element, unused_import
// ignore_for_file: always_put_required_named_parameters_first
// ignore_for_file: constant_identifier_names
// ignore_for_file: lines_longer_than_80_chars

part of openapi.api;


class CalendarApi {
  CalendarApi([ApiClient? apiClient]) : apiClient = apiClient ?? defaultApiClient;

  final ApiClient apiClient;

  /// A a new calendar booking
  ///
  /// Note: This method returns the HTTP [Response].
  ///
  /// Parameters:
  ///
  /// * [String] authorization (required):
  ///   JWT
  ///
  /// * [String] calendarId (required):
  ///   Calendar ID
  ///
  /// * [Booking] booking:
  Future<Response> addBookingWithHttpInfo(String authorization, String calendarId, { Booking? booking, }) async {
    // ignore: prefer_const_declarations
    final path = r'/v1/calendar/{calendar_id}/booking'
      .replaceAll('{calendar_id}', calendarId);

    // ignore: prefer_final_locals
    Object? postBody = booking;

    final queryParams = <QueryParam>[];
    final headerParams = <String, String>{};
    final formParams = <String, String>{};

    headerParams[r'Authorization'] = parameterToString(authorization);

    const contentTypes = <String>['application/json'];


    return apiClient.invokeAPI(
      path,
      'POST',
      queryParams,
      postBody,
      headerParams,
      formParams,
      contentTypes.isEmpty ? null : contentTypes.first,
    );
  }

  /// A a new calendar booking
  ///
  /// Parameters:
  ///
  /// * [String] authorization (required):
  ///   JWT
  ///
  /// * [String] calendarId (required):
  ///   Calendar ID
  ///
  /// * [Booking] booking:
  Future<CommonResponse?> addBooking(String authorization, String calendarId, { Booking? booking, }) async {
    final response = await addBookingWithHttpInfo(authorization, calendarId,  booking: booking, );
    if (response.statusCode >= HttpStatus.badRequest) {
      throw ApiException(response.statusCode, await _decodeBodyBytes(response));
    }
    // When a remote server returns no body with a status of 204, we shall not decode it.
    // At the time of writing this, `dart:convert` will throw an "Unexpected end of input"
    // FormatException when trying to decode an empty string.
    if (response.body.isNotEmpty && response.statusCode != HttpStatus.noContent) {
      return await apiClient.deserializeAsync(await _decodeBodyBytes(response), 'CommonResponse',) as CommonResponse;
    
    }
    return null;
  }

  /// A a multi booking from other calendar
  ///
  /// Note: This method returns the HTTP [Response].
  ///
  /// Parameters:
  ///
  /// * [String] authorization (required):
  ///   JWT
  ///
  /// * [Calendar] calendar:
  Future<Response> addBookingFromOtherCalendarWithHttpInfo(String authorization, { Calendar? calendar, }) async {
    // ignore: prefer_const_declarations
    final path = r'/v1/calendar';

    // ignore: prefer_final_locals
    Object? postBody = calendar;

    final queryParams = <QueryParam>[];
    final headerParams = <String, String>{};
    final formParams = <String, String>{};

    headerParams[r'Authorization'] = parameterToString(authorization);

    const contentTypes = <String>['application/json'];


    return apiClient.invokeAPI(
      path,
      'POST',
      queryParams,
      postBody,
      headerParams,
      formParams,
      contentTypes.isEmpty ? null : contentTypes.first,
    );
  }

  /// A a multi booking from other calendar
  ///
  /// Parameters:
  ///
  /// * [String] authorization (required):
  ///   JWT
  ///
  /// * [Calendar] calendar:
  Future<CommonResponse?> addBookingFromOtherCalendar(String authorization, { Calendar? calendar, }) async {
    final response = await addBookingFromOtherCalendarWithHttpInfo(authorization,  calendar: calendar, );
    if (response.statusCode >= HttpStatus.badRequest) {
      throw ApiException(response.statusCode, await _decodeBodyBytes(response));
    }
    // When a remote server returns no body with a status of 204, we shall not decode it.
    // At the time of writing this, `dart:convert` will throw an "Unexpected end of input"
    // FormatException when trying to decode an empty string.
    if (response.body.isNotEmpty && response.statusCode != HttpStatus.noContent) {
      return await apiClient.deserializeAsync(await _decodeBodyBytes(response), 'CommonResponse',) as CommonResponse;
    
    }
    return null;
  }

  /// A a new calendar booking
  ///
  /// Note: This method returns the HTTP [Response].
  ///
  /// Parameters:
  ///
  /// * [String] authorization (required):
  ///   JWT
  ///
  /// * [String] calendarId (required):
  ///   Calendar ID
  ///
  /// * [String] bookingId (required):
  ///   Booking ID
  Future<Response> deleteBookingWithHttpInfo(String authorization, String calendarId, String bookingId,) async {
    // ignore: prefer_const_declarations
    final path = r'/v1/calendar/{calendar_id}/booking/{booking_id}'
      .replaceAll('{calendar_id}', calendarId)
      .replaceAll('{booking_id}', bookingId);

    // ignore: prefer_final_locals
    Object? postBody;

    final queryParams = <QueryParam>[];
    final headerParams = <String, String>{};
    final formParams = <String, String>{};

    headerParams[r'Authorization'] = parameterToString(authorization);

    const contentTypes = <String>[];


    return apiClient.invokeAPI(
      path,
      'DELETE',
      queryParams,
      postBody,
      headerParams,
      formParams,
      contentTypes.isEmpty ? null : contentTypes.first,
    );
  }

  /// A a new calendar booking
  ///
  /// Parameters:
  ///
  /// * [String] authorization (required):
  ///   JWT
  ///
  /// * [String] calendarId (required):
  ///   Calendar ID
  ///
  /// * [String] bookingId (required):
  ///   Booking ID
  Future<CommonResponse?> deleteBooking(String authorization, String calendarId, String bookingId,) async {
    final response = await deleteBookingWithHttpInfo(authorization, calendarId, bookingId,);
    if (response.statusCode >= HttpStatus.badRequest) {
      throw ApiException(response.statusCode, await _decodeBodyBytes(response));
    }
    // When a remote server returns no body with a status of 204, we shall not decode it.
    // At the time of writing this, `dart:convert` will throw an "Unexpected end of input"
    // FormatException when trying to decode an empty string.
    if (response.body.isNotEmpty && response.statusCode != HttpStatus.noContent) {
      return await apiClient.deserializeAsync(await _decodeBodyBytes(response), 'CommonResponse',) as CommonResponse;
    
    }
    return null;
  }

  /// Get all or only relevant
  ///
  /// Note: This method returns the HTTP [Response].
  ///
  /// Parameters:
  ///
  /// * [String] authorization (required):
  ///   JWT
  ///
  /// * [String] walletAddress (required):
  ///   Wallet address
  ///
  /// * [String] teamId:
  ///   Team ID
  ///
  /// * [num] count:
  ///   Limit
  ///
  /// * [num] page:
  ///   Page number
  Future<Response> getCalendarsWithHttpInfo(String authorization, String walletAddress, { String? teamId, num? count, num? page, }) async {
    // ignore: prefer_const_declarations
    final path = r'/v1/calendar';

    // ignore: prefer_final_locals
    Object? postBody;

    final queryParams = <QueryParam>[];
    final headerParams = <String, String>{};
    final formParams = <String, String>{};

    if (teamId != null) {
      queryParams.addAll(_queryParams('', 'team_id', teamId));
    }
      queryParams.addAll(_queryParams('', 'wallet_address', walletAddress));
    if (count != null) {
      queryParams.addAll(_queryParams('', 'count', count));
    }
    if (page != null) {
      queryParams.addAll(_queryParams('', 'page', page));
    }

    headerParams[r'Authorization'] = parameterToString(authorization);

    const contentTypes = <String>[];


    return apiClient.invokeAPI(
      path,
      'GET',
      queryParams,
      postBody,
      headerParams,
      formParams,
      contentTypes.isEmpty ? null : contentTypes.first,
    );
  }

  /// Get all or only relevant
  ///
  /// Parameters:
  ///
  /// * [String] authorization (required):
  ///   JWT
  ///
  /// * [String] walletAddress (required):
  ///   Wallet address
  ///
  /// * [String] teamId:
  ///   Team ID
  ///
  /// * [num] count:
  ///   Limit
  ///
  /// * [num] page:
  ///   Page number
  Future<List<CalendarDetail>?> getCalendars(String authorization, String walletAddress, { String? teamId, num? count, num? page, }) async {
    final response = await getCalendarsWithHttpInfo(authorization, walletAddress,  teamId: teamId, count: count, page: page, );
    if (response.statusCode >= HttpStatus.badRequest) {
      throw ApiException(response.statusCode, await _decodeBodyBytes(response));
    }
    // When a remote server returns no body with a status of 204, we shall not decode it.
    // At the time of writing this, `dart:convert` will throw an "Unexpected end of input"
    // FormatException when trying to decode an empty string.
    if (response.body.isNotEmpty && response.statusCode != HttpStatus.noContent) {
      final responseBody = await _decodeBodyBytes(response);
      return (await apiClient.deserializeAsync(responseBody, 'List<CalendarDetail>') as List)
        .cast<CalendarDetail>()
        .toList();

    }
    return null;
  }

  /// Publish calendar to Teams
  ///
  /// Note: This method returns the HTTP [Response].
  ///
  /// Parameters:
  ///
  /// * [String] authorization (required):
  ///   JWT
  ///
  /// * [String] calendarId (required):
  ///   Calendar ID
  ///
  /// * [PublishRequest] publishRequest:
  Future<Response> publishCalendarWithHttpInfo(String authorization, String calendarId, { PublishRequest? publishRequest, }) async {
    // ignore: prefer_const_declarations
    final path = r'/v1/calendar/{calendar_id}/publish'
      .replaceAll('{calendar_id}', calendarId);

    // ignore: prefer_final_locals
    Object? postBody = publishRequest;

    final queryParams = <QueryParam>[];
    final headerParams = <String, String>{};
    final formParams = <String, String>{};

    headerParams[r'Authorization'] = parameterToString(authorization);

    const contentTypes = <String>['application/json'];


    return apiClient.invokeAPI(
      path,
      'POST',
      queryParams,
      postBody,
      headerParams,
      formParams,
      contentTypes.isEmpty ? null : contentTypes.first,
    );
  }

  /// Publish calendar to Teams
  ///
  /// Parameters:
  ///
  /// * [String] authorization (required):
  ///   JWT
  ///
  /// * [String] calendarId (required):
  ///   Calendar ID
  ///
  /// * [PublishRequest] publishRequest:
  Future<PublishResponse?> publishCalendar(String authorization, String calendarId, { PublishRequest? publishRequest, }) async {
    final response = await publishCalendarWithHttpInfo(authorization, calendarId,  publishRequest: publishRequest, );
    if (response.statusCode >= HttpStatus.badRequest) {
      throw ApiException(response.statusCode, await _decodeBodyBytes(response));
    }
    // When a remote server returns no body with a status of 204, we shall not decode it.
    // At the time of writing this, `dart:convert` will throw an "Unexpected end of input"
    // FormatException when trying to decode an empty string.
    if (response.body.isNotEmpty && response.statusCode != HttpStatus.noContent) {
      return await apiClient.deserializeAsync(await _decodeBodyBytes(response), 'PublishResponse',) as PublishResponse;
    
    }
    return null;
  }

  /// A a new calendar booking
  ///
  /// Note: This method returns the HTTP [Response].
  ///
  /// Parameters:
  ///
  /// * [String] authorization (required):
  ///   JWT
  ///
  /// * [String] calendarId (required):
  ///   Calendar ID
  ///
  /// * [String] bookingId (required):
  ///   Booking ID
  ///
  /// * [Booking] booking:
  Future<Response> updateBookingWithHttpInfo(String authorization, String calendarId, String bookingId, { Booking? booking, }) async {
    // ignore: prefer_const_declarations
    final path = r'/v1/calendar/{calendar_id}/booking/{booking_id}'
      .replaceAll('{calendar_id}', calendarId)
      .replaceAll('{booking_id}', bookingId);

    // ignore: prefer_final_locals
    Object? postBody = booking;

    final queryParams = <QueryParam>[];
    final headerParams = <String, String>{};
    final formParams = <String, String>{};

    headerParams[r'Authorization'] = parameterToString(authorization);

    const contentTypes = <String>['application/json'];


    return apiClient.invokeAPI(
      path,
      'PUT',
      queryParams,
      postBody,
      headerParams,
      formParams,
      contentTypes.isEmpty ? null : contentTypes.first,
    );
  }

  /// A a new calendar booking
  ///
  /// Parameters:
  ///
  /// * [String] authorization (required):
  ///   JWT
  ///
  /// * [String] calendarId (required):
  ///   Calendar ID
  ///
  /// * [String] bookingId (required):
  ///   Booking ID
  ///
  /// * [Booking] booking:
  Future<CommonResponse?> updateBooking(String authorization, String calendarId, String bookingId, { Booking? booking, }) async {
    final response = await updateBookingWithHttpInfo(authorization, calendarId, bookingId,  booking: booking, );
    if (response.statusCode >= HttpStatus.badRequest) {
      throw ApiException(response.statusCode, await _decodeBodyBytes(response));
    }
    // When a remote server returns no body with a status of 204, we shall not decode it.
    // At the time of writing this, `dart:convert` will throw an "Unexpected end of input"
    // FormatException when trying to decode an empty string.
    if (response.body.isNotEmpty && response.statusCode != HttpStatus.noContent) {
      return await apiClient.deserializeAsync(await _decodeBodyBytes(response), 'CommonResponse',) as CommonResponse;
    
    }
    return null;
  }
}
