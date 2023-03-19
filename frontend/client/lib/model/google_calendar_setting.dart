//
// AUTO-GENERATED FILE, DO NOT MODIFY!
//
// @dart=2.12

// ignore_for_file: unused_element, unused_import
// ignore_for_file: always_put_required_named_parameters_first
// ignore_for_file: constant_identifier_names
// ignore_for_file: lines_longer_than_80_chars

part of openapi.api;

class GoogleCalendarSetting {
  /// Returns a new [GoogleCalendarSetting] instance.
  GoogleCalendarSetting({
    this.email,
    this.oauthCode,
  });

  ///
  /// Please note: This property should have been non-nullable! Since the specification file
  /// does not include a default value (using the "default:" property), however, the generated
  /// source code must fall back to having a nullable type.
  /// Consider adding a "default:" property in the specification file to hide this note.
  ///
  String? email;

  ///
  /// Please note: This property should have been non-nullable! Since the specification file
  /// does not include a default value (using the "default:" property), however, the generated
  /// source code must fall back to having a nullable type.
  /// Consider adding a "default:" property in the specification file to hide this note.
  ///
  String? oauthCode;

  @override
  bool operator ==(Object other) => identical(this, other) || other is GoogleCalendarSetting &&
     other.email == email &&
     other.oauthCode == oauthCode;

  @override
  int get hashCode =>
    // ignore: unnecessary_parenthesis
    (email == null ? 0 : email!.hashCode) +
    (oauthCode == null ? 0 : oauthCode!.hashCode);

  @override
  String toString() => 'GoogleCalendarSetting[email=$email, oauthCode=$oauthCode]';

  Map<String, dynamic> toJson() {
    final json = <String, dynamic>{};
    if (this.email != null) {
      json[r'email'] = this.email;
    } else {
      json[r'email'] = null;
    }
    if (this.oauthCode != null) {
      json[r'oauth_code'] = this.oauthCode;
    } else {
      json[r'oauth_code'] = null;
    }
    return json;
  }

  /// Returns a new [GoogleCalendarSetting] instance and imports its values from
  /// [value] if it's a [Map], null otherwise.
  // ignore: prefer_constructors_over_static_methods
  static GoogleCalendarSetting? fromJson(dynamic value) {
    if (value is Map) {
      final json = value.cast<String, dynamic>();

      // Ensure that the map contains the required keys.
      // Note 1: the values aren't checked for validity beyond being non-null.
      // Note 2: this code is stripped in release mode!
      assert(() {
        requiredKeys.forEach((key) {
          assert(json.containsKey(key), 'Required key "GoogleCalendarSetting[$key]" is missing from JSON.');
          assert(json[key] != null, 'Required key "GoogleCalendarSetting[$key]" has a null value in JSON.');
        });
        return true;
      }());

      return GoogleCalendarSetting(
        email: mapValueOfType<String>(json, r'email'),
        oauthCode: mapValueOfType<String>(json, r'oauth_code'),
      );
    }
    return null;
  }

  static List<GoogleCalendarSetting>? listFromJson(dynamic json, {bool growable = false,}) {
    final result = <GoogleCalendarSetting>[];
    if (json is List && json.isNotEmpty) {
      for (final row in json) {
        final value = GoogleCalendarSetting.fromJson(row);
        if (value != null) {
          result.add(value);
        }
      }
    }
    return result.toList(growable: growable);
  }

  static Map<String, GoogleCalendarSetting> mapFromJson(dynamic json) {
    final map = <String, GoogleCalendarSetting>{};
    if (json is Map && json.isNotEmpty) {
      json = json.cast<String, dynamic>(); // ignore: parameter_assignments
      for (final entry in json.entries) {
        final value = GoogleCalendarSetting.fromJson(entry.value);
        if (value != null) {
          map[entry.key] = value;
        }
      }
    }
    return map;
  }

  // maps a json object with a list of GoogleCalendarSetting-objects as value to a dart map
  static Map<String, List<GoogleCalendarSetting>> mapListFromJson(dynamic json, {bool growable = false,}) {
    final map = <String, List<GoogleCalendarSetting>>{};
    if (json is Map && json.isNotEmpty) {
      json = json.cast<String, dynamic>(); // ignore: parameter_assignments
      for (final entry in json.entries) {
        final value = GoogleCalendarSetting.listFromJson(entry.value, growable: growable,);
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

