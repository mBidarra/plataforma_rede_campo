import 'package:flutter/material.dart';
import 'package:flutter_svg/svg.dart';
import 'package:plataforma_rede_campo/components/bottom%20panel/botton%20panel.dart';

class CadastroScreen extends StatelessWidget {
  const CadastroScreen({Key? key}) : super(key: key);

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      backgroundColor: Color.fromRGBO(239, 231, 231, 1),
      body: ListView(
        children: [
          Padding(
            padding: const EdgeInsets.only(top: 68, left: 55, right: 55),
            child: Row(
              mainAxisAlignment: MainAxisAlignment.spaceBetween,
              children: [
                Tooltip(
                  message: "Home",
                  child: InkWell(
                    onTap: () {},
                    child: SvgPicture.asset('icons/home.svg'),
                  ),
                ),
                Tooltip(
                  message: "Sair",
                  child: InkWell(
                    onTap: () {},
                    child: SvgPicture.asset('icons/sign_out.svg'),
                  ),
                ),
              ],
            ),
          ),
          BottonPanel(),
        ],
      ),
    );
  }
}
