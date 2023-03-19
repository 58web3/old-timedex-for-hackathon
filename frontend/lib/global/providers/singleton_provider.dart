import 'package:dio/browser.dart';
import 'package:dio/dio.dart';
import 'package:firebase_crashlytics/firebase_crashlytics.dart';
import 'package:flutter_riverpod/flutter_riverpod.dart';
import 'package:flutter_secure_storage/flutter_secure_storage.dart';
import 'package:logger/logger.dart';
import 'package:shared_preferences/shared_preferences.dart';

// Local情報の一時保存先(SharedPreference)のシングルトンを提供
final sharedPrefsProvider =
    Provider<SharedPreferences>((_) => throw UnimplementedError());

// FirebaseのCrashlyticsのシングルトンを提供
final crashlyticsProvider =
    Provider<FirebaseCrashlytics>((_) => FirebaseCrashlytics.instance);

// SecureStorageのシングルトンを提供
final secureStorageProvider =
    Provider<FlutterSecureStorage>((_) => const FlutterSecureStorage());

// Loggingクライアントのシングルトンを提供
final loggerProvider = Provider<Logger>(
  (ref) => Logger(
    printer: PrettyPrinter(
      methodCount: 1,
      errorMethodCount: 5,
      printTime: true,
    ),
  ),
);

// Http通信クライアントのシングルトンを提供
final customDioProvider = Provider<Dio>((refs) => CustomDio());

class CustomDio with DioMixin implements Dio {
  @override
  set options(BaseOptions options) {
    // JSON形式での通信をpreset
    options
      ..contentType = 'application/json'
      ..connectTimeout = const Duration(seconds: 30)
      ..sendTimeout = const Duration(seconds: 30)
      ..receiveTimeout = const Duration(seconds: 30);
    super.options = options;
  }

  @override
  // WEBでの通信クライアントを指定
  HttpClientAdapter get httpClientAdapter => BrowserHttpClientAdapter();
}
