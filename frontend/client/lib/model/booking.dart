//
// AUTO-GENERATED FILE, DO NOT MODIFY!
//
// @dart=2.12

// ignore_for_file: unused_element, unused_import
// ignore_for_file: always_put_required_named_parameters_first
// ignore_for_file: constant_identifier_names
// ignore_for_file: lines_longer_than_80_chars

part of openapi.api;

class Booking {
  /// Returns a new [Booking] instance.
  Booking({
    this.title,
    this.start,
    this.end,
    this.priority,
    this.attendees = const [],
    this.summary,
  });

  ///
  /// Please note: This property should have been non-nullable! Since the specification file
  /// does not include a default value (using the "default:" property), however, the generated
  /// source code must fall back to having a nullable type.
  /// Consider adding a "default:" property in the specification file to hide this note.
  ///
  String? title;

  ///
  /// Please note: This property should have been non-nullable! Since the specification file
  /// does not include a default value (using the "default:" property), however, the generated
  /// source code must fall back to having a nullable type.
  /// Consider adding a "default:" property in the specification file to hide this note.
  ///
  String? start;

  ///
  /// Please note: This property should have been non-nullable! Since the specification file
  /// does not include a default value (using the "default:" property), however, the generated
  /// source code must fall back to having a nullable type.
  /// Consider adding a "default:" property in the specification file to hide this note.
  ///
  String? end;

  ///
  /// Please note: This property should have been non-nullable! Since the specification file
  /// does not include a default value (using the "default:" property), however, the generated
  /// source code must fall back to having a nullable type.
  /// Consider adding a "default:" property in the specification file to hide this note.
  ///
  String? priority;

  List<String> attendees;

  ///
  /// Please note: This property should have been non-nullable! Since the specification file
  /// does not include a default value (using the "default:" property), however, the generated
  /// source code must fall back to having a nullable type.
  /// Consider adding a "default:" property in the specification file to hide this note.
  ///
  String? summary;

  @override
  bool operator ==(Object other) => identical(this, other) || other is Booking &&
     other.title == title &&
     other.start == start &&
     other.end == end &&
     other.priority == priority &&
     other.attendees == attendees &&
     other.summary == summary;

  @override
  int get hashCode =>
    // ignore: unnecessary_parenthesis
    (title == null ? 0 : title!.hashCode) +
    (start == null ? 0 : start!.hashCode) +
    (end == null ? 0 : end!.hashCode) +
    (priority == null ? 0 : priority!.hashCode) +
    (attendees.hashCode) +
    (summary == null ? 0 : summary!.hashCode);

  @override
  String toString() => 'Booking[title=$title, start=$start, end=$end, priority=$priority, attendees=$attendees, summary=$summary]';

  Map<String, dynamic> toJson() {
    final json = <String, dynamic>{};
    if (this.title != null) {
      json[r'title'] = this.title;
    } else {
      json[r'title'] = null;
    }
    if (this.start != null) {
      json[r'start'] = this.start;
    } else {
      json[r'start'] = null;
    }
    if (this.end != null) {
      json[r'end'] = this.end;
    } else {
      json[r'end'] = null;
    }
    if (this.priority != null) {
      json[r'priority'] = this.priority;
    } else {
      json[r'priority'] = null;
    }
      json[r'attendees'] = this.attendees;
    if (this.summary != null) {
      json[r'summary'] = this.summary;
    } else {
      json[r'summary'] = null;
    }
    return json;
  }

  /// Returns a new [Booking] instance and imports its values from
  /// [value] if it's a [Map], null otherwise.
  // ignore: prefer_constructors_over_static_methods
  static Booking? fromJson(dynamic value) {
    if (value is Map) {
      final json = value.cast<String, dynamic>();

      // Ensure that the map contains the required keys.
      // Note 1: the values aren't checked for validity beyond being non-null.
      // Note 2: this code is stripped in release mode!
      assert(() {
        requiredKeys.forEach((key) {
          assert(json.containsKey(key), 'Required key "Booking[$key]" is missing from JSON.');
          assert(json[key] != null, 'Required key "Booking[$key]" has a null value in JSON.');
        });
        return true;
      }());

      return Booking(
        title: mapValueOfType<String>(json, r'title'),
        start: mapValueOfType<String>(json, r'start'),
        end: mapValueOfType<String>(json, r'end'),
        priority: mapValueOfType<String>(json, r'priority'),
        attendees: json[r'attendees'] is List
            ? (json[r'attendees'] as List).cast<String>()
            : const [],
        summary: mapValueOfType<String>(json, r'summary'),
      );
    }
    return null;
  }

  static List<Booking>? listFromJson(dynamic json, {bool growable = false,}) {
    final result = <Booking>[];
    if (json is List && json.isNotEmpty) {
      for (final row in json) {
        final value = Booking.fromJson(row);
        if (value != null) {
          result.add(value);
        }
      }
    }
    return result.toList(growable: growable);
  }

  static Map<String, Booking> mapFromJson(dynamic json) {
    final map = <String, Booking>{};
    if (json is Map && json.isNotEmpty) {
      json = json.cast<String, dynamic>(); // ignore: parameter_assignments
      for (final entry in json.entries) {
        final value = Booking.fromJson(entry.value);
        if (value != null) {
          map[entry.key] = value;
        }
      }
    }
    return map;
  }

  // maps a json object with a list of Booking-objects as value to a dart map
  static Map<String, List<Booking>> mapListFromJson(dynamic json, {bool growable = false,}) {
    final map = <String, List<Booking>>{};
    if (json is Map && json.isNotEmpty) {
      json = json.cast<String, dynamic>(); // ignore: parameter_assignments
      for (final entry in json.entries) {
        final value = Booking.listFromJson(entry.value, growable: growable,);
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

