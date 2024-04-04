import 'package:flutter/material.dart';
import 'package:flutter_svg/flutter_svg.dart';

class AppIconButton extends StatelessWidget {
  const AppIconButton(
      {required this.height,
      required this.onTap,
      required this.path,
      super.key});

  final String path;
  final void Function() onTap;
  final double height;

  @override
  Widget build(BuildContext context) {
    return InkWell(
        onTap: onTap,
        child: SvgPicture.asset(
          path,
          height: height,
        ));
  }
}
