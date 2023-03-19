import 'package:flutter/material.dart';

class ActivationButton extends StatelessWidget {
  ActivationButton({
    super.key,
    required this.onPressed,
    required this.text,
    required this.isActivated,
    this.leading,
    this.isLeadingLeft = false,
    this.prefix,
    this.suffix,
    this.width = 356,
    this.height = 68,
    this.leadingSize = 24,
  }) {
    if (leading != null && prefix != null) {
      throw Exception();
    }
  }
  final VoidCallback? onPressed;
  final String text;
  final bool isActivated;
  final String? leading;
  final bool isLeadingLeft;
  final IconData? prefix;
  final IconData? suffix;
  final double width;
  final double height;
  final double leadingSize;

  @override
  Widget build(BuildContext context) {
    return SizedBox(
      width: width,
      height: height,
      child: OutlinedButton(
        style: isActivated ? null : inactivatedStyle(context),
        onPressed: onPressed,
        child: isLeadingLeft
            ? Stack(
                fit: StackFit.expand,
                alignment: AlignmentDirectional.center,
                children: [
                  if (leading != null)
                    Positioned(
                      left: 4,
                      child: Image.asset(leading!, height: leadingSize),
                    ),
                  if (prefix != null)
                    Positioned(
                      left: 4,
                      child: Icon(prefix),
                    ),
                  SizedBox(
                    child: Center(
                      child: Text(text),
                    ),
                  ),
                  if (suffix != null)
                    Positioned(
                      right: 4,
                      child: Icon(suffix),
                    ),
                ],
              )
            : Row(
                mainAxisAlignment: MainAxisAlignment.center,
                children: [
                  if (leading != null) ...[
                    Image.asset(leading!, height: leadingSize),
                    Container(width: 12),
                  ],
                  if (prefix != null) ...[
                    Icon(prefix),
                    Container(width: 12),
                  ],
                  Text(text),
                  if (suffix != null) ...[
                    Container(width: 12),
                    Icon(suffix),
                  ],
                ],
              ),
      ),
    );
  }

  ButtonStyle inactivatedStyle(BuildContext context) {
    final style = OutlinedButton.styleFrom(
      side: BorderSide(color: Theme.of(context).disabledColor, width: 3),
      foregroundColor: Theme.of(context).disabledColor,
      splashFactory: NoSplash.splashFactory,
    );
    return Theme.of(context).outlinedButtonTheme.style!.copyWith(
          side: style.side,
          foregroundColor: style.foregroundColor,
          splashFactory: style.splashFactory,
        );
  }
}
