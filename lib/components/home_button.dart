import 'package:flutter/material.dart';
import 'package:flutter_svg/svg.dart';

class HomeButton extends StatelessWidget {
  const HomeButton({Key? key}) : super(key: key);

  @override
  Widget build(BuildContext context) {
    return Tooltip(
      message: "Home",
      child: InkWell(
        onTap: () {},
        child: SvgPicture.asset(
          'icons/home.svg',
        ),
      ),
    );
  }
}
