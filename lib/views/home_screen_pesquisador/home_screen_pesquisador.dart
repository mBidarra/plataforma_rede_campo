import 'package:flutter/material.dart';
import 'package:plataforma_rede_campo/components/bottom%20panel/botton%20panel.dart';

import '../../components/navigation_bar/navigation_barra.dart';

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
          SizedBox(
            height: 145,
          ),
          Text(
            "Bem-vindo pesquisador.",
            textAlign: TextAlign.center,
            style: TextStyle(
                fontSize: 56,
                fontWeight: FontWeight.w600,
                fontFamily: "Chillax"),
          ),
          SizedBox(
            height: 48,
          ),
          Text(
            "O que deseja fazer?",
            textAlign: TextAlign.center,
            style: TextStyle(
                fontSize: 45,
                fontWeight: FontWeight.w500,
                fontFamily: "SF Pro Text"),
          ),
          SizedBox(
            height: 85,
          ),
          Row(
            mainAxisAlignment: MainAxisAlignment.spaceEvenly,
            children: [
              SizedBox(
                height: 407,
                width: 703,
                child: Card(
                  color: const Color.fromRGBO(217, 217, 217, 1),
                  shape: RoundedRectangleBorder(
                    borderRadius: BorderRadius.circular(14),
                  ),
                  elevation: 0,
                ),
              ),
              SizedBox(
                height: 407,
                width: 703,
                child: Card(
                  color: const Color.fromRGBO(217, 217, 217, 1),
                  shape: RoundedRectangleBorder(
                    borderRadius: BorderRadius.circular(14),
                  ),
                  elevation: 0,
                ),
              ),
            ],
          ),
          SizedBox(
            height: 67,
          ),
          Row(
            mainAxisAlignment: MainAxisAlignment.spaceEvenly,
            children: [
              SizedBox(
                height: 245,
                width: 703,
                child: Card(
                  color: const Color.fromRGBO(217, 217, 217, 1),
                  shape: RoundedRectangleBorder(
                    borderRadius: BorderRadius.circular(14),
                  ),
                  elevation: 0,
                ),
              ),
              SizedBox(
                height: 245,
                width: 703,
                child: Card(
                  color: const Color.fromRGBO(217, 217, 217, 1),
                  shape: RoundedRectangleBorder(
                    borderRadius: BorderRadius.circular(14),
                  ),
                  elevation: 0,
                ),
              ),
            ],
          ),
          SizedBox(
            height: 67,
          ),
          BottonPanel(),
        ],
      ),
    );
  }
}
