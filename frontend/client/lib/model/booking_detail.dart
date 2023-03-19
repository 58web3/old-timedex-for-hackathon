//
// AUTO-GENERATED FILE, DO NOT MODIFY!
//
// @dart=2.12

// ignore_for_file: unused_element, unused_import
// ignore_for_file: always_put_required_named_parameters_first
// ignore_for_file: constant_identifier_names
// ignore_for_file: lines_longer_than_80_chars

part of openapi.api;

class BookingDetail {
  /// Returns a new [BookingDetail] instance.
  BookingDetail({
    this.bookingId,
    this.title,
    this.priority,
    this.icsContent,
  });

  ///
  /// Please note: This property should have been non-nullable! Since the specification file
  /// does not include a default value (using the "default:" property), however, the generated
  /// source code must fall back to having a nullable type.
  /// Consider adding a "default:" property in the specification file to hide this note.
  ///
  String? bookingId;

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
  String? priority;

  ///
  /// Please note: This property should have been non-nullable! Since the specification file
  /// does not include a default value (using the "default:" property), however, the generated
  /// source code must fall back to having a nullable type.
  /// Consider adding a "default:" property in the specification file to hide this note.
  ///
  String? icsContent;

  @override
  bool operator ==(Object other) => identical(this, other) || other is BookingDetail &&
     other.bookingId == bookingId &&
     other.title == title &&
     other.priority == priority &&
     other.icsContent == icsContent;

  @override
  int get hashCode =>
    // ignore: unnecessary_parenthesis
    (bookingId == null ? 0 : bookingId!.hashCode) +
    (title == null ? 0 : title!.hashCode) +
    (priority == null ? 0 : priority!.hashCode) +
    (icsContent == null ? 0 : icsContent!.hashCode);

  @override
  String toString() => 'BookingDetail[bookingId=$bookingId, title=$title, priority=$priority, icsContent=$icsContent]';

  Map<String, dynamic> toJson() {
    final json = <String, dynamic>{};
    if (this.bookingId != null) {
      json[r'booking_id'] = this.bookingId;
    } else {
      json[r'booking_id'] = null;
    }
    if (this.title != null) {
      json[r'title'] = this.title;
    } else {
      json[r'title'] = null;
    }
    if (this.priority != null) {
      json[r'priority'] = this.priority;
    } else {
      json[r'priority'] = null;
    }
    if (this.icsContent != null) {
      json[r'ics_content'] = this.icsContent;
    } else {
      json[r'ics_content'] = null;
    }
    return json;
  }

  /// Returns a new [BookingDetail] instance and imports its values from
  /// [value] if it's a [Map], null otherwise.
  // ignore: prefer_constructors_over_static_methods
  static BookingDetail? fromJson(dynamic value) {
    if (value is Map) {
      final json = value.cast<String, dynamic>();

      // Ensure that the map contains the required keys.
      // Note 1: the values aren't checked for validity beyond being non-null.
      // Note 2: this code is stripped in release mode!
      assert(() {
        requiredKeys.forEach((key) {
          assert(json.containsKey(key), 'Required key "BookingDetail[$key]" is missing from JSON.');
          assert(json[key] != null, 'Required key "BookingDetail[$key]" has a null value in JSON.');
        });
        return true;
      }());

      return BookingDetail(
        bookingId: mapValueOfType<String>(json, r'booking_id'),
        title: mapValueOfType<String>(json, r'title'),
        priority: mapValueOfType<String>(json, r'priority'),
        icsContent: mapValueOfType<String>(json, r'ics_content'),
      );
    }
    return null;
  }

  static List<BookingDetail>? listFromJson(dynamic json, {bool growable = false,}) {
    final result = <BookingDetail>[];
    if (json is List && json.isNotEmpty) {
      for (final row in json) {
        final value = BookingDetail.fromJson(row);
        if (value != null) {
          result.add(value);
        }
      }
    }
    return result.toList(growable: growable);
  }

  static Map<String, BookingDetail> mapFromJson(dynamic json) {
    final map = <String, BookingDetail>{};
    if (json is Map && json.isNotEmpty) {
      json = json.cast<String, dynamic>(); // ignore: parameter_assignments
      for (final entry in json.entries) {
        final value = BookingDetail.fromJson(entry.value);
        if (value != null) {
          map[entry.key] = value;
        }
      }
    }
    return map;
  }

  // maps a json object with a list of BookingDetail-objects as value to a dart map
  static Map<String, List<BookingDetail>> mapListFromJson(dynamic json, {bool growable = false,}) {
    final map = <String, List<BookingDetail>>{};
    if (json is Map && json.isNotEmpty) {
      json = json.cast<String, dynamic>(); // ignore: parameter_assignments
      for (final entry in json.entries) {
        final value = BookingDetail.listFromJson(entry.value, growable: growable,);
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

