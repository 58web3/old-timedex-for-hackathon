//
// AUTO-GENERATED FILE, DO NOT MODIFY!
//
// @dart=2.12

// ignore_for_file: unused_element, unused_import
// ignore_for_file: always_put_required_named_parameters_first
// ignore_for_file: constant_identifier_names
// ignore_for_file: lines_longer_than_80_chars

part of openapi.api;

class SendTransactionResponse {
  /// Returns a new [SendTransactionResponse] instance.
  SendTransactionResponse({
    this.message,
    this.tokenAddress,
    this.tokenAmount,
  });

  ///
  /// Please note: This property should have been non-nullable! Since the specification file
  /// does not include a default value (using the "default:" property), however, the generated
  /// source code must fall back to having a nullable type.
  /// Consider adding a "default:" property in the specification file to hide this note.
  ///
  String? message;

  ///
  /// Please note: This property should have been non-nullable! Since the specification file
  /// does not include a default value (using the "default:" property), however, the generated
  /// source code must fall back to having a nullable type.
  /// Consider adding a "default:" property in the specification file to hide this note.
  ///
  String? tokenAddress;

  ///
  /// Please note: This property should have been non-nullable! Since the specification file
  /// does not include a default value (using the "default:" property), however, the generated
  /// source code must fall back to having a nullable type.
  /// Consider adding a "default:" property in the specification file to hide this note.
  ///
  String? tokenAmount;

  @override
  bool operator ==(Object other) => identical(this, other) || other is SendTransactionResponse &&
     other.message == message &&
     other.tokenAddress == tokenAddress &&
     other.tokenAmount == tokenAmount;

  @override
  int get hashCode =>
    // ignore: unnecessary_parenthesis
    (message == null ? 0 : message!.hashCode) +
    (tokenAddress == null ? 0 : tokenAddress!.hashCode) +
    (tokenAmount == null ? 0 : tokenAmount!.hashCode);

  @override
  String toString() => 'SendTransactionResponse[message=$message, tokenAddress=$tokenAddress, tokenAmount=$tokenAmount]';

  Map<String, dynamic> toJson() {
    final json = <String, dynamic>{};
    if (this.message != null) {
      json[r'message'] = this.message;
    } else {
      json[r'message'] = null;
    }
    if (this.tokenAddress != null) {
      json[r'token_address'] = this.tokenAddress;
    } else {
      json[r'token_address'] = null;
    }
    if (this.tokenAmount != null) {
      json[r'token_amount'] = this.tokenAmount;
    } else {
      json[r'token_amount'] = null;
    }
    return json;
  }

  /// Returns a new [SendTransactionResponse] instance and imports its values from
  /// [value] if it's a [Map], null otherwise.
  // ignore: prefer_constructors_over_static_methods
  static SendTransactionResponse? fromJson(dynamic value) {
    if (value is Map) {
      final json = value.cast<String, dynamic>();

      // Ensure that the map contains the required keys.
      // Note 1: the values aren't checked for validity beyond being non-null.
      // Note 2: this code is stripped in release mode!
      assert(() {
        requiredKeys.forEach((key) {
          assert(json.containsKey(key), 'Required key "SendTransactionResponse[$key]" is missing from JSON.');
          assert(json[key] != null, 'Required key "SendTransactionResponse[$key]" has a null value in JSON.');
        });
        return true;
      }());

      return SendTransactionResponse(
        message: mapValueOfType<String>(json, r'message'),
        tokenAddress: mapValueOfType<String>(json, r'token_address'),
        tokenAmount: mapValueOfType<String>(json, r'token_amount'),
      );
    }
    return null;
  }

  static List<SendTransactionResponse>? listFromJson(dynamic json, {bool growable = false,}) {
    final result = <SendTransactionResponse>[];
    if (json is List && json.isNotEmpty) {
      for (final row in json) {
        final value = SendTransactionResponse.fromJson(row);
        if (value != null) {
          result.add(value);
        }
      }
    }
    return result.toList(growable: growable);
  }

  static Map<String, SendTransactionResponse> mapFromJson(dynamic json) {
    final map = <String, SendTransactionResponse>{};
    if (json is Map && json.isNotEmpty) {
      json = json.cast<String, dynamic>(); // ignore: parameter_assignments
      for (final entry in json.entries) {
        final value = SendTransactionResponse.fromJson(entry.value);
        if (value != null) {
          map[entry.key] = value;
        }
      }
    }
    return map;
  }

  // maps a json object with a list of SendTransactionResponse-objects as value to a dart map
  static Map<String, List<SendTransactionResponse>> mapListFromJson(dynamic json, {bool growable = false,}) {
    final map = <String, List<SendTransactionResponse>>{};
    if (json is Map && json.isNotEmpty) {
      json = json.cast<String, dynamic>(); // ignore: parameter_assignments
      for (final entry in json.entries) {
        final value = SendTransactionResponse.listFromJson(entry.value, growable: growable,);
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

