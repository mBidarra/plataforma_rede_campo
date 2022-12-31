import 'package:flutter/material.dart';
import 'package:plataforma_rede_campo/components/bottom%20panel/botton%20panel.dart';
import 'package:plataforma_rede_campo/components/navigation_bar/navigation_barra.dart';
import 'package:plataforma_rede_campo/components/parceiros_panel/parceiros_panel.dart';

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
                      fontWeight: FontWeight.w700,
                    ),
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
            height: 1128,
            decoration: BoxDecoration(
              color: Color.fromRGBO(52, 61, 67, 1),
            ),
            child: Column(
              crossAxisAlignment: CrossAxisAlignment.stretch,
              children: [
                Padding(
                  padding: const EdgeInsets.symmetric(horizontal: 307),
                  child: Column(
                    crossAxisAlignment: CrossAxisAlignment.center,
                    children: const [
                      SizedBox(
                        height: 56,
                      ),
                      Text(
                        'Quem somos?',
                        style: TextStyle(
                          fontSize: 60,
                          fontWeight: FontWeight.w600,
                          color: Color.fromRGBO(134, 205, 47, 1),
                          fontFamily: 'SF Pro Display',
                        ),
                      ),
                      SizedBox(
                        height: 59,
                      ),
                      Text(
                        'Pellentesque tincidunt felis eu orci porttitor fermentum. Donec nec mi vitae eros pretium iaculis. '
                        'Pellentesque consectetur sem nisl, a dignissim ipsum cursus vitae. Praesent lacinia, mi in dapibus accumsan, '
                        'nulla nisl finibus risus, non luctus elit libero ut purus. Integer eget pharetra nisi. Donec vel molestie enim. '
                        'Sed auctor, ligula sed congue tempus, ligula nisi aliquet eros, vitae iaculis arcu quam mattis ex. '
                        'Donec non dictum tortor, nec porttitor est. Nullam vitae rutrum ante, ut porta neque. In hac habitassed.',
                        textAlign: TextAlign.center,
                        style: TextStyle(
                          fontSize: 30,
                          fontWeight: FontWeight.w600,
                          fontFamily: 'SF Pro Display',
                          color: Color.fromRGBO(255, 255, 255, 1),
                        ),
                      ),
                    ],
                  ),
                ),
                Padding(
                  padding: const EdgeInsets.only(left: 90, top: 59, bottom: 59),
                  child: Text(
                    "Equipe",
                    textAlign: TextAlign.start,
                    style: TextStyle(
                      fontSize: 50,
                      fontWeight: FontWeight.w600,
                      fontFamily: 'SF Pro Display',
                      color: Color.fromRGBO(255, 255, 255, 1),
                    ),
                  ),
                ),
                Padding(
                  padding: const EdgeInsets.symmetric(horizontal: 206),
                  child: Row(
                    mainAxisAlignment: MainAxisAlignment.spaceBetween,
                    children: [
                      Column(
                        mainAxisSize: MainAxisSize.min,
                        children: [
                          CircleAvatar(
                            radius: 120,
                            backgroundImage: AssetImage('images/bri.png'),
                          ),
                          SizedBox(
                            height: 30,
                          ),
                          Text(
                            'Anderson',
                            style: TextStyle(
                              fontSize: 26,
                              fontWeight: FontWeight.w500,
                              fontFamily: 'SF Pro Display',
                              color: Color.fromRGBO(255, 255, 255, 1),
                            ),
                          ),
                        ],
                      ),
                      Column(
                        mainAxisSize: MainAxisSize.min,
                        children: [
                          CircleAvatar(
                            radius: 120,
                            backgroundImage: AssetImage('images/bri.png'),
                          ),
                          SizedBox(
                            height: 30,
                          ),
                          Text(
                            'Anderson',
                            style: TextStyle(
                              fontSize: 26,
                              fontWeight: FontWeight.w500,
                              fontFamily: 'SF Pro Display',
                              color: Color.fromRGBO(255, 255, 255, 1),
                            ),
                          ),
                        ],
                      ),
                      Column(
                        mainAxisSize: MainAxisSize.min,
                        children: [
                          CircleAvatar(
                            radius: 120,
                            backgroundImage: AssetImage('images/bri.png'),
                          ),
                          SizedBox(
                            height: 30,
                          ),
                          Text(
                            'Anderson',
                            style: TextStyle(
                              fontSize: 26,
                              fontWeight: FontWeight.w500,
                              fontFamily: 'SF Pro Display',
                              color: Color.fromRGBO(255, 255, 255, 1),
                            ),
                          ),
                        ],
                      ),
                      Column(
                        mainAxisSize: MainAxisSize.min,
                        children: [
                          CircleAvatar(
                            radius: 120,
                            backgroundImage: AssetImage('images/bri.png'),
                          ),
                          SizedBox(
                            height: 30,
                          ),
                          Text(
                            'Anderson',
                            style: TextStyle(
                              fontSize: 26,
                              fontWeight: FontWeight.w500,
                              fontFamily: 'SF Pro Display',
                              color: Color.fromRGBO(255, 255, 255, 1),
                            ),
                          ),
                        ],
                      ),
                    ],
                  ),
                )
              ],
            ),
          ),
          const ParceirosPanel(),
          const BottonPanel(),
        ],
      ),
    );
  }
}
