import 'dart:async';

import 'package:firebase_core/firebase_core.dart';
// import 'package:firebase_crashlytics/firebase_crashlytics.dart';
import 'package:flutter/material.dart';
import 'package:flutter_dotenv/flutter_dotenv.dart';
import 'package:flutter_web_plugins/flutter_web_plugins.dart';
import 'package:hooks_riverpod/hooks_riverpod.dart';
import 'package:shared_preferences/shared_preferences.dart';
import 'package:time_dex/constants/enums.dart';
import 'package:time_dex/constants/themes.dart';
import 'package:time_dex/global/providers.dart';
import 'package:time_dex/router.dart';

import 'firebase_options/firebase_options_dev.dart' as dev;
// import 'firebase_options/firebase_options_prod.dart' as prod;
// import 'firebase_options/firebase_options_stg.dart' as stg;

Future<ProviderContainer> _initializeProviders() async {
  // sharedPrefsのインスタンス生成
  final prefs = await SharedPreferences.getInstance();

  // flavorを環境変数からの取得
  final flavor = FlavorType.values.from(const String.fromEnvironment('FLAVOR'));

  final overrides = <Override>[
    sharedPrefsProvider.overrideWithValue(prefs),
    flavorProvider.overrideWithValue(flavor),
  ];

  // firebaseの初期化を事項
  await _initializeFirebase(flavor);
  final container = ProviderContainer(overrides: overrides);
  return container;
}

Future<void> _initializeFirebase(FlavorType flavor) async {
  switch (flavor) {
    case FlavorType.dev:
      await Firebase.initializeApp(
        options: dev.DefaultFirebaseOptions.currentPlatform,
      );
      break;
    case FlavorType.stg:
      throw UnimplementedError();

    case FlavorType.prod:
      throw UnimplementedError();
  }
}

Future<void> main() async {
  WidgetsFlutterBinding.ensureInitialized();

  // To load the .env file contents into dotenv.
  await dotenv.load(fileName: '.env');

  // Localization
  // await findSystemLocale();

  // URLに#を入れずにPathを表現
  setUrlStrategy(PathUrlStrategy());

  // Providerの初期化
  final container = await _initializeProviders();

  // runZonedGuarded(
  //   () {
  //     FlutterError.onError =
  //         FirebaseCrashlytics.instance.recordFlutterFatalError;
  //     runApp(
  //       UncontrolledProviderScope(
  //         container: container,
  //         child: const App(),
  //       ),
  //     );
  //   },
  //   FirebaseCrashlytics.instance.recordError,
  // );

  runApp(
    UncontrolledProviderScope(
      container: container,
      child: const App(),
    ),
  );
}

class App extends HookConsumerWidget {
  const App({super.key});

  @override
  Widget build(BuildContext context, WidgetRef ref) {
    final router = ref.watch(routerProvider);
    final flavor = ref.watch(flavorProvider);
    final themeMode = ref.watch(themeSelectorProvider);

    // Initialize application view with the router
    return MaterialApp.router(
      debugShowCheckedModeBanner: flavor.isDev,
      routeInformationParser: router.routeInformationParser,
      routeInformationProvider: router.routeInformationProvider,
      routerDelegate: router.routerDelegate,
      theme: themeMode == ThemeMode.light ? darkTheme : lightTheme,
      darkTheme: themeMode == ThemeMode.dark ? lightTheme : darkTheme,
      themeMode: themeMode,
    );
  }
}
