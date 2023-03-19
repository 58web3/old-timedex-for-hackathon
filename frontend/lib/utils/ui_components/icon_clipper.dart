import 'package:flutter/material.dart';

class IconClipper extends StatelessWidget {
  const IconClipper(this.iconUrl, {this.size, this.border, super.key});

  final String iconUrl;
  final double? size;
  final Color? border;

  @override
  Widget build(BuildContext context) {
    return Container(
      width: size ?? 56,
      height: size ?? 56,
      decoration: BoxDecoration(
        borderRadius: BorderRadius.circular(
          (size == null ? 8.0 : size! / 7) + 2.5,
        ),
        border: border != null ? Border.all(color: border!, width: 2.5) : null,
      ),
      child: ClipRRect(
        borderRadius: BorderRadius.all(
          Radius.circular(size == null ? 8.0 : size! / 7),
        ),
        child: Stack(
          children: [
            iconUrl.isEmpty
                ? Container(
                    width: size ?? 56,
                    height: size ?? 56,
                    color: Theme.of(context).canvasColor,
                  )
                : SizedBox(
                    width: size ?? 56,
                    height: size ?? 56,
                    child: Image.network(iconUrl),
                  ),
          ],
        ),
      ),
    );
  }
}
