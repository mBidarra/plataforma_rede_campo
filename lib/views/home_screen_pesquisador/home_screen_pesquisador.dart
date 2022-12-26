import 'package:flutter/material.dart';
import 'package:flutter_svg/svg.dart';
import 'package:plataforma_rede_campo/components/bottom%20panel/botton%20panel.dart';
import 'package:plataforma_rede_campo/views/home_screen_pesquisador/components/bottom_button.dart';

import '../../components/navigation_bar/navigation_barra.dart';
import 'components/top_button.dart';

class HomeScreenPesquisador extends StatelessWidget {
  const HomeScreenPesquisador({Key? key}) : super(key: key);

  @override
  Widget build(BuildContext context) {
    final screenSize = MediaQuery.of(context).size;

    return Scaffold(
      backgroundColor: const Color.fromRGBO(239, 231, 231, 1),
      body: ListView(
        children: [
          Container(
            decoration: BoxDecoration(
              image: DecorationImage(
                image: AssetImage("images/header2.png"),
                fit: BoxFit.cover,
              ),
            ),
            height: 390,
            width: screenSize.width,
            child: Stack(
              children: const [
                Align(
                  alignment: Alignment.center,
                  child: Text(
                    "Rede Campo",
                    style: TextStyle(
                        fontFamily: 'Chillax',
                        color: Color.fromRGBO(41, 208, 78, 1),
                        fontSize: 100,
                        fontWeight: FontWeight.w700),
                  ),
                ),
                Align(
                  alignment: Alignment.bottomCenter,
                  child: NavigationBarra(),
                )
              ],
            ),
          ),
          Stack(
            children: [
              Column(
                children: [
                  const SizedBox(
                    height: 145,
                  ),
                  const Text(
                    "Bem-vindo pesquisador.",
                    textAlign: TextAlign.center,
                    style: TextStyle(
                        fontSize: 56,
                        fontWeight: FontWeight.w600,
                        fontFamily: "Chillax"),
                  ),
                  const SizedBox(
                    height: 48,
                  ),
                  const Text(
                    "O que deseja fazer?",
                    textAlign: TextAlign.center,
                    style: TextStyle(
                      fontSize: 45,
                      fontWeight: FontWeight.w500,
                      //fontFamily: "SF Pro Text",
                    ),
                  ),
                  const SizedBox(
                    height: 85,
                  ),
                  Row(
                    mainAxisAlignment: MainAxisAlignment.center,
                    children: [
                      TopButton(text: 'novo projeto', onTap: () {}),
                      const SizedBox(
                        width: 60,
                      ),
                      TopButton(text: 'nova notícia', onTap: () {}),
                    ],
                  ),
                  const SizedBox(
                    height: 67,
                  ),
                  Row(
                    mainAxisAlignment: MainAxisAlignment.center,
                    children: [
                      BottonButton(
                        text: 'Editar projetos',
                        onTap: () {},
                      ),
                      const SizedBox(
                        width: 60,
                      ),
                      BottonButton(
                        text: 'Editar noticias',
                        onTap: () {},
                      ),
                    ],
                  ),
                  const SizedBox(
                    height: 67,
                  ),
                ],
              ),
              Align(
                alignment: Alignment.topRight,
                child: Padding(
                  padding: const EdgeInsets.only(
                    top: 100,
                    right: 72,
                  ),
                  child: Row(
                    mainAxisAlignment: MainAxisAlignment.end,
                    crossAxisAlignment: CrossAxisAlignment.center,
                    children: [
                      InkWell(
                        child: SvgPicture.asset(
                          'icons/account_settings.svg',
                          alignment: Alignment.center,
                        ),
                      ),
                      SizedBox(
                        width: 32,
                      ),
                      InkWell(
                        child: SvgPicture.asset('icons/sign_out.svg'),
                      )
                    ],
                  ),
                ),
              ),
            ],
          ),
          BottonPanel(),
        ],
      ),
    );
  }
}
