import 'package:flutter/material.dart';
import 'package:flutter_svg/svg.dart';

class FAB extends StatelessWidget {
  final String fileName;
  final void Function() onTap;
  final double? height;
  final Offset? offset;
  const FAB({
    super.key,
    required this.onTap,
    required this.fileName,
    this.offset,
    this.height,
  });

  @override
  Widget build(BuildContext context) {
    return Transform.translate(
      offset: offset ?? const Offset(0, 0),
      child: Padding(
        padding: const EdgeInsets.only(bottom: 13.0),
        child: GestureDetector(
          onTap: onTap,
          child: SvgPicture.asset(
            fileName,
            width: height ?? 35,
          ),
        ),
      ),
    );
  }
}
