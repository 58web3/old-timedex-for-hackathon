import 'dart:async';
import 'dart:convert';

import 'package:flutter_dotenv/flutter_dotenv.dart';
import 'package:flutter_riverpod/flutter_riverpod.dart';
import 'package:flutter_secure_storage/flutter_secure_storage.dart';
import 'package:http/http.dart' as http;
import 'package:logger/logger.dart';
import 'package:time_dex/global/providers.dart';
import 'package:flutter_web3/flutter_web3.dart' as w3;

import '../../../global/usecases/web3_connect_usecase.dart';
import '../providers.dart';
import '../states.dart';

final logger = Logger();

final signUpUsecaseProvider = Provider<SignUpUsecase>(
  (ref) => SignUpUsecase(
    ref: ref,
    storage: ref.watch(secureStorageProvider),
  ),
);

final String API_ENDPOINT = dotenv.env['API_ENDPOINT'] ?? '';
final String API_POST_GENERATE_NOUNCE = '$API_ENDPOINT/v1/auth/generate-nonce';
final String API_POST_LOGIN = '$API_ENDPOINT/v1/auth/login';
final String API_GET_USER_ID_BY_WA =
    '$API_ENDPOINT/v1/wallet/{wallet_address}/user_id';
final String API_POST_CREATE_USER = '$API_ENDPOINT/v1/user';
final String API_POST_CREATE_CALENDAR = '$API_ENDPOINT/v1/calendar';

class SignUpUsecase {
  SignUpUsecase({
    required Ref ref,
    required FlutterSecureStorage storage,
  })  : _ref = ref,
        _storage = storage;

  final Ref _ref;
  final FlutterSecureStorage _storage;

  Future<void> start() async {
    final account = _ref.watch(accountStatusProvider);
    final wa = _ref.watch(currentUserWalletProvider);

    if (wa == null) {
      throw Exception();
    }

    late String userId;
    userId = await _getUserIdByWalletAddress(wa);

    if (userId == '') {
      userId = await _createUser(account, wa);
    }
    final nonce = await _generateNonce(wa);
    final signature = await _requestSignature(wa, nonce);
    final jwt = await _generateJWT(wa, signature);

    // jwt を保持する
    final jwtVal = 'Bearer $jwt';
    await _storage.write(key: 'jwt', value: jwtVal);

    // 自分のカレンダーを作成する　OR 更新する
    final calendarId = await _createCalendar(jwtVal) as String;
    // Calendar IDを保持する
    await _storage.write(key: 'calendar_id', value: calendarId);
  }

  Future<String> _getUserIdByWalletAddress(String walletAddress) async {
    try {
      // /v1/wallet/{wallet_address}/user_id を呼び出す
      final url = Uri.parse(
        API_GET_USER_ID_BY_WA.replaceFirst(
          '{wallet_address}',
          walletAddress,
        ),
      );
      final headers = {'Content-Type': 'application/json'};
      final resp = await http.get(url, headers: headers);

      if (resp.statusCode == 200) {
        if (jsonDecode(resp.body)['user_id'] == null) {
          return '';
        } else {
          return jsonDecode(resp.body)['user_id'] as String;
        }
      }
      return '';
    } on Exception catch (err) {
      _ref.watch(loggerProvider).e(err);
      return '';
    }
  }

  Future<String> _generateNonce(String walletAddress) async {
    try {
      // "/v1/auth/generate-nonce" を呼び出す
      final url = Uri.parse(API_POST_GENERATE_NOUNCE);
      final headers = {'content-type': 'application/json'};
      final body = json.encode({'wallet_address': walletAddress});
      final resp = await http.post(url, headers: headers, body: body);
      if (resp.statusCode == 200) {
        return jsonDecode(resp.body)['nonce'] as String;
      }
      return '';
    } on Exception catch (err) {
      _ref.watch(loggerProvider).e(err);
      rethrow;
    }
  }

  Future<String> _requestSignature(String wa, String nonce) async {
    try {
      // メッセージを署名する
      final account = await w3.ethereum?.requestAccount();
      if (w3.Ethereum.isSupported && wa == account?.first) {
        String? signature = await _ref
            .read(web3ConnectUsecaseProvider)
            .requestMetamaskSignature(wa, nonce);

        return signature ?? '';
      } else {
        return _ref
            .read(web3ConnectUsecaseProvider)
            .requestSignature(wa, nonce);
      }
    } on Exception catch (err) {
      _ref.watch(loggerProvider).e(err);
      rethrow;
    }
  }

  Future<String> _generateJWT(String walletAddress, String signature) async {
    try {
      // "/v1/auth/login" を呼び出す
      final url = Uri.parse(API_POST_LOGIN);
      final headers = {'content-type': 'application/json'};
      final body = json.encode({
        'wallet_address': walletAddress,
        'signature': signature,
      });

      final resp = await http.post(url, headers: headers, body: body);
      if (resp.statusCode == 200) {
        return json.decode(resp.body)['jwt'] as String;
      }
      return '';
    } on Exception catch (err) {
      _ref.watch(loggerProvider).e(err);
      rethrow;
    }
  }

  Future<String> _createUser(AccountStatus account, String wa) async {
    try {
      // "/v1/user" を呼び出す
      final url = Uri.parse(API_POST_CREATE_USER);
      final headers = {'content-type': 'application/json'};
      final body = json.encode({
        'wallet_address': wa,
        'nickname': account.nickName,
        'email': account.email,
      });
      final resp = await http.post(url, headers: headers, body: body);
      if (resp.statusCode == 201) {
        return jsonDecode(resp.body)['id_info']['value'] as String;
      }
      return '';
    } on Exception catch (err) {
      _ref.watch(loggerProvider).e(err);
      rethrow;
    }
  }

  Future<String> _createCalendar(String jwt) async {
    try {
      final calendars = _ref.watch(calendarProvider);
      final googleCalendars = calendars.google;

      // calendarを呼ぶ
      final url = Uri.parse(API_POST_CREATE_CALENDAR);
      final headers = {
        'content-type': 'application/json',
        'Authorization': jwt
      };

      final body = json.encode({
        'google_calendars': [
          {
            'email': googleCalendars[0].email,
            'access_token': googleCalendars[0].token,
          }
        ],
        'outlook_calendars': <String>[],
        'ics_contents': calendars.icalendar
      });

      late String calendarId;

      final resp = await http.post(url, headers: headers, body: body);
      if (resp.statusCode == 200) {
        calendarId = jsonDecode(resp.body)['calendar_id'] as String;
      } else {
        throw Exception();
      }

      return calendarId;
    } on Exception catch (err) {
      _ref.watch(loggerProvider).e(err);
      rethrow;
    }
  }
}
