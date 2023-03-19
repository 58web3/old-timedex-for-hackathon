import 'package:flutter/material.dart';

class DisableButton extends StatelessWidget {
  const DisableButton({
    super.key,
    required this.onPressed,
    required this.text,
    this.leading,
    this.isLeadingLeft = false,
    this.prefix,
    this.suffix,
    this.width = 356,
    this.height = 68,
  });
  final VoidCallback? onPressed;
  final String text;
  final String? leading;
  final bool isLeadingLeft;
  final Icons? prefix;
  final Icons? suffix;
  final double width;
  final double height;

  @override
  Widget build(BuildContext context) {
    return SizedBox(
      width: width,
      height: height,
      child: ElevatedButton(
        onPressed: onPressed,
        style: ElevatedButton.styleFrom(
          backgroundColor: Theme.of(context).disabledColor,
        ),
        child: isLeadingLeft
            ? Stack(
                alignment: AlignmentDirectional.center,
                children: [
                  if (leading != null)
                    Positioned(
                      left: 12,
                      child: Image.asset(leading!, height: 24),
                    ),
                  Text(text),
                ],
              )
            : Row(
                mainAxisAlignment: MainAxisAlignment.center,
                children: [
                  if (leading != null) ...[
                    Image.asset(leading!, height: 24),
                    Container(width: 12),
                  ],
                  Text(text),
                ],
              ),
      ),
    );
  }
}
