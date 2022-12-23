import 'package:flutter/material.dart';
import 'package:flutter_svg/svg.dart';
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
          Container(
            height: 638,
            decoration: BoxDecoration(
              color: Color.fromRGBO(52, 61, 67, 1),
            ),
            child: Column(
              mainAxisSize: MainAxisSize.min,
              children: [
                Padding(
                  padding: EdgeInsets.symmetric(
                    vertical: 10,
                  ),
                  child: Text(
                    "Nossos Projetos",
                    style: TextStyle(
                      fontSize: 60,
                      fontWeight: FontWeight.w600,
                      color: Color.fromRGBO(255, 255, 255, 1),
                    ),
                  ),
                ),
                Padding(
                  padding: const EdgeInsets.symmetric(horizontal: 75),
                  child: Row(
                    mainAxisAlignment: MainAxisAlignment.spaceBetween,
                    children: [
                      ElevatedButton(
                        style: ElevatedButton.styleFrom(
                          backgroundColor: Color.fromRGBO(23, 42, 56, 1),
                          shape: CircleBorder(),
                          padding: EdgeInsets.all(20),
                        ),
                        onPressed: () {},
                        child: Padding(
                          padding: const EdgeInsets.only(right: 8.0),
                          child: Image.asset('icons/left.png'),
                        ),
                      ),
                      /*Container(
                        width: ,
                        child: ListView(
                          scrollDirection: Axis.horizontal,
                          children: [],
                        ),
                      ),*/
                      ElevatedButton(
                        style: ElevatedButton.styleFrom(
                          backgroundColor: Color.fromRGBO(23, 42, 56, 1),
                          shape: CircleBorder(),
                          padding: EdgeInsets.all(20),
                        ),
                        onPressed: () {},
                        child: Padding(
                          padding: const EdgeInsets.only(left: 8.0),
                          child: Image.asset(
                            'icons/rigth.png',
                          ),
                        ),
                      ),
                    ],
                  ),
                )
              ],
            ),
          ),
          Container(
            height: 587,
            decoration: BoxDecoration(
              color: Color.fromRGBO(217, 217, 217, 1),
            ),
            child: Column(
              children: [
                SizedBox(
                  height: 46,
                ),
                Text(
                  "Parceiros",
                  style: TextStyle(
                    fontSize: 60,
                    fontWeight: FontWeight.w600,
                    fontFamily: 'SF Pro Display',
                    color: Color.fromRGBO(28, 38, 50, 1),
                  ),
                ),
                Padding(
                  padding: const EdgeInsets.only(
                    left: 70,
                    right: 70,
                    top: 10,
                    bottom: 30,
                  ),
                  child: Row(
                    children: [
                      Image.asset('images/utfpr.png'),
                      Image.asset('images/idr-pr.png'),
                      Image.asset('images/utfpr.png'),
                    ],
                  ),
                )
              ],
            ),
          ),
          Container(
            height: 315,
            alignment: Alignment.center,
            decoration: BoxDecoration(
              color: Color.fromRGBO(52, 61, 67, 1),
            ),
            child: Column(
              mainAxisAlignment: MainAxisAlignment.end,
              children: [
                Row(
                  mainAxisAlignment: MainAxisAlignment.center,
                  children: [
                    GestureDetector(
                      onTap: () {},
                      child: Image.asset('icons/instagram.png'),
                    ),
                    SizedBox(
                      width: 17,
                    ),
                    GestureDetector(
                      onTap: () {},
                      child: Image.asset('icons/facebook.png'),
                    ),
                    SizedBox(
                      width: 17,
                    ),
                    GestureDetector(
                      onTap: () {},
                      child: SvgPicture.asset('icons/twitter.svg'),
                    ),
                  ],
                ),
                Container(
                  width: 783,
                  margin: EdgeInsets.symmetric(vertical: 14),
                  child: Column(
                    children: [
                      Text(
                        'Donec nec mi vitae eros pretium iaculis. Pellentesque consectetur sem nisl, a dignissim ipsum cursus vitae. Praesent lacinia, mi in dapibus accumsan.',
                        style: TextStyle(
                          color: Color.fromRGBO(134, 205, 47, 1),
                          fontWeight: FontWeight.w600,
                          fontSize: 25,
                          fontFamily: 'SF Pro Display',
                        ),
                      ),
                      Text(
                        'Santa helena | Paraná | Brasil',
                        style: TextStyle(
                          color: Color.fromRGBO(
                            214,
                            202,
                            202,
                            1,
                          ),
                          fontWeight: FontWeight.w600,
                          fontSize: 25,
                          fontFamily: 'SF Pro Display',
                        ),
                      ),
                    ],
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
