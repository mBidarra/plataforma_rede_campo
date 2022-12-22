import 'package:flutter/material.dart';
import 'package:plataforma_rede_campo/components/navigation_bar/navigation_barra.dart';

class HomeScreen extends StatelessWidget {
  HomeScreen({Key? key}) : super(key: key);

  @override
  Widget build(BuildContext context) {
    final screenSize = MediaQuery.of(context).size;

    return Scaffold(
      body: ListView(
        children: [
          Container(
            decoration: BoxDecoration(
              image: DecorationImage(
                image: AssetImage("images/header.png"),
                fit: BoxFit.cover,
              ),
            ),
            height: 390,
            width: screenSize.width,
            child: Stack(
              children: [
                /*Image.asset(
                  'images/Header.png',
                  fit: BoxFit.cover,
                ),*/
                const Align(
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
                  child: NavigationBarra(

                      /*: [
                      NavigationBarButton(
                        label: '',
                        onTap: () {},
                      ),
                      NavigationBarButton(
                        label: '',
                        onTap: () {},
                      ),
                      NavigationBarButton(
                        label: '',
                        onTap: () {},
                      ),
                      NavigationBarButton(
                        label: '',
                        onTap: () {},
                      ),
                    ],*/
                      ),
                )
              ],
            ),
          )
        ],
      ),
    );
  }
}
