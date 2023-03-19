import 'package:flutter/material.dart';
import 'package:flutter_hooks/flutter_hooks.dart';
import 'package:hooks_riverpod/hooks_riverpod.dart';
import 'package:time_dex/constants/enums.dart';
import 'package:time_dex/constants/ui.dart';

class ResponsiveContents {
  const ResponsiveContents({
    required this.header,
    required this.sideBar,
    required this.main,
  });

  final PreferredSizeWidget header;
  final Widget sideBar;
  final Widget main;
}

class ResponsivePageBase extends HookConsumerWidget {
  ResponsivePageBase({
    super.key,
    required this.desktop,
    this.tablet,
    this.mobile,
    this.floatingActionButton,
  });

  final ResponsiveContents desktop;
  final ResponsiveContents? tablet;
  final ResponsiveContents? mobile;
  final FloatingActionButton? floatingActionButton;
  final GlobalKey<ScaffoldState> _scaffoldKey = GlobalKey<ScaffoldState>();

  @override
  Widget build(BuildContext context, WidgetRef ref) {
    final size = MediaQuery.of(context).size;
    final breakpoint = ResponsiveBreakpoint.values.from(size.width);

    return Scaffold(
      key: _scaffoldKey,
      appBar: header(breakpoint),
      drawer: breakpoint.isMobile
          ? SizedBox(
              width: sidebarWidth,
              child: Drawer(
                child: mobile?.sideBar ?? desktop.sideBar,
              ),
            )
          : null,
      body: Row(
        children: [
          if (breakpoint.isDesktop) desktop.sideBar,
          if (breakpoint.isTablet) tablet?.sideBar ?? desktop.sideBar,
          mainContents(breakpoint),
        ],
      ),
      floatingActionButton: floatingActionButton,
    );
  }

  PreferredSizeWidget header(ResponsiveBreakpoint breakpoint) {
    PreferredSizeWidget? header;
    if (breakpoint.isTablet) {
      header = mobile?.header;
    }
    if (breakpoint.isMobile) {
      header = tablet?.header;
    }
    return header ?? desktop.header;
  }

  Widget mainContents(ResponsiveBreakpoint breakpoint) {
    final context = useContext();
    final size = MediaQuery.of(context).size;

    if (breakpoint.isDesktop) {
      return Container(
        alignment: Alignment.topCenter,
        width: size.width - sidebarWidth,
        child: Column(
          children: [
            desktop.main,
            const SizedBox(height: 12),
          ],
        ),
      );
    } else if (breakpoint.isTablet) {
      return SizedBox(
        width: size.width - sidebarWidth,
        child: Column(
          children: [
            tablet?.main ?? desktop.main,
            const SizedBox(height: 12),
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
              child: mobile?.main ?? desktop.main,
            ),
            const SizedBox(height: 12),
          ],
        ),
      );
    }
  }
}
