import 'package:flutter/material.dart';
import 'package:flutter_hooks/flutter_hooks.dart';
import 'package:hooks_riverpod/hooks_riverpod.dart';

class PrimaryTextForm extends HookConsumerWidget {
  PrimaryTextForm({
    super.key,
    this.focus,
    this.initialText = '',
    this.hint,
    this.onValidate,
    this.isDense = true,
    this.isClear = false,
    this.isTapOutside = true,
    required this.onEdited,
    this.onAsyncTask,
  });

  final formKey = GlobalKey<FormState>();

  final String initialText;
  final String? hint;
  final FocusNode? focus;
  final String? Function(String?)? onValidate;
  final bool isDense;
  final bool isClear;
  final bool isTapOutside;
  final void Function(String?) onEdited;
  final Future<void> Function(String)? onAsyncTask;

  @override
  Widget build(BuildContext context, WidgetRef ref) {
    final controller = useTextEditingController(text: initialText);

    return Form(
      key: formKey,
      child: TextFormField(
        focusNode: focus,
        controller: controller,
        validator: onValidate,
        decoration: InputDecoration(
          isDense: isDense,
          contentPadding: isDense
              ? const EdgeInsets.symmetric(
                  vertical: 24,
                  horizontal: 24,
                )
              : null,
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
        onFieldSubmitted: (value) async {
          if (onAsyncTask != null) {
            await onAsyncTask!(value);
          }

          if (formKey.currentState?.validate() ?? false) {
            onEdited(value);
            if (isClear) {
              controller.clear();
            }
          } else {
            onEdited(null);
          }
        },
        onTapOutside: (event) {
          if (!isTapOutside) {
            return;
          }

          if (formKey.currentState?.validate() ?? false) {
            onEdited(controller.text);
            if (isClear) {
              controller.clear();
            }
          } else {
            onEdited(null);
          }
        },
      ),
    );
  }
}
