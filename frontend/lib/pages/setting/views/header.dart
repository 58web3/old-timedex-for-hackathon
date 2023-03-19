import 'package:flutter/material.dart';
import 'package:go_router/go_router.dart';
import 'package:time_dex/constants/ui.dart';

class Header extends AppBar {
  Header(
    this.context, {
    super.key,
    required this.isMobile,
    required this.scaffoldKey,
  }) : super(
          elevation: 0,
          toolbarHeight: 60,
          titleSpacing: 0,
          backgroundColor: Colors.transparent,
          shape: Border(
            bottom: BorderSide(
              color: Theme.of(context).dividerColor,
              width: 5,
            ),
          ),
          title: isMobile
              ? Text(
                  'Setting',
                  style: Theme.of(context).textTheme.headlineSmall,
                )
              : SizedBox(
                  width: sidebarWidth - 120,
                  child: Center(
                    child: Text(
                      'Setting',
                      style: Theme.of(context).textTheme.headlineSmall,
                    ),
                  ),
                ),
          leading: IconTheme(
                  data: Theme.of(context).iconTheme,
                  child: IconButton(
                    onPressed: () => isMobile
                        ? scaffoldKey.currentState?.openDrawer()
                        : context.goNamed('home'),
                    icon: Icon(isMobile ? Icons.menu : Icons.home),
                  ),
                ),
          centerTitle: isMobile,
        );

  final BuildContext context;
  final bool isMobile;
  final GlobalKey<ScaffoldState> scaffoldKey;
}
