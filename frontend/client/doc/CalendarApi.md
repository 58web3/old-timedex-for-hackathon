# openapi.api.CalendarApi

## Load the API package
```dart
import 'package:openapi/api.dart';
```

All URIs are relative to *http://localhost:50001*

Method | HTTP request | Description
------------- | ------------- | -------------
[**addBooking**](CalendarApi.md#addbooking) | **POST** /v1/calendar/{calendar_id}/booking | A a new calendar booking
[**addBookingFromOtherCalendar**](CalendarApi.md#addbookingfromothercalendar) | **POST** /v1/calendar | A a multi booking from other calendar
[**deleteBooking**](CalendarApi.md#deletebooking) | **DELETE** /v1/calendar/{calendar_id}/booking/{booking_id} | A a new calendar booking
[**getCalendars**](CalendarApi.md#getcalendars) | **GET** /v1/calendar | Get all or only relevant
[**publishCalendar**](CalendarApi.md#publishcalendar) | **POST** /v1/calendar/{calendar_id}/publish | Publish calendar to Teams
[**updateBooking**](CalendarApi.md#updatebooking) | **PUT** /v1/calendar/{calendar_id}/booking/{booking_id} | A a new calendar booking


# **addBooking**
> CommonResponse addBooking(authorization, calendarId, booking)

A a new calendar booking

### Example
```dart
import 'package:openapi/api.dart';
// TODO Configure HTTP Bearer authorization: Bearer
// Case 1. Use String Token
//defaultApiClient.getAuthentication<HttpBearerAuth>('Bearer').setAccessToken('YOUR_ACCESS_TOKEN');
// Case 2. Use Function which generate token.
// String yourTokenGeneratorFunction() { ... }
//defaultApiClient.getAuthentication<HttpBearerAuth>('Bearer').setAccessToken(yourTokenGeneratorFunction);

final api_instance = CalendarApi();
final authorization = Bearer xxx; // String | JWT
final calendarId = 9590ebf5-e378-4074-97d0-3ce5004ae928; // String | Calendar ID
final booking = Booking(); // Booking | 

try {
    final result = api_instance.addBooking(authorization, calendarId, booking);
    print(result);
} catch (e) {
    print('Exception when calling CalendarApi->addBooking: $e\n');
}
```

### Parameters

Name | Type | Description  | Notes
------------- | ------------- | ------------- | -------------
 **authorization** | **String**| JWT | 
 **calendarId** | **String**| Calendar ID | 
 **booking** | [**Booking**](Booking.md)|  | [optional] 

### Return type

[**CommonResponse**](CommonResponse.md)

### Authorization

[Bearer](../README.md#Bearer)

### HTTP request headers

 - **Content-Type**: application/json
 - **Accept**: application/json

[[Back to top]](#) [[Back to API list]](../README.md#documentation-for-api-endpoints) [[Back to Model list]](../README.md#documentation-for-models) [[Back to README]](../README.md)

# **addBookingFromOtherCalendar**
> CommonResponse addBookingFromOtherCalendar(authorization, calendar)

A a multi booking from other calendar

### Example
```dart
import 'package:openapi/api.dart';
// TODO Configure HTTP Bearer authorization: Bearer
// Case 1. Use String Token
//defaultApiClient.getAuthentication<HttpBearerAuth>('Bearer').setAccessToken('YOUR_ACCESS_TOKEN');
// Case 2. Use Function which generate token.
// String yourTokenGeneratorFunction() { ... }
//defaultApiClient.getAuthentication<HttpBearerAuth>('Bearer').setAccessToken(yourTokenGeneratorFunction);

final api_instance = CalendarApi();
final authorization = Bearer xxx; // String | JWT
final calendar = Calendar(); // Calendar | 

try {
    final result = api_instance.addBookingFromOtherCalendar(authorization, calendar);
    print(result);
} catch (e) {
    print('Exception when calling CalendarApi->addBookingFromOtherCalendar: $e\n');
}
```

### Parameters

Name | Type | Description  | Notes
------------- | ------------- | ------------- | -------------
 **authorization** | **String**| JWT | 
 **calendar** | [**Calendar**](Calendar.md)|  | [optional] 

### Return type

[**CommonResponse**](CommonResponse.md)

### Authorization

[Bearer](../README.md#Bearer)

### HTTP request headers

 - **Content-Type**: application/json
 - **Accept**: application/json

[[Back to top]](#) [[Back to API list]](../README.md#documentation-for-api-endpoints) [[Back to Model list]](../README.md#documentation-for-models) [[Back to README]](../README.md)

# **deleteBooking**
> CommonResponse deleteBooking(authorization, calendarId, bookingId)

A a new calendar booking

### Example
```dart
import 'package:openapi/api.dart';
// TODO Configure HTTP Bearer authorization: Bearer
// Case 1. Use String Token
//defaultApiClient.getAuthentication<HttpBearerAuth>('Bearer').setAccessToken('YOUR_ACCESS_TOKEN');
// Case 2. Use Function which generate token.
// String yourTokenGeneratorFunction() { ... }
//defaultApiClient.getAuthentication<HttpBearerAuth>('Bearer').setAccessToken(yourTokenGeneratorFunction);

final api_instance = CalendarApi();
final authorization = Bearer xxx; // String | JWT
final calendarId = 9590ebf5-e378-4074-97d0-3ce5004ae928; // String | Calendar ID
final bookingId = 2023021012131412345; // String | Booking ID

try {
    final result = api_instance.deleteBooking(authorization, calendarId, bookingId);
    print(result);
} catch (e) {
    print('Exception when calling CalendarApi->deleteBooking: $e\n');
}
```

### Parameters

Name | Type | Description  | Notes
------------- | ------------- | ------------- | -------------
 **authorization** | **String**| JWT | 
 **calendarId** | **String**| Calendar ID | 
 **bookingId** | **String**| Booking ID | 

### Return type

[**CommonResponse**](CommonResponse.md)

### Authorization

[Bearer](../README.md#Bearer)

### HTTP request headers

 - **Content-Type**: Not defined
 - **Accept**: application/json

[[Back to top]](#) [[Back to API list]](../README.md#documentation-for-api-endpoints) [[Back to Model list]](../README.md#documentation-for-models) [[Back to README]](../README.md)

# **getCalendars**
> List<CalendarDetail> getCalendars(authorization, walletAddress, teamId, count, page)

Get all or only relevant

### Example
```dart
import 'package:openapi/api.dart';
// TODO Configure HTTP Bearer authorization: Bearer
// Case 1. Use String Token
//defaultApiClient.getAuthentication<HttpBearerAuth>('Bearer').setAccessToken('YOUR_ACCESS_TOKEN');
// Case 2. Use Function which generate token.
// String yourTokenGeneratorFunction() { ... }
//defaultApiClient.getAuthentication<HttpBearerAuth>('Bearer').setAccessToken(yourTokenGeneratorFunction);

final api_instance = CalendarApi();
final authorization = Bearer xxx; // String | JWT
final walletAddress = 0x60f80121c31a0d46b5279700f9df786054aa5ee6; // String | Wallet address
final teamId = 9490ebf5-e378-4074-97d0-3ce5004ae918; // String | Team ID
final count = 10; // num | Limit
final page = 0; // num | Page number

try {
    final result = api_instance.getCalendars(authorization, walletAddress, teamId, count, page);
    print(result);
} catch (e) {
    print('Exception when calling CalendarApi->getCalendars: $e\n');
}
```

### Parameters

Name | Type | Description  | Notes
------------- | ------------- | ------------- | -------------
 **authorization** | **String**| JWT | 
 **walletAddress** | **String**| Wallet address | 
 **teamId** | **String**| Team ID | [optional] 
 **count** | **num**| Limit | [optional] 
 **page** | **num**| Page number | [optional] 

### Return type

[**List<CalendarDetail>**](CalendarDetail.md)

### Authorization

[Bearer](../README.md#Bearer)

### HTTP request headers

 - **Content-Type**: Not defined
 - **Accept**: application/json

[[Back to top]](#) [[Back to API list]](../README.md#documentation-for-api-endpoints) [[Back to Model list]](../README.md#documentation-for-models) [[Back to README]](../README.md)

# **publishCalendar**
> PublishResponse publishCalendar(authorization, calendarId, publishRequest)

Publish calendar to Teams

### Example
```dart
import 'package:openapi/api.dart';
// TODO Configure HTTP Bearer authorization: Bearer
// Case 1. Use String Token
//defaultApiClient.getAuthentication<HttpBearerAuth>('Bearer').setAccessToken('YOUR_ACCESS_TOKEN');
// Case 2. Use Function which generate token.
// String yourTokenGeneratorFunction() { ... }
//defaultApiClient.getAuthentication<HttpBearerAuth>('Bearer').setAccessToken(yourTokenGeneratorFunction);

final api_instance = CalendarApi();
final authorization = Bearer xxx; // String | JWT
final calendarId = 9590ebf5-e378-4074-97d0-3ce5004ae928; // String | Calendar ID
final publishRequest = PublishRequest(); // PublishRequest | 

try {
    final result = api_instance.publishCalendar(authorization, calendarId, publishRequest);
    print(result);
} catch (e) {
    print('Exception when calling CalendarApi->publishCalendar: $e\n');
}
```

### Parameters

Name | Type | Description  | Notes
------------- | ------------- | ------------- | -------------
 **authorization** | **String**| JWT | 
 **calendarId** | **String**| Calendar ID | 
 **publishRequest** | [**PublishRequest**](PublishRequest.md)|  | [optional] 

### Return type

[**PublishResponse**](PublishResponse.md)

### Authorization

[Bearer](../README.md#Bearer)

### HTTP request headers

 - **Content-Type**: application/json
 - **Accept**: application/json

[[Back to top]](#) [[Back to API list]](../README.md#documentation-for-api-endpoints) [[Back to Model list]](../README.md#documentation-for-models) [[Back to README]](../README.md)

# **updateBooking**
> CommonResponse updateBooking(authorization, calendarId, bookingId, booking)

A a new calendar booking

### Example
```dart
import 'package:openapi/api.dart';
// TODO Configure HTTP Bearer authorization: Bearer
// Case 1. Use String Token
//defaultApiClient.getAuthentication<HttpBearerAuth>('Bearer').setAccessToken('YOUR_ACCESS_TOKEN');
// Case 2. Use Function which generate token.
// String yourTokenGeneratorFunction() { ... }
//defaultApiClient.getAuthentication<HttpBearerAuth>('Bearer').setAccessToken(yourTokenGeneratorFunction);

final api_instance = CalendarApi();
final authorization = Bearer xxx; // String | JWT
final calendarId = 9590ebf5-e378-4074-97d0-3ce5004ae928; // String | Calendar ID
final bookingId = 2023021012131412345; // String | Booking ID
final booking = Booking(); // Booking | 

try {
    final result = api_instance.updateBooking(authorization, calendarId, bookingId, booking);
    print(result);
} catch (e) {
    print('Exception when calling CalendarApi->updateBooking: $e\n');
}
```

### Parameters

Name | Type | Description  | Notes
------------- | ------------- | ------------- | -------------
 **authorization** | **String**| JWT | 
 **calendarId** | **String**| Calendar ID | 
 **bookingId** | **String**| Booking ID | 
 **booking** | [**Booking**](Booking.md)|  | [optional] 

### Return type

[**CommonResponse**](CommonResponse.md)

### Authorization

[Bearer](../README.md#Bearer)

### HTTP request headers

 - **Content-Type**: application/json
 - **Accept**: application/json

[[Back to top]](#) [[Back to API list]](../README.md#documentation-for-api-endpoints) [[Back to Model list]](../README.md#documentation-for-models) [[Back to README]](../README.md)

