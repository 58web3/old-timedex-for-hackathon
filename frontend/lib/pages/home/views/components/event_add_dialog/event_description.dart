import 'dart:convert';

import 'package:flutter/material.dart';
import 'package:flutter_quill/flutter_quill.dart' hide Text;
import 'package:flutter_use/flutter_use.dart';
import 'package:hooks_riverpod/hooks_riverpod.dart';
import 'package:time_dex/constants/ui/ui_message.dart';

import '../../../providers.dart';

class EventDescription extends HookConsumerWidget {
  EventDescription({this.width = 250, super.key});
  final double width;
  final FocusNode _focusNode = FocusNode();

  @override
  Widget build(BuildContext context, WidgetRef ref) {
    final controller = QuillController.basic();
    useEffectOnce(() {
      controller.addListener(() {
        ref.read(addEventProvider.notifier).update(
              (state) => state.copyWith(
                description: jsonEncode(controller.document.toDelta().toJson()),
              ),
            );
      });
      return controller.dispose;
    });

    return Row(
      crossAxisAlignment: CrossAxisAlignment.start,
      children: [
        Padding(
          padding: const EdgeInsets.only(top: 4),
          child: IconTheme(
            data: Theme.of(context).iconTheme,
            child: const Icon(Icons.edit_note),
          ),
        ),
        const SizedBox(width: 12),
        SizedBox(
          width: width - 48,
          height: 240,
          child: MouseRegion(
            cursor: SystemMouseCursors.text,
            child: DecoratedBox(
              decoration: BoxDecoration(
                border: Border.all(
                  color: Theme.of(context).colorScheme.tertiary,
                  width: 3,
                ),
                borderRadius: const BorderRadius.all(Radius.circular(8)),
              ),
              child: Column(
                crossAxisAlignment: CrossAxisAlignment.start,
                children: [
                  Padding(
                    padding: const EdgeInsets.fromLTRB(3, 3, 0, 0),
                    child: QuillToolbar.basic(
                      iconTheme: QuillIconTheme(
                        iconUnselectedFillColor:
                            Theme.of(context).scaffoldBackgroundColor,
                      ),
                      toolbarSectionSpacing: 1,
                      controller: controller,
                      toolbarIconAlignment: WrapAlignment.start,
                      toolbarIconCrossAlignment: WrapCrossAlignment.start,
                      showDividers: false,
                      showFontFamily: false,
                      showFontSize: false,
                      showStrikeThrough: false,
                      showInlineCode: false,
                      showColorButton: false,
                      showBackgroundColorButton: false,
                      showLeftAlignment: false,
                      showCenterAlignment: false,
                      showRightAlignment: false,
                      showJustifyAlignment: false,
                      showHeaderStyle: false,
                      showListCheck: false,
                      showCodeBlock: false,
                      showQuote: false,
                      showIndent: false,
                      showUndo: false,
                      showRedo: false,
                      showSearchButton: false,
                    ),
                  ),
                  Divider(
                    color: Theme.of(context).colorScheme.tertiary,
                    thickness: 3,
                    height: 3,
                  ),
                  QuillEditor(
                    controller: controller,
                    scrollController: ScrollController(),
                    scrollable: true,
                    focusNode: _focusNode,
                    autoFocus: false,
                    readOnly: false,
                    minHeight: 160,
                    expands: false,
                    padding: const EdgeInsets.all(8),
                    placeholder: homeDialogDescriptionHint,
                    customStyles: DefaultStyles(
                      placeHolder: DefaultTextBlockStyle(
                        Theme.of(context).textTheme.titleSmall!.copyWith(
                              color: Theme.of(context).disabledColor,
                            ),
                        const VerticalSpacing(0, 0),
                        const VerticalSpacing(2, 0),
                        null,
                      ),
                    ),
                  ),
                ],
              ),
            ),
          ),
        ),
      ],
    );
  }
}
