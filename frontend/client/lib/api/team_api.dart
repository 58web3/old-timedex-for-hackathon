//
// AUTO-GENERATED FILE, DO NOT MODIFY!
//
// @dart=2.12

// ignore_for_file: unused_element, unused_import
// ignore_for_file: always_put_required_named_parameters_first
// ignore_for_file: constant_identifier_names
// ignore_for_file: lines_longer_than_80_chars

part of openapi.api;


class TeamApi {
  TeamApi([ApiClient? apiClient]) : apiClient = apiClient ?? defaultApiClient;

  final ApiClient apiClient;

  /// Create new team
  ///
  /// Note: This method returns the HTTP [Response].
  ///
  /// Parameters:
  ///
  /// * [String] authorization (required):
  ///   JWT
  ///
  /// * [Team] team:
  Future<Response> addTeamWithHttpInfo(String authorization, { Team? team, }) async {
    // ignore: prefer_const_declarations
    final path = r'/v1/team';

    // ignore: prefer_final_locals
    Object? postBody = team;

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

  /// Create new team
  ///
  /// Parameters:
  ///
  /// * [String] authorization (required):
  ///   JWT
  ///
  /// * [Team] team:
  Future<CreateTeamResponse?> addTeam(String authorization, { Team? team, }) async {
    final response = await addTeamWithHttpInfo(authorization,  team: team, );
    if (response.statusCode >= HttpStatus.badRequest) {
      throw ApiException(response.statusCode, await _decodeBodyBytes(response));
    }
    // When a remote server returns no body with a status of 204, we shall not decode it.
    // At the time of writing this, `dart:convert` will throw an "Unexpected end of input"
    // FormatException when trying to decode an empty string.
    if (response.body.isNotEmpty && response.statusCode != HttpStatus.noContent) {
      return await apiClient.deserializeAsync(await _decodeBodyBytes(response), 'CreateTeamResponse',) as CreateTeamResponse;
    
    }
    return null;
  }

  /// Get team by team ID
  ///
  /// Note: This method returns the HTTP [Response].
  ///
  /// Parameters:
  ///
  /// * [String] authorization (required):
  ///   JWT
  ///
  /// * [String] teamId (required):
  ///   Team ID
  Future<Response> getTeamByTeamIdWithHttpInfo(String authorization, String teamId,) async {
    // ignore: prefer_const_declarations
    final path = r'/v1/team/{team_id}'
      .replaceAll('{team_id}', teamId);

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

  /// Get team by team ID
  ///
  /// Parameters:
  ///
  /// * [String] authorization (required):
  ///   JWT
  ///
  /// * [String] teamId (required):
  ///   Team ID
  Future<TeamDetail?> getTeamByTeamId(String authorization, String teamId,) async {
    final response = await getTeamByTeamIdWithHttpInfo(authorization, teamId,);
    if (response.statusCode >= HttpStatus.badRequest) {
      throw ApiException(response.statusCode, await _decodeBodyBytes(response));
    }
    // When a remote server returns no body with a status of 204, we shall not decode it.
    // At the time of writing this, `dart:convert` will throw an "Unexpected end of input"
    // FormatException when trying to decode an empty string.
    if (response.body.isNotEmpty && response.statusCode != HttpStatus.noContent) {
      return await apiClient.deserializeAsync(await _decodeBodyBytes(response), 'TeamDetail',) as TeamDetail;
    
    }
    return null;
  }

  /// Get user teams
  ///
  /// Note: This method returns the HTTP [Response].
  ///
  /// Parameters:
  ///
  /// * [String] authorization (required):
  ///   JWT
  Future<Response> getUserTeamsWithHttpInfo(String authorization,) async {
    // ignore: prefer_const_declarations
    final path = r'/v1/team';

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

  /// Get user teams
  ///
  /// Parameters:
  ///
  /// * [String] authorization (required):
  ///   JWT
  Future<UserTeamsResponse?> getUserTeams(String authorization,) async {
    final response = await getUserTeamsWithHttpInfo(authorization,);
    if (response.statusCode >= HttpStatus.badRequest) {
      throw ApiException(response.statusCode, await _decodeBodyBytes(response));
    }
    // When a remote server returns no body with a status of 204, we shall not decode it.
    // At the time of writing this, `dart:convert` will throw an "Unexpected end of input"
    // FormatException when trying to decode an empty string.
    if (response.body.isNotEmpty && response.statusCode != HttpStatus.noContent) {
      return await apiClient.deserializeAsync(await _decodeBodyBytes(response), 'UserTeamsResponse',) as UserTeamsResponse;
    
    }
    return null;
  }

  /// Update team
  ///
  /// Note: This method returns the HTTP [Response].
  ///
  /// Parameters:
  ///
  /// * [String] authorization (required):
  ///   JWT
  ///
  /// * [String] teamId (required):
  ///   Team ID
  ///
  /// * [Team] team:
  Future<Response> updateTeamWithHttpInfo(String authorization, String teamId, { Team? team, }) async {
    // ignore: prefer_const_declarations
    final path = r'/v1/team/{team_id}'
      .replaceAll('{team_id}', teamId);

    // ignore: prefer_final_locals
    Object? postBody = team;

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

  /// Update team
  ///
  /// Parameters:
  ///
  /// * [String] authorization (required):
  ///   JWT
  ///
  /// * [String] teamId (required):
  ///   Team ID
  ///
  /// * [Team] team:
  Future<CommonResponse?> updateTeam(String authorization, String teamId, { Team? team, }) async {
    final response = await updateTeamWithHttpInfo(authorization, teamId,  team: team, );
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
