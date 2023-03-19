import 'package:flutter/material.dart';
import 'package:hooks_riverpod/hooks_riverpod.dart';
import 'package:time_dex/constants/enums.dart';
import 'package:time_dex/constants/ui.dart';

class ContentsUserSetting extends HookConsumerWidget {
  const ContentsUserSetting({super.key});

  @override
  Widget build(BuildContext context, WidgetRef ref) {
    final size = MediaQuery.of(context).size;
    final breakpoint = ResponsiveBreakpoint.values.from(size.width);

    if (breakpoint.isDesktop) {
      return Container(
        alignment: Alignment.topCenter,
        width: size.width - sidebarWidth,
        child: Column(
          children: const [
            Expanded(
              child: Center(
                child: Text('is desktop'),
              ),
            ),
            SizedBox(height: 12),
          ],
        ),
      );
    } else if (breakpoint.isTablet) {
      return SizedBox(
        width: size.width - sidebarWidth,
        child: Column(
          children: const [
            Expanded(
              child: Center(
                child: Text('is tablet'),
              ),
            ),
            SizedBox(height: 12),
          ],
        ),
      );
    } else {
      return SizedBox(
        width: size.width,
        child: Column(
          children: [
            Container(
              alignment: Alignment.topCenter,
              child: const Center(
                child: Text('is mobile'),
              ),
            ),
            const SizedBox(height: 12),
          ],
        ),
      );
    }
  }
}
