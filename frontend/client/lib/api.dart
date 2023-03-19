//
// AUTO-GENERATED FILE, DO NOT MODIFY!
//
// @dart=2.12

// ignore_for_file: unused_element, unused_import
// ignore_for_file: always_put_required_named_parameters_first
// ignore_for_file: constant_identifier_names
// ignore_for_file: lines_longer_than_80_chars

library openapi.api;

import 'dart:async';
import 'dart:convert';
import 'dart:io';

import 'package:http/http.dart';
import 'package:intl/intl.dart';
import 'package:meta/meta.dart';

part 'api_client.dart';
part 'api_helper.dart';
part 'api_exception.dart';
part 'auth/authentication.dart';
part 'auth/api_key_auth.dart';
part 'auth/oauth.dart';
part 'auth/http_basic_auth.dart';
part 'auth/http_bearer_auth.dart';

part 'api/authentication_api.dart';
part 'api/calendar_api.dart';
part 'api/team_api.dart';
part 'api/transaction_api.dart';
part 'api/user_api.dart';
part 'api/wallet_api.dart';

part 'model/auth_nonce_request.dart';
part 'model/auth_nonce_response.dart';
part 'model/booking.dart';
part 'model/booking_detail.dart';
part 'model/calendar.dart';
part 'model/calendar_detail.dart';
part 'model/common_response.dart';
part 'model/create_team_response.dart';
part 'model/google_calendar_setting.dart';
part 'model/key_value.dart';
part 'model/origin_transaction.dart';
part 'model/publish_request.dart';
part 'model/publish_response.dart';
part 'model/response_bad_request.dart';
part 'model/response_conflict.dart';
part 'model/response_forbidden.dart';
part 'model/response_internal_server_error.dart';
part 'model/response_not_found.dart';
part 'model/response_unauthorized.dart';
part 'model/send_transaction_request.dart';
part 'model/send_transaction_response.dart';
part 'model/success_response.dart';
part 'model/team.dart';
part 'model/team_detail.dart';
part 'model/team_member.dart';
part 'model/user.dart';
part 'model/user_teams_response.dart';
part 'model/verify_request.dart';
part 'model/verify_response.dart';
part 'model/wallet.dart';
part 'model/wallet_user.dart';


const _delimiters = {'csv': ',', 'ssv': ' ', 'tsv': '\t', 'pipes': '|'};
const _dateEpochMarker = 'epoch';
final _dateFormatter = DateFormat('yyyy-MM-dd');
final _regList = RegExp(r'^List<(.*)>$');
final _regSet = RegExp(r'^Set<(.*)>$');
final _regMap = RegExp(r'^Map<String,(.*)>$');

ApiClient defaultApiClient = ApiClient();
