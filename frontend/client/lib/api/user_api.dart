//
// AUTO-GENERATED FILE, DO NOT MODIFY!
//
// @dart=2.12

// ignore_for_file: unused_element, unused_import
// ignore_for_file: always_put_required_named_parameters_first
// ignore_for_file: constant_identifier_names
// ignore_for_file: lines_longer_than_80_chars

part of openapi.api;


class UserApi {
  UserApi([ApiClient? apiClient]) : apiClient = apiClient ?? defaultApiClient;

  final ApiClient apiClient;

  /// Create new user
  ///
  /// Note: This method returns the HTTP [Response].
  ///
  /// Parameters:
  ///
  /// * [User] user:
  Future<Response> addUserWithHttpInfo({ User? user, }) async {
    // ignore: prefer_const_declarations
    final path = r'/v1/user';

    // ignore: prefer_final_locals
    Object? postBody = user;

    final queryParams = <QueryParam>[];
    final headerParams = <String, String>{};
    final formParams = <String, String>{};

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

  /// Create new user
  ///
  /// Parameters:
  ///
  /// * [User] user:
  Future<CommonResponse?> addUser({ User? user, }) async {
    final response = await addUserWithHttpInfo( user: user, );
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

  /// Get user info
  ///
  /// Note: This method returns the HTTP [Response].
  ///
  /// Parameters:
  ///
  /// * [String] authorization (required):
  ///   JWT
  ///
  /// * [String] userId (required):
  ///   User ID
  Future<Response> getUserWithHttpInfo(String authorization, String userId,) async {
    // ignore: prefer_const_declarations
    final path = r'/v1/user/{user_id}'
      .replaceAll('{user_id}', userId);

    // ignore: prefer_final_locals
    Object? postBody;

    final queryParams = <QueryParam>[];
    final headerParams = <String, String>{};
    final formParams = <String, String>{};

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

  /// Get user info
  ///
  /// Parameters:
  ///
  /// * [String] authorization (required):
  ///   JWT
  ///
  /// * [String] userId (required):
  ///   User ID
  Future<User?> getUser(String authorization, String userId,) async {
    final response = await getUserWithHttpInfo(authorization, userId,);
    if (response.statusCode >= HttpStatus.badRequest) {
      throw ApiException(response.statusCode, await _decodeBodyBytes(response));
    }
    // When a remote server returns no body with a status of 204, we shall not decode it.
    // At the time of writing this, `dart:convert` will throw an "Unexpected end of input"
    // FormatException when trying to decode an empty string.
    if (response.body.isNotEmpty && response.statusCode != HttpStatus.noContent) {
      return await apiClient.deserializeAsync(await _decodeBodyBytes(response), 'User',) as User;
    
    }
    return null;
  }

  /// Update delegator
  ///
  /// Note: This method returns the HTTP [Response].
  ///
  /// Parameters:
  ///
  /// * [String] authorization (required):
  ///   JWT
  ///
  /// * [String] userId (required):
  ///   User ID
  ///
  /// * [User] user:
  Future<Response> updateDelegatorWithHttpInfo(String authorization, String userId, { User? user, }) async {
    // ignore: prefer_const_declarations
    final path = r'/v1/user/{user_id}/delegator'
      .replaceAll('{user_id}', userId);

    // ignore: prefer_final_locals
    Object? postBody = user;

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

  /// Update delegator
  ///
  /// Parameters:
  ///
  /// * [String] authorization (required):
  ///   JWT
  ///
  /// * [String] userId (required):
  ///   User ID
  ///
  /// * [User] user:
  Future<CommonResponse?> updateDelegator(String authorization, String userId, { User? user, }) async {
    final response = await updateDelegatorWithHttpInfo(authorization, userId,  user: user, );
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

  /// Update new user
  ///
  /// Note: This method returns the HTTP [Response].
  ///
  /// Parameters:
  ///
  /// * [String] authorization (required):
  ///   JWT
  ///
  /// * [String] userId (required):
  ///   User ID
  ///
  /// * [User] user:
  Future<Response> updateUserWithHttpInfo(String authorization, String userId, { User? user, }) async {
    // ignore: prefer_const_declarations
    final path = r'/v1/user/{user_id}'
      .replaceAll('{user_id}', userId);

    // ignore: prefer_final_locals
    Object? postBody = user;

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

  /// Update new user
  ///
  /// Parameters:
  ///
  /// * [String] authorization (required):
  ///   JWT
  ///
  /// * [String] userId (required):
  ///   User ID
  ///
  /// * [User] user:
  Future<CommonResponse?> updateUser(String authorization, String userId, { User? user, }) async {
    final response = await updateUserWithHttpInfo(authorization, userId,  user: user, );
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
