import 'package:flutter/material.dart';
import 'package:flutter_svg/flutter_svg.dart';

class RoundedLeftButton extends StatelessWidget {
  const RoundedLeftButton({Key? key, required this.onTap}) : super(key: key);

  final VoidCallback onTap;

  @override
  Widget build(BuildContext context) {
    return InkWell(
      onTap: onTap,
      focusColor: Colors.white54,
      hoverColor: Colors.white54,
      customBorder: RoundedRectangleBorder(
        borderRadius: BorderRadius.circular(90),
      ),
      child: SvgPicture.asset('icons/button_left.svg'),
    );
  }
}
