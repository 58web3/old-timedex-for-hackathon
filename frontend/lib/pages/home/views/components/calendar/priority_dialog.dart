import 'package:flutter/material.dart';
import 'package:flutter_hooks/flutter_hooks.dart';
import 'package:hooks_riverpod/hooks_riverpod.dart';
import 'package:time_dex/constants/enums.dart';
import 'package:time_dex/utils/ui_components.dart';

class PriorityDialog extends HookConsumerWidget {
  const PriorityDialog(this.initialType, {super.key});
  final EventFilterType initialType;

  @override
  Widget build(BuildContext context, WidgetRef ref) {
    final screenWidth = MediaQuery.of(context).size.width;
    final screenHeight = MediaQuery.of(context).size.height;

    final selected = useState<EventFilterType>(initialType);

    return Stack(
      alignment: AlignmentDirectional.center,
      children: [
        SizedBox(
          width: screenWidth,
          height: screenHeight,
        ),
        Card(
          shape: RoundedRectangleBorder(
            borderRadius: BorderRadius.circular(8),
          ),
          child: SizedBox(
            width: 250,
            height: 132,
            child: Column(
              children: [
                Container(height: 12),
                SizedBox(
                  height: 64,
                  width: 200,
                  child: DropdownForm(
                    items: EventFilterType.values.toList(),
                    onChanged: (type) {
                      if (type != null) {
                        selected.value = type as EventFilterType;
                      }
                    },
                  ),
                ),
                Container(height: 12),
                PrimaryButton(
                  text: 'Confirm',
                  width: 100,
                  height: 32,
                  isSmall: true,
                  onPressed: () async {
                    Navigator.of(context).pop(selected.value);
                  },
                ),
                Container(height: 12),
              ],
            ),
          ),
        ),
      ],
    );
  }
}
