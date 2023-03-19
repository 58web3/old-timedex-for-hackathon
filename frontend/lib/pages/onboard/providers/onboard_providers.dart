import 'package:flutter_riverpod/flutter_riverpod.dart';
import 'package:time_dex/global/models.dart';

import '../states.dart';


final accountStatusProvider = StateProvider<AccountStatus>(
  (_) => const AccountStatus(),
);

final calendarProvider = StateProvider<CalendarData>(
  (_) => const CalendarData(),
);
