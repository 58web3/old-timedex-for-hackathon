import 'package:flutter/material.dart';

class PrimaryButton extends StatelessWidget {
  const PrimaryButton({
    super.key,
    required this.onPressed,
    required this.text,
    this.leading,
    this.isLeadingLeft = false,
    this.prefix,
    this.suffix,
    this.width = 356,
    this.height = 68,
    this.isSmall = false,
    this.leadingHeight = 24,
  });
  final VoidCallback? onPressed;
  final String text;
  final String? leading;
  final bool isLeadingLeft;
  final Icons? prefix;
  final Icons? suffix;
  final double width;
  final double height;
  final bool isSmall;
  final double leadingHeight;

  @override
  Widget build(BuildContext context) {
    return SizedBox(
      width: width,
      height: height,
      child: ElevatedButton(
        style: isSmall ? smallButton(context) : null,
        onPressed: onPressed,
        child: isLeadingLeft
            ? Stack(
                alignment: AlignmentDirectional.center,
                children: [
                  if (leading != null)
                    Positioned(
                      left: 12,
                      child: Image.asset(leading!, height: leadingHeight),
                    ),
                  Text(text),
                ],
              )
            : Row(
                mainAxisAlignment: MainAxisAlignment.center,
                children: [
                  if (leading != null) ...[
                    Image.asset(leading!, height: leadingHeight),
                    Container(width: 12),
                  ],
                  Text(text),
                ],
              ),
      ),
    );
  }

  ButtonStyle smallButton(BuildContext context) {
    final style = ElevatedButton.styleFrom(
      textStyle: Theme.of(context).textTheme.bodyMedium,
    );
    return Theme.of(context).elevatedButtonTheme.style!.copyWith(
          textStyle: style.textStyle,
        );
  }
}
