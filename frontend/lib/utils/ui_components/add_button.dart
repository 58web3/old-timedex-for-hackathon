import 'package:flutter/material.dart';
import 'package:flutter_hooks/flutter_hooks.dart';

class AddButton extends HookWidget {
  const AddButton({super.key, required this.onPressed});

  final VoidCallback onPressed;

  @override
  Widget build(BuildContext context) {
    return SizedBox(
      width: 64,
      height: 64,
      child: OutlinedButton(
        onPressed: onPressed,
        style: addButtonStyle(context),
        child: Center(
          child: IconTheme(
            data: Theme.of(context).iconTheme.copyWith(
                  color: Theme.of(context).colorScheme.primary,
                  size: 48,
                ),
            child: const Icon(Icons.add),
          ),
        ),
      ),
    );
  }

  ButtonStyle addButtonStyle(BuildContext context) {
    final style = OutlinedButton.styleFrom(
      side: BorderSide(color: Theme.of(context).colorScheme.primary, width: 3),
      padding: EdgeInsets.zero,
    );

    return Theme.of(context).outlinedButtonTheme.style!.copyWith(
          side: style.side,
          padding: style.padding,
        );
  }
}
