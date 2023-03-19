import 'package:flutter/material.dart';
import 'package:flutter_hooks/flutter_hooks.dart';
import 'package:go_router/go_router.dart';
import 'package:hooks_riverpod/hooks_riverpod.dart';
import 'package:time_dex/constants/enums.dart';

class NavigatorTile extends HookConsumerWidget {
  const NavigatorTile(this.type, this.isFocused, {super.key});

  final SettingContentType type;
  final bool isFocused;

  @override
  Widget build(BuildContext context, WidgetRef ref) {
    final isHover = useState(false);
    return MouseRegion(
      onHover: (_) => isHover.value = true,
      onExit: (_) => isHover.value = false,
      child: ListTile(
        leading: Icon(type.icon),
        title: Text(
          type.title,
          style: Theme.of(context).textTheme.bodyLarge?.copyWith(
                color: isFocused
                    ? Theme.of(context).colorScheme.primary
                    : Theme.of(context).textTheme.bodyLarge?.color,
              ),
        ),
        selected: isFocused,
        selectedColor: Theme.of(context).colorScheme.primary,
        selectedTileColor: Theme.of(context).colorScheme.tertiary,
        onTap: () {
          context.go('/setting/${type.label}');
        },
      ),
    );
  }
}
