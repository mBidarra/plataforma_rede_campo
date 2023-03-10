import 'package:flutter/material.dart';
import 'package:flutter_mobx/flutter_mobx.dart';
import 'package:plataforma_rede_campo/components/bottom%20panel/botton%20panel.dart';
import 'package:plataforma_rede_campo/components/navigation_bar/navigation_barra.dart';
import 'package:plataforma_rede_campo/components/parceiros_panel/parceiros_panel.dart';
import 'package:plataforma_rede_campo/stores/home_store.dart';
import 'package:plataforma_rede_campo/views/home_screen/components/news_tile.dart';

class HomeScreen extends StatelessWidget {
  HomeScreen({Key? key}) : super(key: key);

  HomeStore homeStore = HomeStore();

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
                    vertical: 50,
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
            decoration: const BoxDecoration(
              color: Color.fromRGBO(217, 217, 217, 1),
            ),
            child: Column(
              children: [
                Padding(
                  padding: const EdgeInsets.only(
                    top: 50,
                    bottom: 59,
                  ),
                  child: Text(
                    'Ultimas not??cias',
                    style: TextStyle(
                      fontSize: 60,
                      fontWeight: FontWeight.w600,
                      color: Color.fromRGBO(28, 38, 50, 1),
                    ),
                  ),
                ),
                SizedBox(
                  height: 713,
                  width: double.infinity,
                  child: Row(
                    mainAxisAlignment: MainAxisAlignment.center,
                    crossAxisAlignment: CrossAxisAlignment.start,
                    children: [
                      Column(
                        children: [
                          Container(
                            height: 383,
                            width: 721,
                            decoration: BoxDecoration(
                              color: Colors.red,
                            ),
                          ),
                        ],
                      ),
                      SizedBox(
                        width: 91,
                      ),
                      Observer(
                        builder: (context) => Container(
                          height: 667,
                          width: 713,
                          decoration: const BoxDecoration(
                            color: Color.fromRGBO(165, 159, 159, 0.26),
                            borderRadius: BorderRadius.all(
                              Radius.circular(19),
                            ),
                          ),
                          child: ListView.builder(
                            padding: const EdgeInsets.symmetric(vertical: 20),
                            scrollDirection: Axis.vertical,
                            shrinkWrap: true,
                            itemCount: homeStore.newsList.length,
                            itemBuilder: (context, index) => NewsTile(news: homeStore.newsList[index]),
                          ),
                        ),
                      )
                    ],
                  ),
                ),
                const Padding(
                  padding: EdgeInsets.only(top: 76, bottom: 15),
                  child: Text(
                    'Assine nossa newsletter',
                    style: TextStyle(
                      fontSize: 40,
                      fontWeight: FontWeight.w400,
                      color: Color.fromRGBO(134, 205, 47, 1),
                    ),
                  ),
                ),
                SizedBox(
                  width: 510,
                  child: Observer(
                    builder: (context) => Row(
                      crossAxisAlignment: CrossAxisAlignment.start,
                      children: [
                        Expanded(
                          child: TextFormField(
                            onChanged: homeStore.setEmail,
                            keyboardType: TextInputType.emailAddress,
                            enabled: !homeStore.loading,
                            style: const TextStyle(
                              fontSize: 15,
                              color: Color.fromRGBO(255, 255, 255, 0.77),
                            ),
                            maxLines: 1,
                            decoration: InputDecoration(
                              errorText: homeStore.emailError,
                              isDense: true,
                              filled: true,
                              fillColor: const Color.fromRGBO(52, 61, 67, 1),
                              hintText: 'Digite seu email :)',
                              hintStyle: const TextStyle(
                                fontSize: 15,
                                color: Color.fromRGBO(255, 255, 255, 0.77),
                              ),
                              border: OutlineInputBorder(
                                borderRadius: BorderRadius.circular(4),
                              ),
                              enabledBorder: OutlineInputBorder(
                                borderRadius: BorderRadius.circular(4),
                                borderSide: const BorderSide(
                                  color: Colors.white,
                                  width: 1.0,
                                ),
                              ),
                              focusedBorder: OutlineInputBorder(
                                borderRadius: BorderRadius.circular(4),
                                borderSide: BorderSide(
                                  color: Colors.white,
                                  width: 1.0,
                                ),
                              ),
                            ),
                          ),
                        ),
                        const SizedBox(
                          width: 3,
                        ),
                        GestureDetector(
                          onTap: homeStore.invalidSendPressed,
                          child: ElevatedButton(
                            style: ElevatedButton.styleFrom(
                              backgroundColor: const Color.fromRGBO(93, 163, 113, 1),
                              disabledBackgroundColor: const Color.fromRGBO(93, 163, 113, 1).withAlpha(120),
                              fixedSize: const Size(86, 40),
                              padding: EdgeInsets.zero,
                              textStyle: const TextStyle(
                                fontSize: 14,
                                fontWeight: FontWeight.w400,
                              ),
                            ),
                            onPressed: homeStore.subscribeNewsletterPressed,
                            child: homeStore.loading
                                ? const CircularProgressIndicator(
                                    color: Colors.white,
                                  )
                                : const Text('Inscreva-se'),
                          ),
                        )
                      ],
                    ),
                  ),
                ),
              ],
            ),
          ),
          Container(
            height: 1128,
            decoration: const BoxDecoration(
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
                        height: 50,
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
