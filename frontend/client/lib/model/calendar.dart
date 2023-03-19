//
// AUTO-GENERATED FILE, DO NOT MODIFY!
//
// @dart=2.12

// ignore_for_file: unused_element, unused_import
// ignore_for_file: always_put_required_named_parameters_first
// ignore_for_file: constant_identifier_names
// ignore_for_file: lines_longer_than_80_chars

part of openapi.api;

class Calendar {
  /// Returns a new [Calendar] instance.
  Calendar({
    this.googleCalendars = const [],
    this.outlookCalendars = const [],
    this.icsContents = const [],
  });

  List<GoogleCalendarSetting> googleCalendars;

  List<String> outlookCalendars;

  List<String> icsContents;

  @override
  bool operator ==(Object other) => identical(this, other) || other is Calendar &&
     other.googleCalendars == googleCalendars &&
     other.outlookCalendars == outlookCalendars &&
     other.icsContents == icsContents;

  @override
  int get hashCode =>
    // ignore: unnecessary_parenthesis
    (googleCalendars.hashCode) +
    (outlookCalendars.hashCode) +
    (icsContents.hashCode);

  @override
  String toString() => 'Calendar[googleCalendars=$googleCalendars, outlookCalendars=$outlookCalendars, icsContents=$icsContents]';

  Map<String, dynamic> toJson() {
    final json = <String, dynamic>{};
      json[r'google_calendars'] = this.googleCalendars;
      json[r'outlook_calendars'] = this.outlookCalendars;
      json[r'ics_contents'] = this.icsContents;
    return json;
  }

  /// Returns a new [Calendar] instance and imports its values from
  /// [value] if it's a [Map], null otherwise.
  // ignore: prefer_constructors_over_static_methods
  static Calendar? fromJson(dynamic value) {
    if (value is Map) {
      final json = value.cast<String, dynamic>();

      // Ensure that the map contains the required keys.
      // Note 1: the values aren't checked for validity beyond being non-null.
      // Note 2: this code is stripped in release mode!
      assert(() {
        requiredKeys.forEach((key) {
          assert(json.containsKey(key), 'Required key "Calendar[$key]" is missing from JSON.');
          assert(json[key] != null, 'Required key "Calendar[$key]" has a null value in JSON.');
        });
        return true;
      }());

      return Calendar(
        googleCalendars: GoogleCalendarSetting.listFromJson(json[r'google_calendars']) ?? const [],
        outlookCalendars: json[r'outlook_calendars'] is List
            ? (json[r'outlook_calendars'] as List).cast<String>()
            : const [],
        icsContents: json[r'ics_contents'] is List
            ? (json[r'ics_contents'] as List).cast<String>()
            : const [],
      );
    }
    return null;
  }

  static List<Calendar>? listFromJson(dynamic json, {bool growable = false,}) {
    final result = <Calendar>[];
    if (json is List && json.isNotEmpty) {
      for (final row in json) {
        final value = Calendar.fromJson(row);
        if (value != null) {
          result.add(value);
        }
      }
    }
    return result.toList(growable: growable);
  }

  static Map<String, Calendar> mapFromJson(dynamic json) {
    final map = <String, Calendar>{};
    if (json is Map && json.isNotEmpty) {
      json = json.cast<String, dynamic>(); // ignore: parameter_assignments
      for (final entry in json.entries) {
        final value = Calendar.fromJson(entry.value);
        if (value != null) {
          map[entry.key] = value;
        }
      }
    }
    return map;
  }

  // maps a json object with a list of Calendar-objects as value to a dart map
  static Map<String, List<Calendar>> mapListFromJson(dynamic json, {bool growable = false,}) {
    final map = <String, List<Calendar>>{};
    if (json is Map && json.isNotEmpty) {
      json = json.cast<String, dynamic>(); // ignore: parameter_assignments
      for (final entry in json.entries) {
        final value = Calendar.listFromJson(entry.value, growable: growable,);
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

