//
// AUTO-GENERATED FILE, DO NOT MODIFY!
//
// @dart=2.12

// ignore_for_file: unused_element, unused_import
// ignore_for_file: always_put_required_named_parameters_first
// ignore_for_file: constant_identifier_names
// ignore_for_file: lines_longer_than_80_chars

part of openapi.api;

class CalendarDetail {
  /// Returns a new [CalendarDetail] instance.
  CalendarDetail({
    this.calendarId,
    this.walletAddress,
    this.icsContests = const [],
  });

  ///
  /// Please note: This property should have been non-nullable! Since the specification file
  /// does not include a default value (using the "default:" property), however, the generated
  /// source code must fall back to having a nullable type.
  /// Consider adding a "default:" property in the specification file to hide this note.
  ///
  String? calendarId;

  ///
  /// Please note: This property should have been non-nullable! Since the specification file
  /// does not include a default value (using the "default:" property), however, the generated
  /// source code must fall back to having a nullable type.
  /// Consider adding a "default:" property in the specification file to hide this note.
  ///
  String? walletAddress;

  List<BookingDetail> icsContests;

  @override
  bool operator ==(Object other) => identical(this, other) || other is CalendarDetail &&
     other.calendarId == calendarId &&
     other.walletAddress == walletAddress &&
     other.icsContests == icsContests;

  @override
  int get hashCode =>
    // ignore: unnecessary_parenthesis
    (calendarId == null ? 0 : calendarId!.hashCode) +
    (walletAddress == null ? 0 : walletAddress!.hashCode) +
    (icsContests.hashCode);

  @override
  String toString() => 'CalendarDetail[calendarId=$calendarId, walletAddress=$walletAddress, icsContests=$icsContests]';

  Map<String, dynamic> toJson() {
    final json = <String, dynamic>{};
    if (this.calendarId != null) {
      json[r'calendar_id'] = this.calendarId;
    } else {
      json[r'calendar_id'] = null;
    }
    if (this.walletAddress != null) {
      json[r'wallet_address'] = this.walletAddress;
    } else {
      json[r'wallet_address'] = null;
    }
      json[r'ics_contests'] = this.icsContests;
    return json;
  }

  /// Returns a new [CalendarDetail] instance and imports its values from
  /// [value] if it's a [Map], null otherwise.
  // ignore: prefer_constructors_over_static_methods
  static CalendarDetail? fromJson(dynamic value) {
    if (value is Map) {
      final json = value.cast<String, dynamic>();

      // Ensure that the map contains the required keys.
      // Note 1: the values aren't checked for validity beyond being non-null.
      // Note 2: this code is stripped in release mode!
      assert(() {
        requiredKeys.forEach((key) {
          assert(json.containsKey(key), 'Required key "CalendarDetail[$key]" is missing from JSON.');
          assert(json[key] != null, 'Required key "CalendarDetail[$key]" has a null value in JSON.');
        });
        return true;
      }());

      return CalendarDetail(
        calendarId: mapValueOfType<String>(json, r'calendar_id'),
        walletAddress: mapValueOfType<String>(json, r'wallet_address'),
        icsContests: BookingDetail.listFromJson(json[r'ics_contests']) ?? const [],
      );
    }
    return null;
  }

  static List<CalendarDetail>? listFromJson(dynamic json, {bool growable = false,}) {
    final result = <CalendarDetail>[];
    if (json is List && json.isNotEmpty) {
      for (final row in json) {
        final value = CalendarDetail.fromJson(row);
        if (value != null) {
          result.add(value);
        }
      }
    }
    return result.toList(growable: growable);
  }

  static Map<String, CalendarDetail> mapFromJson(dynamic json) {
    final map = <String, CalendarDetail>{};
    if (json is Map && json.isNotEmpty) {
      json = json.cast<String, dynamic>(); // ignore: parameter_assignments
      for (final entry in json.entries) {
        final value = CalendarDetail.fromJson(entry.value);
        if (value != null) {
          map[entry.key] = value;
        }
      }
    }
    return map;
  }

  // maps a json object with a list of CalendarDetail-objects as value to a dart map
  static Map<String, List<CalendarDetail>> mapListFromJson(dynamic json, {bool growable = false,}) {
    final map = <String, List<CalendarDetail>>{};
    if (json is Map && json.isNotEmpty) {
      json = json.cast<String, dynamic>(); // ignore: parameter_assignments
      for (final entry in json.entries) {
        final value = CalendarDetail.listFromJson(entry.value, growable: growable,);
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

