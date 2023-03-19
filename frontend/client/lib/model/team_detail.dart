//
// AUTO-GENERATED FILE, DO NOT MODIFY!
//
// @dart=2.12

// ignore_for_file: unused_element, unused_import
// ignore_for_file: always_put_required_named_parameters_first
// ignore_for_file: constant_identifier_names
// ignore_for_file: lines_longer_than_80_chars

part of openapi.api;

class TeamDetail {
  /// Returns a new [TeamDetail] instance.
  TeamDetail({
    this.teamId,
    this.teamName,
    this.teamDescription,
    this.teamMembers = const [],
    this.createdAt,
    this.createdBy,
    this.updatedAt,
    this.updatedBy,
    this.deleteFlg,
  });

  ///
  /// Please note: This property should have been non-nullable! Since the specification file
  /// does not include a default value (using the "default:" property), however, the generated
  /// source code must fall back to having a nullable type.
  /// Consider adding a "default:" property in the specification file to hide this note.
  ///
  String? teamId;

  ///
  /// Please note: This property should have been non-nullable! Since the specification file
  /// does not include a default value (using the "default:" property), however, the generated
  /// source code must fall back to having a nullable type.
  /// Consider adding a "default:" property in the specification file to hide this note.
  ///
  String? teamName;

  ///
  /// Please note: This property should have been non-nullable! Since the specification file
  /// does not include a default value (using the "default:" property), however, the generated
  /// source code must fall back to having a nullable type.
  /// Consider adding a "default:" property in the specification file to hide this note.
  ///
  String? teamDescription;

  List<TeamMember> teamMembers;

  ///
  /// Please note: This property should have been non-nullable! Since the specification file
  /// does not include a default value (using the "default:" property), however, the generated
  /// source code must fall back to having a nullable type.
  /// Consider adding a "default:" property in the specification file to hide this note.
  ///
  num? createdAt;

  ///
  /// Please note: This property should have been non-nullable! Since the specification file
  /// does not include a default value (using the "default:" property), however, the generated
  /// source code must fall back to having a nullable type.
  /// Consider adding a "default:" property in the specification file to hide this note.
  ///
  String? createdBy;

  ///
  /// Please note: This property should have been non-nullable! Since the specification file
  /// does not include a default value (using the "default:" property), however, the generated
  /// source code must fall back to having a nullable type.
  /// Consider adding a "default:" property in the specification file to hide this note.
  ///
  num? updatedAt;

  ///
  /// Please note: This property should have been non-nullable! Since the specification file
  /// does not include a default value (using the "default:" property), however, the generated
  /// source code must fall back to having a nullable type.
  /// Consider adding a "default:" property in the specification file to hide this note.
  ///
  String? updatedBy;

  ///
  /// Please note: This property should have been non-nullable! Since the specification file
  /// does not include a default value (using the "default:" property), however, the generated
  /// source code must fall back to having a nullable type.
  /// Consider adding a "default:" property in the specification file to hide this note.
  ///
  bool? deleteFlg;

  @override
  bool operator ==(Object other) => identical(this, other) || other is TeamDetail &&
     other.teamId == teamId &&
     other.teamName == teamName &&
     other.teamDescription == teamDescription &&
     other.teamMembers == teamMembers &&
     other.createdAt == createdAt &&
     other.createdBy == createdBy &&
     other.updatedAt == updatedAt &&
     other.updatedBy == updatedBy &&
     other.deleteFlg == deleteFlg;

  @override
  int get hashCode =>
    // ignore: unnecessary_parenthesis
    (teamId == null ? 0 : teamId!.hashCode) +
    (teamName == null ? 0 : teamName!.hashCode) +
    (teamDescription == null ? 0 : teamDescription!.hashCode) +
    (teamMembers.hashCode) +
    (createdAt == null ? 0 : createdAt!.hashCode) +
    (createdBy == null ? 0 : createdBy!.hashCode) +
    (updatedAt == null ? 0 : updatedAt!.hashCode) +
    (updatedBy == null ? 0 : updatedBy!.hashCode) +
    (deleteFlg == null ? 0 : deleteFlg!.hashCode);

