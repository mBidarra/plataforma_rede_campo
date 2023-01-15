import 'package:cached_network_image/cached_network_image.dart';
import 'package:flutter/material.dart';
import 'package:flutter_mobx/flutter_mobx.dart';
import 'package:flutter_svg/svg.dart';
import 'package:plataforma_rede_campo/components/rounded_left_button2.dart';
import 'package:plataforma_rede_campo/components/rounded_right_button.dart';
import 'package:plataforma_rede_campo/stores/about_store.dart';
import 'package:plataforma_rede_campo/views/about_screen/components/personTilePesquisador.dart';
import '../../components/bottom panel/botton panel.dart';
import '../../components/navigation_bar/navigation_barra.dart';
import 'components/person_tile.dart';

class AboutScreen extends StatelessWidget {
  AboutScreen({Key? key}) : super(key: key);

  AboutStore aboutStore = AboutStore();

  @override
  Widget build(BuildContext context) {
    final screenSize = MediaQuery.of(context).size;

    return Scaffold(
      backgroundColor: const Color.fromRGBO(52, 61, 67, 1),
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
          SizedBox(
            height: screenSize.height * 0.045,
          ),
          const Text(
            "Quem somos?",
            textAlign: TextAlign.center,
            style: TextStyle(
              fontSize: 60,
              fontWeight: FontWeight.w600,
              color: Color.fromRGBO(134, 205, 47, 1),
            ),
          ),
          Padding(
            padding: EdgeInsets.only(
              left: screenSize.width * 0.12,
              top: screenSize.height * 0.045,
              right: screenSize.width * 0.12,
              bottom: screenSize.height * 0.12,
            ),
            child: const Text(
              "Pellentesque tincidunt felis eu orci porttitor fermentum. Donec nec mi "
              "vitae eros pretium iaculis. Pellentesque consectetur sem nisl, a dignissim "
              "ipsum cursus vitae. Praesent lacinia, mi in dapibus accumsan, nulla nisl finibus "
              "risus, non luctus elit libero ut purus. Integer eget pharetra nisi. Donec vel molestie enim. "
              "Sed auctor, ligula sed congue tempus, ligula nisi aliquet eros, vitae iaculis arcu quam mattis ex. "
              "Donec non dictum tortor, nec porttitor est. Nullam vitae rutrum ante, ut porta neque. In hac habitassed",
              textAlign: TextAlign.center,
              style: TextStyle(
                color: Colors.white,
                fontSize: 30,
                fontWeight: FontWeight.w600,
              ),
            ),
          ),
          Padding(
            padding: EdgeInsets.only(left: screenSize.width * 0.04),
            child: const Text(
              "Pesquisadores",
              textAlign: TextAlign.start,
              style: TextStyle(
                color: Colors.white,
                fontSize: 50,
                fontWeight: FontWeight.w600,
              ),
            ),
          ),
          SizedBox(
            height: screenSize.height * 0.40,
            child: Padding(
              padding: EdgeInsets.symmetric(
                horizontal: screenSize.width * 0.04,
              ),
              child: Observer(
                builder: (context) => Row(
                  mainAxisAlignment: MainAxisAlignment.spaceBetween,
                  crossAxisAlignment: CrossAxisAlignment.center,
                  children: [
                    RoundedLeftButton2(
                      onTap: () {
                        aboutStore.decrementPressedPesquisador();
                      },
                    ),
                    aboutStore.loading
                        ? CircularProgressIndicator(
                            color: Colors.white,
                          )
                        : PersonTilePesquisador(
                            aboutStore: aboutStore,
                            index: aboutStore.indexPesquisadores,
                          ),
                    RoundedRightButton(
                      onTap: () {
                        aboutStore.incrementPressedPesquisador();
                      },
                    ),
                  ],
                ),
              ),
            ),
          ),
          Padding(
            padding: EdgeInsets.only(
              top: screenSize.width * 0.12,
              left: screenSize.width * 0.04,
            ),
            child: const Text(
              "Membros",
              textAlign: TextAlign.start,
              style: TextStyle(
                color: Colors.white,
                fontSize: 50,
                fontWeight: FontWeight.w600,
              ),
            ),
          ),
          SizedBox(
            height: screenSize.height * 0.40,
            child: Padding(
              padding: EdgeInsets.symmetric(
                horizontal: screenSize.width * 0.04,
              ),
              child: Observer(
                builder: (context) => Row(
                  mainAxisAlignment: MainAxisAlignment.spaceBetween,
                  crossAxisAlignment: CrossAxisAlignment.center,
                  children: [
                    RoundedLeftButton2(
                      onTap: () {
                        aboutStore.decrementPressedMembro();
                      },
                    ),
                    aboutStore.loading
                        ? const CircularProgressIndicator(
                            color: Colors.white,
                          )
                        : PersonTile(
                            image: aboutStore.membrosList[aboutStore.indexMembros].image.url,
                            name: aboutStore.membrosList[aboutStore.indexMembros].name),
                    aboutStore.loading
                        ? const CircularProgressIndicator(
                            color: Colors.white,
                          )
                        : PersonTile(
                            image: aboutStore.membrosList[aboutStore.indexMembros + 1].image.url,
                            name: aboutStore.membrosList[aboutStore.indexMembros + 1].name),
                    RoundedRightButton(
                      onTap: () {
                        if (aboutStore.indexMembros < aboutStore.membrosList.length - 2) {
                          aboutStore.incrementPressedMembro();
                        }
                      },
                    ),
                  ],
                ),
              ),
            ),
          ),
          Padding(
            padding: EdgeInsets.only(
              top: screenSize.width * 0.12,
              left: screenSize.width * 0.04,
            ),
            child: const Text(
              "Membros",
              textAlign: TextAlign.start,
              style: TextStyle(
                color: Colors.white,
                fontSize: 50,
                fontWeight: FontWeight.w600,
              ),
            ),
          ),
          SizedBox(
            height: screenSize.height * 0.40,
            child: Padding(
              padding: EdgeInsets.symmetric(
                horizontal: screenSize.width * 0.04,
              ),
              child: Observer(
                builder: (context) => Row(
                  mainAxisAlignment: MainAxisAlignment.spaceBetween,
                  crossAxisAlignment: CrossAxisAlignment.center,
                  children: [
                    RoundedLeftButton2(
                      onTap: () {
                        aboutStore.decrementPressedColaborador();
                      },
                    ),
                    PersonTilePesquisador(aboutStore: aboutStore, index: aboutStore.indexColaboradores),
                    PersonTilePesquisador(aboutStore: aboutStore, index: aboutStore.indexColaboradores + 1),
                    aboutStore.loading
                        ? const CircularProgressIndicator(
                            color: Colors.white,
                          )
                        : PersonTile(
                            image: aboutStore.colaboradoresList[aboutStore.indexColaboradores + 2].image.url,
                            name: aboutStore.colaboradoresList[aboutStore.indexColaboradores + 2].name),
                    RoundedRightButton(
                      onTap: () {
                        if (aboutStore.indexColaboradores < aboutStore.colaboradoresList.length - 3) {
                          aboutStore.incrementPressedColaborador();
                        }
                      },
                    ),
                  ],
                ),
              ),
            ),
          ),
          const BottonPanel(),
        ],
      ),
    );
  }
}
