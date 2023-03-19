import 'package:flutter/material.dart';

class SecondaryButton extends StatelessWidget {
  const SecondaryButton({
    super.key,
    required this.onPressed,
    required this.text,
    this.leading,
    this.isLeadingLeft = false,
    this.prefix,
    this.suffix,
    this.width = 356,
    this.height = 68,
    this.leadingSize = 24,
    this.isSmall = false,
  });
  final VoidCallback? onPressed;
  final String text;
  final String? leading;
  final bool isLeadingLeft;
  final IconData? prefix;
  final IconData? suffix;
  final double width;
  final double height;
  final double leadingSize;
  final bool isSmall;

  @override
  Widget build(BuildContext context) {
    final space = (isSmall ? 2 : 12).toDouble();

    return SizedBox(
      width: width,
      height: height,
      child: OutlinedButton(
        style: isSmall ? smallButton(context) : null,
        onPressed: onPressed,
        child: isLeadingLeft
            ? Stack(
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
                      child: Icon(prefix, size: leadingSize),
                    ),
                  SizedBox(
                    child: Center(
                      child: Text(text),
                    ),
                  ),
                  if (suffix != null)
                    Positioned(
                      right: 4,
                      child: Icon(suffix, size: leadingSize),
                    ),
                ],
              )
            : Row(
                mainAxisAlignment: MainAxisAlignment.center,
                children: [
                  if (leading != null) ...[
                    Image.asset(leading!, height: leadingSize),
                    Container(width: space),
                  ],
                  if (prefix != null) ...[
                    Icon(prefix, size: leadingSize),
                    Container(width: space),
                  ],
                  Text(text),
                  if (suffix != null) ...[
                    Container(width: space),
                    Icon(suffix, size: leadingSize),
                  ],
                ],
              ),
      ),
    );
  }

  ButtonStyle smallButton(BuildContext context) {
    final style = OutlinedButton.styleFrom(
      side: BorderSide(color: Theme.of(context).colorScheme.primary, width: 3),
      textStyle: Theme.of(context).textTheme.bodyMedium,
    );
    return Theme.of(context).outlinedButtonTheme.style!.copyWith(
          side: style.side,
          textStyle: style.textStyle,
        );
  }
}
