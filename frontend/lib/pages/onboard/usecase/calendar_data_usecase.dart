import 'package:flutter_riverpod/flutter_riverpod.dart';
import 'package:google_sign_in/google_sign_in.dart';
import 'package:googleapis/calendar/v3.dart' as gcal;
import 'package:time_dex/global/models.dart';
import 'package:time_dex/global/providers.dart';
import '../providers.dart';
import '../states.dart';

final calendarDataUseCaseProvider = Provider<CalendarDataUseCase>(
  (ref) => CalendarDataUseCase(ref: ref),
);

class CalendarDataUseCase {
  CalendarDataUseCase({
    required Ref ref,
  }) : _ref = ref;

  final Ref _ref;

  Future<void> callIcal(ICalendarData calendar) async {
    try {
      _ref.watch(calendarProvider.notifier).update(
            (s) => s.copyWith(icalendar: [...s.icalendar, calendar]),
          );
    } on Exception catch (err) {
      _ref.watch(loggerProvider).e(err);
      rethrow;
    }
  }

  Future<void> callGoogle() async {
    try {
      final googleSignIn = GoogleSignIn(
        scopes: [gcal.CalendarApi.calendarScope, 'openid'],
      );
      // isSignedInメソッドでサインイン済か否か確認
      final checkSignInResult = await googleSignIn.isSignedIn();
      late GoogleSignInAccount? account;

      // サインイン済の場合は、サインインのポップアップを出さずにサインイン処理する
      // ※iOSの場合はsignInSilentlyにしないと、毎回サインインのポップアップが出てしまうため
      if (checkSignInResult) {
        // account = await googleSignIn.signInSilently();
        final req = await googleSignIn.requestScopes(googleSignIn.scopes);
        account = googleSignIn.currentUser;
        if (!req) {
          await googleSignIn.disconnect();
          throw Exception('googleSignIn signInSilently');
        }
      } else {
        // サインインしていない場合は、ポップアップを出してサインイン処理
        account = await googleSignIn.signIn();

        // 返り値がnullだったら、サインインもしくは同意処理がキャンセルされたと判断し、
        // 例外処理を投げて、下方のcatchに飛ばす
        if (account == null) {
          throw Exception('googleSignIn signIn');
        }
      }
      // final authCode = account?.serverAuthCode;
      final accessToken = (await account?.authentication)?.accessToken;

      final email = account?.email;
      if (accessToken == null || email == null) {
        throw Exception();
      }

      final calendar = GoogleCalendarData(
        email: email,
        token: accessToken,
      );
      _ref.watch(calendarProvider.notifier).update(
            (s) => s.copyWith(google: [...s.google, calendar]),
          );
    } on Exception catch (err) {
      _ref.watch(loggerProvider).e(err);
      rethrow;
    }
  }

  // TODO(yodai-hi): MicrosoftのAPI　DOCを確認
  Future<List<CalendarEventDetail>> callOutlook() async {
    try {
      return [];
    } on Exception catch (err) {
      _ref.watch(loggerProvider).e(err);
      return [];
    }
  }
}
