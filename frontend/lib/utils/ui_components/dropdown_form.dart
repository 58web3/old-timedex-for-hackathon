import 'package:flutter/material.dart';
import 'package:hooks_riverpod/hooks_riverpod.dart';

class DropdownForm extends HookConsumerWidget {
  const DropdownForm({
    super.key,
    required this.items,
    this.hint,
    required this.onChanged,
  });

  final List<Enum> items;
  final String? hint;

  final void Function(Enum?) onChanged;

  @override
  Widget build(BuildContext context, WidgetRef ref) {
    return DropdownButtonFormField<Enum>(
      style: Theme.of(context).textTheme.titleSmall,
      decoration: InputDecoration(
        enabledBorder: OutlineInputBorder(
          borderSide: BorderSide(
            color: Theme.of(context).colorScheme.tertiary,
            width: 3,
          ),
          borderRadius: const BorderRadius.all(Radius.circular(8)),
        ),
        focusedBorder: OutlineInputBorder(
          borderSide: BorderSide(
            color: Theme.of(context).colorScheme.primary,
            width: 3,
          ),
          borderRadius: const BorderRadius.all(Radius.circular(8)),
        ),
        errorBorder: OutlineInputBorder(
          borderSide: BorderSide(
            color: Theme.of(context).colorScheme.error,
            width: 3,
          ),
          borderRadius: const BorderRadius.all(Radius.circular(8)),
        ),
        focusedErrorBorder: OutlineInputBorder(
          borderSide: BorderSide(
            color: Theme.of(context).colorScheme.error,
            width: 3,
          ),
          borderRadius: const BorderRadius.all(Radius.circular(8)),
        ),
        hintText: hint,
        hintStyle: Theme.of(context).textTheme.titleSmall?.copyWith(
              color: Theme.of(context).disabledColor,
            ),
      ),
      isDense: false,

      menuMaxHeight: 250,
      dropdownColor: Theme.of(context).canvasColor,
      items: items
          .map(
            (type) => DropdownMenuItem<Enum>(
              value: type,
              child: Text(
                type.toString(),
                style: Theme.of(context).textTheme.titleSmall,
              ),
            ),
          )
          .toList(),
      onChanged: onChanged,
    );
  }
}
