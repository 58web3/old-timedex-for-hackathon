import 'package:flutter/material.dart';
import 'package:flutter/services.dart';
import 'package:flutter_hooks/flutter_hooks.dart';
import 'package:fluttertoast/fluttertoast.dart';
import 'package:hooks_riverpod/hooks_riverpod.dart';

class CopyableText extends HookConsumerWidget {
  const CopyableText(this.text, {super.key});

  final String text;

  @override
  Widget build(BuildContext context, WidgetRef ref) {
    final hover = useState(false);

    return GestureDetector(
      onTap: () async {
        await Clipboard.setData(ClipboardData(text: text));
        await Fluttertoast.showToast(
          msg: 'Copied!',
          toastLength: Toast.LENGTH_SHORT,
          gravity: ToastGravity.CENTER,
          backgroundColor: Theme.of(context).hoverColor,
          webBgColor: '0x5a5a5a',
        );
      },
      child: MouseRegion(
        onEnter: (_) => hover.value = true,
        onExit: (_) => hover.value = false,
        child: ColoredBox(
          color:
              hover.value ? Theme.of(context).hoverColor : Colors.transparent,
          child: Text(
            text,
            style: Theme.of(context).textTheme.labelLarge?.copyWith(
                  overflow: TextOverflow.ellipsis,
                ),
          ),
        ),
      ),
    );
  }
}
