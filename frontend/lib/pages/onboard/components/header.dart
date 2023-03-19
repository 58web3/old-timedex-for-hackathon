import 'package:flutter/material.dart';
import 'package:flutter_hooks/flutter_hooks.dart';
import 'package:hooks_riverpod/hooks_riverpod.dart';
import 'package:time_dex/constants/ui.dart';

import '../states.dart';

class Header extends HookConsumerWidget {
  const Header(
    this.currentIndex, {
    super.key,
    required this.width,
    required this.steps,
  });
  final int currentIndex;
  final double width;
  final List<AccountSetupStatus> steps;

  @override
  Widget build(BuildContext context, WidgetRef ref) {
    return SizedBox(
      height: 204,
      width: width,
      child: Column(
        children: [
          Text(
            onboardHeader,
            style: Theme.of(context).textTheme.displaySmall,
          ),
          Container(height: 12),
          Stack(
            alignment: AlignmentDirectional.center,
            children: [
              Container(
                height: 6,
                width: width,
                color: Theme.of(context).colorScheme.primary,
              ),
              Row(
                mainAxisAlignment: MainAxisAlignment.spaceBetween,
                children: steps.map(labelBox).toList(),
              ),
            ],
          ),
          Container(height: 24),
          Text(
            steps[currentIndex - 1].message,
            style: Theme.of(context).textTheme.titleLarge,
          ),
        ],
      ),
    );
  }

  Widget labelBox(AccountSetupStatus step) {
    final context = useContext();
    return Container(
      width: 64,
      height: 64,
      decoration: BoxDecoration(
        color: step.index <= currentIndex
            ? Theme.of(context).colorScheme.primary
            : Theme.of(context).colorScheme.background,
        borderRadius: BorderRadius.circular(8),
        border: Border.all(
          width: 6,
          color: Theme.of(context).colorScheme.primary,
        ),
      ),
      child: Center(
        child: step.index < currentIndex
            ? Icon(
                Icons.check,
                size: 36,
                color: Theme.of(context).colorScheme.background,
              )
            : Text(
                step.index.toString(),
                style: Theme.of(context).textTheme.headlineSmall?.copyWith(
                      color: step.index <= currentIndex
                          ? Theme.of(context).colorScheme.background
                          : Theme.of(context).colorScheme.primary,
                    ),
              ),
      ),
    );
  }
}
