import 'package:firebase_analytics/firebase_analytics.dart';
import 'package:flutter/material.dart';
import 'package:flutter_riverpod/flutter_riverpod.dart';
import 'package:go_router/go_router.dart';
import 'package:time_dex/pages/pages.dart';

import 'constants/enums.dart';
import 'pages/demo/demo.dart';
import 'pages/demo/story_alice/mock_data_alice.dart';

// RouterをProviderとして提供
final routerProvider = Provider(
  (ref) => GoRouter(
    initialLocation: '/setting/team',
    observers: [
      FirebaseAnalyticsObserver(analytics: FirebaseAnalytics.instance),
    ],
    routes: [
      GoRoute(
        name: 'signup',
        path: '/signup',
        builder: (context, state) => const Signup(),
      ),
      GoRoute(
        name: 'onboard',
        path: '/onboard',
        builder: (context, state) => const Onboard(),
      ),
      GoRoute(
        name: 'home',
        path: '/home',
        builder: (context, state) => Home(),
      ),
      GoRoute(
        name: 'setting',
        path: '/setting/:pageContentsId',
        pageBuilder: (context, state) {
          final pageContents = SettingContentType.values.from(
            state.params['pageContentsId'] ?? 'user',
          );

          return MaterialPage(
            key: state.pageKey,
            child: Setting(
              contents: pageContents,
            ),
          );
        },
      ),
      // DEMO
      GoRoute(
        path: '/home/:user',
        pageBuilder: (context, state) {
          final user = state.params['user'];

          if (user == 'alice') {
            return MaterialPage(
              key: state.pageKey,
              child: AliceHome(),
            );
          } else if (user == 'bob') {
            return MaterialPage(
              key: state.pageKey,
              child: BobHome(),
            );
          } else if (user == 'carol') {
            return MaterialPage(
              key: state.pageKey,
              child: CarolHome(),
            );
          } else {
            return MaterialPage(
              key: state.pageKey,
              child: Home(),
            );
          }
        },
      ),
      GoRoute(
        path: '/setting/alice/:pageContentsId',
        pageBuilder: (context, state) {
          final pageContents = SettingContentType.values.from(
            state.params['pageContentsId'] ?? 'user',
          );

          return MaterialPage(
            key: state.pageKey,
            child: AliceSetting(
              contents: pageContents,
            ),
          );
        },
      ),
      GoRoute(
        path: '/setting/carol/:pageContentsId',
        pageBuilder: (context, state) {
          final pageContents = SettingContentType.values.from(
            state.params['pageContentsId'] ?? 'user',
          );

          return MaterialPage(
            key: state.pageKey,
            child: CarolSetting(
              contents: pageContents,
            ),
          );
        },
      ),
      // DEMO
    ],
    errorBuilder: (context, state) => const Error(),
    redirect: (context, state) async {
      // final demoState = ref.watch(demoStateProvider);
      // if (demoState == 0) {
      //   if (state.subloc.contains('setting')) {
      //     if (state.subloc == '/setting/alice/team') {
      //       return null;
      //     }
      //     return '/setting/alice/team';
      //   } else {
      //     return '/home/alice';
      //   }
      // }

      // if (demoState == 1 && state.subloc != '/setting/alice/team') {
      //   return '/setting/alice/team';
      // }
      // if (demoState == 2 && state.subloc != '/home/alice') {
      //   return '/home/alice';
      // }
      return null;
    },
  ),
);
