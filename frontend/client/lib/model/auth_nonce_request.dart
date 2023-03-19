//
// AUTO-GENERATED FILE, DO NOT MODIFY!
//
// @dart=2.12

// ignore_for_file: unused_element, unused_import
// ignore_for_file: always_put_required_named_parameters_first
// ignore_for_file: constant_identifier_names
// ignore_for_file: lines_longer_than_80_chars

part of openapi.api;

class AuthNonceRequest {
  /// Returns a new [AuthNonceRequest] instance.
  AuthNonceRequest({
    this.walletAddress,
  });

  ///
  /// Please note: This property should have been non-nullable! Since the specification file
  /// does not include a default value (using the "default:" property), however, the generated
  /// source code must fall back to having a nullable type.
  /// Consider adding a "default:" property in the specification file to hide this note.
  ///
  String? walletAddress;

  @override
  bool operator ==(Object other) => identical(this, other) || other is AuthNonceRequest &&
     other.walletAddress == walletAddress;

  @override
  int get hashCode =>
    // ignore: unnecessary_parenthesis
    (walletAddress == null ? 0 : walletAddress!.hashCode);

  @override
  String toString() => 'AuthNonceRequest[walletAddress=$walletAddress]';

  Map<String, dynamic> toJson() {
    final json = <String, dynamic>{};
    if (this.walletAddress != null) {
      json[r'wallet_address'] = this.walletAddress;
    } else {
      json[r'wallet_address'] = null;
    }
    return json;
  }

  /// Returns a new [AuthNonceRequest] instance and imports its values from
  /// [value] if it's a [Map], null otherwise.
  // ignore: prefer_constructors_over_static_methods
  static AuthNonceRequest? fromJson(dynamic value) {
    if (value is Map) {
      final json = value.cast<String, dynamic>();

      // Ensure that the map contains the required keys.
      // Note 1: the values aren't checked for validity beyond being non-null.
      // Note 2: this code is stripped in release mode!
      assert(() {
        requiredKeys.forEach((key) {
          assert(json.containsKey(key), 'Required key "AuthNonceRequest[$key]" is missing from JSON.');
          assert(json[key] != null, 'Required key "AuthNonceRequest[$key]" has a null value in JSON.');
        });
        return true;
      }());

      return AuthNonceRequest(
        walletAddress: mapValueOfType<String>(json, r'wallet_address'),
      );
    }
    return null;
  }

  static List<AuthNonceRequest>? listFromJson(dynamic json, {bool growable = false,}) {
    final result = <AuthNonceRequest>[];
    if (json is List && json.isNotEmpty) {
      for (final row in json) {
        final value = AuthNonceRequest.fromJson(row);
        if (value != null) {
          result.add(value);
        }
      }
    }
    return result.toList(growable: growable);
  }

  static Map<String, AuthNonceRequest> mapFromJson(dynamic json) {
    final map = <String, AuthNonceRequest>{};
    if (json is Map && json.isNotEmpty) {
      json = json.cast<String, dynamic>(); // ignore: parameter_assignments
      for (final entry in json.entries) {
        final value = AuthNonceRequest.fromJson(entry.value);
        if (value != null) {
          map[entry.key] = value;
        }
      }
    }
    return map;
  }

  // maps a json object with a list of AuthNonceRequest-objects as value to a dart map
  static Map<String, List<AuthNonceRequest>> mapListFromJson(dynamic json, {bool growable = false,}) {
    final map = <String, List<AuthNonceRequest>>{};
    if (json is Map && json.isNotEmpty) {
      json = json.cast<String, dynamic>(); // ignore: parameter_assignments
      for (final entry in json.entries) {
        final value = AuthNonceRequest.listFromJson(entry.value, growable: growable,);
        if (value != null) {
          map[entry.key] = value;
        }
      }
    }
    return map;
  }

  /// The list of required keys that must be present in a JSON.
  static const requiredKeys = <String>{
  };
}

