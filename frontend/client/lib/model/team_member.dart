//
// AUTO-GENERATED FILE, DO NOT MODIFY!
//
// @dart=2.12

// ignore_for_file: unused_element, unused_import
// ignore_for_file: always_put_required_named_parameters_first
// ignore_for_file: constant_identifier_names
// ignore_for_file: lines_longer_than_80_chars

part of openapi.api;

class TeamMember {
  /// Returns a new [TeamMember] instance.
  TeamMember({
    this.walletAddress,
    this.email,
    this.status,
    this.inviteExpiredAt,
  });

  ///
  /// Please note: This property should have been non-nullable! Since the specification file
  /// does not include a default value (using the "default:" property), however, the generated
  /// source code must fall back to having a nullable type.
  /// Consider adding a "default:" property in the specification file to hide this note.
  ///
  String? walletAddress;

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
  String? status;

  ///
  /// Please note: This property should have been non-nullable! Since the specification file
  /// does not include a default value (using the "default:" property), however, the generated
  /// source code must fall back to having a nullable type.
  /// Consider adding a "default:" property in the specification file to hide this note.
  ///
  num? inviteExpiredAt;

  @override
  bool operator ==(Object other) => identical(this, other) || other is TeamMember &&
     other.walletAddress == walletAddress &&
     other.email == email &&
     other.status == status &&
     other.inviteExpiredAt == inviteExpiredAt;

  @override
  int get hashCode =>
    // ignore: unnecessary_parenthesis
    (walletAddress == null ? 0 : walletAddress!.hashCode) +
    (email == null ? 0 : email!.hashCode) +
    (status == null ? 0 : status!.hashCode) +
    (inviteExpiredAt == null ? 0 : inviteExpiredAt!.hashCode);

  @override
  String toString() => 'TeamMember[walletAddress=$walletAddress, email=$email, status=$status, inviteExpiredAt=$inviteExpiredAt]';

  Map<String, dynamic> toJson() {
    final json = <String, dynamic>{};
    if (this.walletAddress != null) {
      json[r'wallet_address'] = this.walletAddress;
    } else {
      json[r'wallet_address'] = null;
    }
    if (this.email != null) {
      json[r'email'] = this.email;
    } else {
      json[r'email'] = null;
    }
    if (this.status != null) {
      json[r'status'] = this.status;
    } else {
      json[r'status'] = null;
    }
    if (this.inviteExpiredAt != null) {
      json[r'invite_expired_at'] = this.inviteExpiredAt;
    } else {
      json[r'invite_expired_at'] = null;
    }
    return json;
  }

  /// Returns a new [TeamMember] instance and imports its values from
  /// [value] if it's a [Map], null otherwise.
  // ignore: prefer_constructors_over_static_methods
  static TeamMember? fromJson(dynamic value) {
    if (value is Map) {
      final json = value.cast<String, dynamic>();

      // Ensure that the map contains the required keys.
      // Note 1: the values aren't checked for validity beyond being non-null.
      // Note 2: this code is stripped in release mode!
      assert(() {
        requiredKeys.forEach((key) {
          assert(json.containsKey(key), 'Required key "TeamMember[$key]" is missing from JSON.');
          assert(json[key] != null, 'Required key "TeamMember[$key]" has a null value in JSON.');
        });
        return true;
      }());

      return TeamMember(
        walletAddress: mapValueOfType<String>(json, r'wallet_address'),
        email: mapValueOfType<String>(json, r'email'),
        status: mapValueOfType<String>(json, r'status'),
        inviteExpiredAt: json[r'invite_expired_at'] == null
            ? null
            : num.parse(json[r'invite_expired_at'].toString()),
      );
    }
    return null;
  }

  static List<TeamMember>? listFromJson(dynamic json, {bool growable = false,}) {
    final result = <TeamMember>[];
    if (json is List && json.isNotEmpty) {
      for (final row in json) {
        final value = TeamMember.fromJson(row);
        if (value != null) {
          result.add(value);
        }
      }
    }
    return result.toList(growable: growable);
  }

  static Map<String, TeamMember> mapFromJson(dynamic json) {
    final map = <String, TeamMember>{};
    if (json is Map && json.isNotEmpty) {
      json = json.cast<String, dynamic>(); // ignore: parameter_assignments
      for (final entry in json.entries) {
        final value = TeamMember.fromJson(entry.value);
        if (value != null) {
          map[entry.key] = value;
        }
      }
    }
    return map;
  }

  // maps a json object with a list of TeamMember-objects as value to a dart map
  static Map<String, List<TeamMember>> mapListFromJson(dynamic json, {bool growable = false,}) {
    final map = <String, List<TeamMember>>{};
    if (json is Map && json.isNotEmpty) {
      json = json.cast<String, dynamic>(); // ignore: parameter_assignments
      for (final entry in json.entries) {
        final value = TeamMember.listFromJson(entry.value, growable: growable,);
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

