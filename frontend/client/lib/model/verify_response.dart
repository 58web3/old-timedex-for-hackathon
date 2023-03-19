//
// AUTO-GENERATED FILE, DO NOT MODIFY!
//
// @dart=2.12

// ignore_for_file: unused_element, unused_import
// ignore_for_file: always_put_required_named_parameters_first
// ignore_for_file: constant_identifier_names
// ignore_for_file: lines_longer_than_80_chars

part of openapi.api;

class VerifyResponse {
  /// Returns a new [VerifyResponse] instance.
  VerifyResponse({
    this.userId,
    this.jwt,
  });

  ///
  /// Please note: This property should have been non-nullable! Since the specification file
  /// does not include a default value (using the "default:" property), however, the generated
  /// source code must fall back to having a nullable type.
  /// Consider adding a "default:" property in the specification file to hide this note.
  ///
  String? userId;

  ///
  /// Please note: This property should have been non-nullable! Since the specification file
  /// does not include a default value (using the "default:" property), however, the generated
  /// source code must fall back to having a nullable type.
  /// Consider adding a "default:" property in the specification file to hide this note.
  ///
  String? jwt;

  @override
  bool operator ==(Object other) => identical(this, other) || other is VerifyResponse &&
     other.userId == userId &&
     other.jwt == jwt;

  @override
  int get hashCode =>
    // ignore: unnecessary_parenthesis
    (userId == null ? 0 : userId!.hashCode) +
    (jwt == null ? 0 : jwt!.hashCode);

  @override
  String toString() => 'VerifyResponse[userId=$userId, jwt=$jwt]';

  Map<String, dynamic> toJson() {
    final json = <String, dynamic>{};
    if (this.userId != null) {
      json[r'user_id'] = this.userId;
    } else {
      json[r'user_id'] = null;
    }
    if (this.jwt != null) {
      json[r'jwt'] = this.jwt;
    } else {
      json[r'jwt'] = null;
    }
    return json;
  }

  /// Returns a new [VerifyResponse] instance and imports its values from
  /// [value] if it's a [Map], null otherwise.
  // ignore: prefer_constructors_over_static_methods
  static VerifyResponse? fromJson(dynamic value) {
    if (value is Map) {
      final json = value.cast<String, dynamic>();

      // Ensure that the map contains the required keys.
      // Note 1: the values aren't checked for validity beyond being non-null.
      // Note 2: this code is stripped in release mode!
      assert(() {
        requiredKeys.forEach((key) {
          assert(json.containsKey(key), 'Required key "VerifyResponse[$key]" is missing from JSON.');
          assert(json[key] != null, 'Required key "VerifyResponse[$key]" has a null value in JSON.');
        });
        return true;
      }());

      return VerifyResponse(
        userId: mapValueOfType<String>(json, r'user_id'),
        jwt: mapValueOfType<String>(json, r'jwt'),
      );
    }
    return null;
  }

  static List<VerifyResponse>? listFromJson(dynamic json, {bool growable = false,}) {
    final result = <VerifyResponse>[];
    if (json is List && json.isNotEmpty) {
      for (final row in json) {
        final value = VerifyResponse.fromJson(row);
        if (value != null) {
          result.add(value);
        }
      }
    }
    return result.toList(growable: growable);
  }

  static Map<String, VerifyResponse> mapFromJson(dynamic json) {
    final map = <String, VerifyResponse>{};
    if (json is Map && json.isNotEmpty) {
      json = json.cast<String, dynamic>(); // ignore: parameter_assignments
      for (final entry in json.entries) {
        final value = VerifyResponse.fromJson(entry.value);
        if (value != null) {
          map[entry.key] = value;
        }
      }
    }
    return map;
  }

  // maps a json object with a list of VerifyResponse-objects as value to a dart map
  static Map<String, List<VerifyResponse>> mapListFromJson(dynamic json, {bool growable = false,}) {
    final map = <String, List<VerifyResponse>>{};
    if (json is Map && json.isNotEmpty) {
      json = json.cast<String, dynamic>(); // ignore: parameter_assignments
      for (final entry in json.entries) {
        final value = VerifyResponse.listFromJson(entry.value, growable: growable,);
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

