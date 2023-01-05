import 'package:flutter/material.dart';
import '../../components/bottom panel/botton panel.dart';
import '../../components/navigation_bar/navigation_barra.dart';
import '../../models/news.dart';

class NewsScreen extends StatelessWidget {
  const NewsScreen({Key? key, required this.news}) : super(key: key);

  final News news;

  @override
  Widget build(BuildContext context) {
    final screenSize = MediaQuery.of(context).size;

    return Scaffold(
      backgroundColor: const Color.fromRGBO(255, 255, 255, 1),
      body: ListView(
        children: [
          Container(
            decoration: const BoxDecoration(
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
                    style:
                        TextStyle(fontFamily: 'Chillax', color: Color.fromRGBO(41, 208, 78, 1), fontSize: 100, fontWeight: FontWeight.w700),
                  ),
                ),
                Align(
                  alignment: Alignment.bottomCenter,
                  child: NavigationBarra(),
                )
              ],
            ),
          ),
          const BottonPanel(),
        ],
      ),
    );
  }
}
