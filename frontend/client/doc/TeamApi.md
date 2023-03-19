# openapi.api.TeamApi

## Load the API package
```dart
import 'package:openapi/api.dart';
```

All URIs are relative to *http://localhost:50001*

Method | HTTP request | Description
------------- | ------------- | -------------
[**addTeam**](TeamApi.md#addteam) | **POST** /v1/team | Create new team
[**getTeamByTeamId**](TeamApi.md#getteambyteamid) | **GET** /v1/team/{team_id} | Get team by team ID
[**getUserTeams**](TeamApi.md#getuserteams) | **GET** /v1/team | Get user teams
[**updateTeam**](TeamApi.md#updateteam) | **PUT** /v1/team/{team_id} | Update team


# **addTeam**
> CreateTeamResponse addTeam(authorization, team)

Create new team

### Example
```dart
import 'package:openapi/api.dart';
// TODO Configure HTTP Bearer authorization: Bearer
// Case 1. Use String Token
//defaultApiClient.getAuthentication<HttpBearerAuth>('Bearer').setAccessToken('YOUR_ACCESS_TOKEN');
// Case 2. Use Function which generate token.
// String yourTokenGeneratorFunction() { ... }
//defaultApiClient.getAuthentication<HttpBearerAuth>('Bearer').setAccessToken(yourTokenGeneratorFunction);

final api_instance = TeamApi();
final authorization = Bearer xxx; // String | JWT
final team = Team(); // Team | 

try {
    final result = api_instance.addTeam(authorization, team);
    print(result);
} catch (e) {
    print('Exception when calling TeamApi->addTeam: $e\n');
}
```

### Parameters

Name | Type | Description  | Notes
------------- | ------------- | ------------- | -------------
 **authorization** | **String**| JWT | 
 **team** | [**Team**](Team.md)|  | [optional] 

### Return type

[**CreateTeamResponse**](CreateTeamResponse.md)

### Authorization

[Bearer](../README.md#Bearer)

### HTTP request headers

 - **Content-Type**: application/json
 - **Accept**: application/json

[[Back to top]](#) [[Back to API list]](../README.md#documentation-for-api-endpoints) [[Back to Model list]](../README.md#documentation-for-models) [[Back to README]](../README.md)

# **getTeamByTeamId**
> TeamDetail getTeamByTeamId(authorization, teamId)

Get team by team ID

### Example
```dart
import 'package:openapi/api.dart';
// TODO Configure HTTP Bearer authorization: Bearer
// Case 1. Use String Token
//defaultApiClient.getAuthentication<HttpBearerAuth>('Bearer').setAccessToken('YOUR_ACCESS_TOKEN');
// Case 2. Use Function which generate token.
// String yourTokenGeneratorFunction() { ... }
//defaultApiClient.getAuthentication<HttpBearerAuth>('Bearer').setAccessToken(yourTokenGeneratorFunction);

final api_instance = TeamApi();
final authorization = Bearer xxx; // String | JWT
final teamId = 9490ebf5-e378-4074-97d0-3ce5004ae918; // String | Team ID

try {
    final result = api_instance.getTeamByTeamId(authorization, teamId);
    print(result);
} catch (e) {
    print('Exception when calling TeamApi->getTeamByTeamId: $e\n');
}
```

### Parameters

Name | Type | Description  | Notes
------------- | ------------- | ------------- | -------------
 **authorization** | **String**| JWT | 
 **teamId** | **String**| Team ID | 

### Return type

[**TeamDetail**](TeamDetail.md)

### Authorization

[Bearer](../README.md#Bearer)

### HTTP request headers

 - **Content-Type**: Not defined
 - **Accept**: application/json

[[Back to top]](#) [[Back to API list]](../README.md#documentation-for-api-endpoints) [[Back to Model list]](../README.md#documentation-for-models) [[Back to README]](../README.md)

# **getUserTeams**
> UserTeamsResponse getUserTeams(authorization)

Get user teams

### Example
```dart
import 'package:openapi/api.dart';
// TODO Configure HTTP Bearer authorization: Bearer
// Case 1. Use String Token
//defaultApiClient.getAuthentication<HttpBearerAuth>('Bearer').setAccessToken('YOUR_ACCESS_TOKEN');
// Case 2. Use Function which generate token.
// String yourTokenGeneratorFunction() { ... }
//defaultApiClient.getAuthentication<HttpBearerAuth>('Bearer').setAccessToken(yourTokenGeneratorFunction);

final api_instance = TeamApi();
final authorization = Bearer xxx; // String | JWT

try {
    final result = api_instance.getUserTeams(authorization);
    print(result);
} catch (e) {
    print('Exception when calling TeamApi->getUserTeams: $e\n');
}
```

### Parameters

Name | Type | Description  | Notes
------------- | ------------- | ------------- | -------------
 **authorization** | **String**| JWT | 

### Return type

[**UserTeamsResponse**](UserTeamsResponse.md)

### Authorization

[Bearer](../README.md#Bearer)

### HTTP request headers

 - **Content-Type**: Not defined
 - **Accept**: application/json

[[Back to top]](#) [[Back to API list]](../README.md#documentation-for-api-endpoints) [[Back to Model list]](../README.md#documentation-for-models) [[Back to README]](../README.md)

# **updateTeam**
> CommonResponse updateTeam(authorization, teamId, team)

Update team

### Example
```dart
import 'package:openapi/api.dart';
// TODO Configure HTTP Bearer authorization: Bearer
// Case 1. Use String Token
//defaultApiClient.getAuthentication<HttpBearerAuth>('Bearer').setAccessToken('YOUR_ACCESS_TOKEN');
// Case 2. Use Function which generate token.
// String yourTokenGeneratorFunction() { ... }
//defaultApiClient.getAuthentication<HttpBearerAuth>('Bearer').setAccessToken(yourTokenGeneratorFunction);

final api_instance = TeamApi();
final authorization = Bearer xxx; // String | JWT
final teamId = 9490ebf5-e378-4074-97d0-3ce5004ae918; // String | Team ID
final team = Team(); // Team | 

try {
    final result = api_instance.updateTeam(authorization, teamId, team);
    print(result);
} catch (e) {
    print('Exception when calling TeamApi->updateTeam: $e\n');
}
```

### Parameters

Name | Type | Description  | Notes
------------- | ------------- | ------------- | -------------
 **authorization** | **String**| JWT | 
 **teamId** | **String**| Team ID | 
 **team** | [**Team**](Team.md)|  | [optional] 

### Return type

[**CommonResponse**](CommonResponse.md)

### Authorization

[Bearer](../README.md#Bearer)

### HTTP request headers

 - **Content-Type**: application/json
 - **Accept**: application/json

[[Back to top]](#) [[Back to API list]](../README.md#documentation-for-api-endpoints) [[Back to Model list]](../README.md#documentation-for-models) [[Back to README]](../README.md)