  @override
  String toString() => 'TeamDetail[teamId=$teamId, teamName=$teamName, teamDescription=$teamDescription, teamMembers=$teamMembers, createdAt=$createdAt, createdBy=$createdBy, updatedAt=$updatedAt, updatedBy=$updatedBy, deleteFlg=$deleteFlg]';

  Map<String, dynamic> toJson() {
    final json = <String, dynamic>{};
    if (this.teamId != null) {
      json[r'team_id'] = this.teamId;
    } else {
      json[r'team_id'] = null;
    }
    if (this.teamName != null) {
      json[r'team_name'] = this.teamName;
    } else {
      json[r'team_name'] = null;
    }
    if (this.teamDescription != null) {
      json[r'team_description'] = this.teamDescription;
    } else {
      json[r'team_description'] = null;
    }
      json[r'team_members'] = this.teamMembers;
    if (this.createdAt != null) {
      json[r'created_at'] = this.createdAt;
    } else {
      json[r'created_at'] = null;
    }
    if (this.createdBy != null) {
      json[r'created_by'] = this.createdBy;
    } else {
      json[r'created_by'] = null;
    }
    if (this.updatedAt != null) {
      json[r'updated_at'] = this.updatedAt;
    } else {
      json[r'updated_at'] = null;
    }
    if (this.updatedBy != null) {
      json[r'updated_by'] = this.updatedBy;
    } else {
      json[r'updated_by'] = null;
    }
    if (this.deleteFlg != null) {
      json[r'delete_flg'] = this.deleteFlg;
    } else {
      json[r'delete_flg'] = null;
    }
    return json;
  }

  /// Returns a new [TeamDetail] instance and imports its values from
  /// [value] if it's a [Map], null otherwise.
  // ignore: prefer_constructors_over_static_methods
  static TeamDetail? fromJson(dynamic value) {
    if (value is Map) {
      final json = value.cast<String, dynamic>();

      // Ensure that the map contains the required keys.
      // Note 1: the values aren't checked for validity beyond being non-null.
      // Note 2: this code is stripped in release mode!
      assert(() {
        requiredKeys.forEach((key) {
          assert(json.containsKey(key), 'Required key "TeamDetail[$key]" is missing from JSON.');
          assert(json[key] != null, 'Required key "TeamDetail[$key]" has a null value in JSON.');
        });
        return true;
      }());

      return TeamDetail(
        teamId: mapValueOfType<String>(json, r'team_id'),
        teamName: mapValueOfType<String>(json, r'team_name'),
        teamDescription: mapValueOfType<String>(json, r'team_description'),
        teamMembers: TeamMember.listFromJson(json[r'team_members']) ?? const [],
        createdAt: json[r'created_at'] == null
            ? null
            : num.parse(json[r'created_at'].toString()),
        createdBy: mapValueOfType<String>(json, r'created_by'),
        updatedAt: json[r'updated_at'] == null
            ? null
            : num.parse(json[r'updated_at'].toString()),
        updatedBy: mapValueOfType<String>(json, r'updated_by'),
        deleteFlg: mapValueOfType<bool>(json, r'delete_flg'),
      );
    }
    return null;
  }

  static List<TeamDetail>? listFromJson(dynamic json, {bool growable = false,}) {
    final result = <TeamDetail>[];
    if (json is List && json.isNotEmpty) {
      for (final row in json) {
        final value = TeamDetail.fromJson(row);
        if (value != null) {
          result.add(value);
        }
      }
    }
    return result.toList(growable: growable);
  }

  static Map<String, TeamDetail> mapFromJson(dynamic json) {
    final map = <String, TeamDetail>{};
    if (json is Map && json.isNotEmpty) {
      json = json.cast<String, dynamic>(); // ignore: parameter_assignments
      for (final entry in json.entries) {
        final value = TeamDetail.fromJson(entry.value);
        if (value != null) {
          map[entry.key] = value;
        }
      }
    }
    return map;
  }

  // maps a json object with a list of TeamDetail-objects as value to a dart map
  static Map<String, List<TeamDetail>> mapListFromJson(dynamic json, {bool growable = false,}) {
    final map = <String, List<TeamDetail>>{};
    if (json is Map && json.isNotEmpty) {
      json = json.cast<String, dynamic>(); // ignore: parameter_assignments
      for (final entry in json.entries) {
        final value = TeamDetail.listFromJson(entry.value, growable: growable,);
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

