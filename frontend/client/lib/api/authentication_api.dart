//
// AUTO-GENERATED FILE, DO NOT MODIFY!
//
// @dart=2.12

// ignore_for_file: unused_element, unused_import
// ignore_for_file: always_put_required_named_parameters_first
// ignore_for_file: constant_identifier_names
// ignore_for_file: lines_longer_than_80_chars

part of openapi.api;


class AuthenticationApi {
  AuthenticationApi([ApiClient? apiClient]) : apiClient = apiClient ?? defaultApiClient;

  final ApiClient apiClient;

  /// Generate nonce
  ///
  /// Note: This method returns the HTTP [Response].
  ///
  /// Parameters:
  ///
  /// * [AuthNonceRequest] authNonceRequest:
  Future<Response> generateNonceWithHttpInfo({ AuthNonceRequest? authNonceRequest, }) async {
    // ignore: prefer_const_declarations
    final path = r'/v1/auth/generate-nonce';

    // ignore: prefer_final_locals
    Object? postBody = authNonceRequest;

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

  /// Generate nonce
  ///
  /// Parameters:
  ///
  /// * [AuthNonceRequest] authNonceRequest:
  Future<AuthNonceResponse?> generateNonce({ AuthNonceRequest? authNonceRequest, }) async {
    final response = await generateNonceWithHttpInfo( authNonceRequest: authNonceRequest, );
    if (response.statusCode >= HttpStatus.badRequest) {
      throw ApiException(response.statusCode, await _decodeBodyBytes(response));
    }
    // When a remote server returns no body with a status of 204, we shall not decode it.
    // At the time of writing this, `dart:convert` will throw an "Unexpected end of input"
    // FormatException when trying to decode an empty string.
    if (response.body.isNotEmpty && response.statusCode != HttpStatus.noContent) {
      return await apiClient.deserializeAsync(await _decodeBodyBytes(response), 'AuthNonceResponse',) as AuthNonceResponse;
    
    }
    return null;
  }

  /// Verify signature and return JWT
  ///
  /// Note: This method returns the HTTP [Response].
  ///
  /// Parameters:
  ///
  /// * [VerifyRequest] verifyRequest:
  Future<Response> verifySignatureWithHttpInfo({ VerifyRequest? verifyRequest, }) async {
    // ignore: prefer_const_declarations
    final path = r'/v1/auth/login';

    // ignore: prefer_final_locals
    Object? postBody = verifyRequest;

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

  /// Verify signature and return JWT
  ///
  /// Parameters:
  ///
  /// * [VerifyRequest] verifyRequest:
  Future<VerifyResponse?> verifySignature({ VerifyRequest? verifyRequest, }) async {
    final response = await verifySignatureWithHttpInfo( verifyRequest: verifyRequest, );
    if (response.statusCode >= HttpStatus.badRequest) {
      throw ApiException(response.statusCode, await _decodeBodyBytes(response));
    }
    // When a remote server returns no body with a status of 204, we shall not decode it.
    // At the time of writing this, `dart:convert` will throw an "Unexpected end of input"
    // FormatException when trying to decode an empty string.
    if (response.body.isNotEmpty && response.statusCode != HttpStatus.noContent) {
      return await apiClient.deserializeAsync(await _decodeBodyBytes(response), 'VerifyResponse',) as VerifyResponse;
    
    }
    return null;
  }
}
