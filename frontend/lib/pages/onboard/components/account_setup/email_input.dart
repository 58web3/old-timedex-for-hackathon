import 'package:flutter/material.dart';
import 'package:hooks_riverpod/hooks_riverpod.dart';
import 'package:time_dex/constants/ui.dart';
import 'package:time_dex/utils/ui_components.dart';

class EmailInput extends HookConsumerWidget {
  const EmailInput({
    super.key,
    required this.width,
    required this.onNameCompleted,
    required this.onEmailCompleted,
  });

  final double width;
  final void Function(String?) onNameCompleted;
  final void Function(String?) onEmailCompleted;

  @override
  Widget build(BuildContext context, WidgetRef ref) {
    return Builder(
      builder: (context) {
        return SizedBox(
          height: 480,
          width: width,
          child: Column(
            children: [
              Container(height: 48),
              PrimaryTextForm(
                hint: 'Nick name',
                onValidate: (value) {
                  if (value == null) {
                    return null;
                  }
                  final nameValid = value.length < 32;

                  if (!nameValid) {
                    return toLongName;
                  }

                  return null;
                },
                onEdited: onNameCompleted,
              ),
              Container(height: 48),
              PrimaryTextForm(
                hint: 'jane@timedex.io',
                onValidate: (value) {
                  if (value == null) {
                    return null;
                  }
                  final emailValid = RegExp(
                    emailValidator,
                  ).hasMatch(value);

                  if (!emailValid) {
                    return invalidEmail;
                  }

                  return null;
                },
                onEdited: onEmailCompleted,
              ),
            ],
          ),
        );
      },
    );
  }
}
