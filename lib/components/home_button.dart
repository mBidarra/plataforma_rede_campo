import 'package:flutter/material.dart';
import 'package:flutter_svg/svg.dart';
import 'package:plataforma_rede_campo/views/home_screen_pesquisador/home_screen_pesquisador.dart';

class HomeButton extends StatelessWidget {
  const HomeButton({Key? key}) : super(key: key);

  @override
  Widget build(BuildContext context) {
    return Tooltip(
      message: "Home",
      child: InkWell(
        onTap: () {
          Navigator.of(context).pushAndRemoveUntil(
              MaterialPageRoute(
                builder: (context) => HomeScreenPesquisador(),
              ),
              (route) => false);
        },
        child: SvgPicture.asset(
          'icons/home.svg',
        ),
      ),
    );
  }
}
