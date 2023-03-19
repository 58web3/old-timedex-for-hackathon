import 'package:flutter/material.dart';
import 'package:flutter_hooks/flutter_hooks.dart';
import 'package:flutter_use/flutter_use.dart';
import 'package:google_fonts/google_fonts.dart';
import 'package:hooks_riverpod/hooks_riverpod.dart';
import 'package:intl/intl.dart';
import 'package:time_dex/constants/enums.dart';

import '../../../providers.dart';
import '../../../state.dart';

class EventTime extends HookConsumerWidget {
  EventTime({this.width = 250, super.key});
  final double width;
  final GlobalKey<FormState> formKey = GlobalKey<FormState>();

  @override
  Widget build(BuildContext context, WidgetRef ref) {
    final dateState = ref.watch(calendarViewSettingProvider);
    final size = MediaQuery.of(context).size;
    final breakpoint = ResponsiveBreakpoint.values.from(size.width);

    final selectedStartDate = useState<DateTime>(dateState.focused!);
    final selectedEndDate = useState<DateTime>(
      dateState.focused!.add(const Duration(hours: 1)),
    );

    useEffectOnce(() {
      WidgetsBinding.instance.addPostFrameCallback((_) {
        selectedStartDate.addListener(() {
          ref.watch(addEventProvider.notifier).update(
                (state) => state.copyWith(start: selectedStartDate.value),
              );
        });
        selectedEndDate.addListener(() {
          ref.watch(addEventProvider.notifier).update(
                (state) => state.copyWith(end: selectedEndDate.value),
              );
        });
      });
      // return () async {
      //   selectedStartDate.dispose();
      //   selectedEndDate.dispose();
      // };
      return;
    });

    return Row(
      children: [
        IconTheme(
          data: Theme.of(context).iconTheme,
          child: const Icon(Icons.access_time),
        ),
        const SizedBox(width: 12),
        breakpoint.isMobile
            ? SizedBox(
                height: 64,
                child: Column(
                  children: [
                    startSelector(dateState, selectedStartDate),
                    endSelector(dateState, selectedEndDate),
                  ],
                ),
              )
            : SizedBox(
                height: 32,
                child: Row(
                  children: [
                    startSelector(dateState, selectedStartDate),
                    endSelector(dateState, selectedEndDate),
                  ],
                ),
              ),
      ],
    );
  }

  Widget startSelector(
    CalendarPreset dateState,
    ValueNotifier<DateTime> selectedStartDate,
  ) {
    final context = useContext();
    final hoverStartDate = useState(false);
    final hoverStartTime = useState(false);

    return Row(
      children: [
        dateSelector(
          hoverStartDate,
          selectedStartDate,
          dateState,
          context,
        ),
        const SizedBox(width: 4),
        timeSelector(
          hoverStartTime,
          selectedStartDate,
          dateState,
          context,
        ),
        const SizedBox(width: 4),
        const SizedBox(
          child: Center(
            child: Text('-'),
          ),
        ),
      ],
    );
  }

  Widget endSelector(
    CalendarPreset dateState,
    ValueNotifier<DateTime> selectedEndDate,
  ) {
    final context = useContext();
    final hoverEndDate = useState(false);
    final hoverEndTime = useState(false);

    return Row(
      children: [
        const SizedBox(width: 4),
        timeSelector(
          hoverEndTime,
          selectedEndDate,
          dateState,
          context,
        ),
        const SizedBox(width: 4),
        dateSelector(
          hoverEndDate,
          selectedEndDate,
          dateState,
          context,
        ),
      ],
    );
  }

  Widget dateSelector(
    ValueNotifier<bool> hoverState,
    ValueNotifier<DateTime> selected,
    CalendarPreset dateState,
    BuildContext context,
  ) {
    return GestureDetector(
      onTap: () async {
        final picked = await showDatePicker(
          context: context,
          initialDate: dateState.focused!,
          firstDate: dateState.first!,
          lastDate: dateState.last!,
          builder: (context, child) => datePickerTheme(context, child!),
        );
        if (picked != null) {
          selected.value = picked;
        }
      },
      child: MouseRegion(
        onEnter: (_) => hoverState.value = true,
        onExit: (_) => hoverState.value = false,
        child: Container(
          height: 20,
          padding: const EdgeInsets.symmetric(horizontal: 4),
          color: hoverState.value
              ? Theme.of(context).hoverColor
              : Colors.transparent,
          child: Center(
            child: Text(
              DateFormat('EE, MMM dd').format(
                selected.value,
              ),
              style: Theme.of(context).textTheme.bodyLarge,
            ),
          ),
        ),
      ),
    );
  }

  Widget timeSelector(
    ValueNotifier<bool> hoverState,
    ValueNotifier<DateTime> selected,
    CalendarPreset dateState,
    BuildContext context,
  ) {
    return GestureDetector(
      onTap: () async {
        final picked = await showTimePicker(
          context: context,
          initialTime: TimeOfDay.fromDateTime(dateState.focused!),
          builder: (context, child) => datePickerTheme(context, child!),
        );
        if (picked != null) {
          selected.value = selected.value.copyWith(
            hour: picked.hour,
            minute: picked.minute,
          );
        }
      },
      child: MouseRegion(
        onEnter: (_) => hoverState.value = true,
        onExit: (_) => hoverState.value = false,
        child: Container(
          height: 20,
          padding: const EdgeInsets.symmetric(horizontal: 4),
          color: hoverState.value
              ? Theme.of(context).hoverColor
              : Colors.transparent,
          child: Center(
            child: Text(
              DateFormat('HH:mm').format(
                selected.value,
              ),
              style: Theme.of(context).textTheme.bodyLarge,
            ),
          ),
        ),
      ),
    );
  }

  Widget datePickerTheme(BuildContext context, Widget child) {
    return Theme(
      data: ThemeData.light().copyWith(
        textTheme: Typography.material2021().black.copyWith(
              displayLarge: GoogleFonts.ibmPlexSansJp(
                color: Colors.black,
                fontSize: 40,
                fontWeight: FontWeight.bold,
              ),
              displayMedium: GoogleFonts.ibmPlexSansJp(
                color: Colors.black,
                fontSize: 40,
                fontWeight: FontWeight.bold,
              ),
              displaySmall: GoogleFonts.ibmPlexSansJp(
                color: Colors.black,
                fontSize: 40,
                fontWeight: FontWeight.bold,
              ),
              headlineLarge: GoogleFonts.ibmPlexSansJp(
                color: Colors.black,
                fontSize: 20,
                fontWeight: FontWeight.bold,
              ),
              headlineMedium: GoogleFonts.ibmPlexSansJp(
                color: Colors.black,
                fontSize: 20,
              ),
              headlineSmall: GoogleFonts.ibmPlexSansJp(
                color: Colors.black,
                fontSize: 20,
              ),
              titleLarge: GoogleFonts.ibmPlexSansJp(
                color: Colors.black,
                fontSize: 16,
              ),
              titleMedium: GoogleFonts.ibmPlexSansJp(
                color: Colors.black,
                fontSize: 16,
              ),
              titleSmall: GoogleFonts.ibmPlexSansJp(
                color: Colors.black,
                fontSize: 16,
              ),
            ),
      ),
      child: child,
    );
  }
}
