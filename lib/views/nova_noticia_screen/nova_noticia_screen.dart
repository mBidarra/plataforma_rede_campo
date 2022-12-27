import 'package:flutter/material.dart';
import 'package:flutter_mobx/flutter_mobx.dart';
import 'package:flutter_svg/svg.dart';
import 'package:image_picker_web/image_picker_web.dart';
import 'package:plataforma_rede_campo/stores/nova_noticia_store.dart';

import '../../components/bottom panel/botton panel.dart';
import '../../components/navigation_bar/navigation_barra.dart';

class NovaNoticiaScreen extends StatelessWidget {
  NovaNoticiaScreen({Key? key}) : super(key: key);

  NovaNoticiaStore novaNoticiaStore = NovaNoticiaStore();

  @override
  Widget build(BuildContext context) {
    final screenSize = MediaQuery.of(context).size;

    return Scaffold(
      backgroundColor: const Color.fromRGBO(239, 231, 231, 1),
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
          Column(
            children: [
              const Padding(
                padding: EdgeInsets.only(top: 103, bottom: 56),
                child: Text(
                  "Adicionar nova noticia",
                  style: TextStyle(
                    fontSize: 56,
                    fontWeight: FontWeight.w600,
                  ),
                ),
              ),
              Observer(
                builder: (context) => InkWell(
                  onTap: getImage,
                  //if (Platform.isWindows) {}
                  hoverColor: const Color.fromRGBO(217, 217, 217, 20),
                  child: SizedBox(
                    height: 590,
                    width: 1340,
                    child: Stack(
                      fit: StackFit.expand,
                      children: [
                        Card(
                          color: const Color.fromRGBO(217, 217, 217, 1),
                          elevation: 0,
                          child: novaNoticiaStore.images.isNotEmpty
                              ? Image.memory(
                                  novaNoticiaStore.images.first,
                                  fit: BoxFit.contain,
                                )
                              : Column(
                                  mainAxisAlignment: MainAxisAlignment.center,
                                  children: [
                                    const Text(
                                      'Adicionar',
                                      style: TextStyle(
                                        fontSize: 40,
                                        fontWeight: FontWeight.w500,
                                        color: Color.fromRGBO(57, 51, 51, 1),
                                        //fontFamily: "SF Pro Text",
                                      ),
                                    ),
                                    SvgPicture.asset('icons/add.svg'),
                                    const Text(
                                      'imagem',
                                      style: TextStyle(
                                        fontSize: 40,
                                        fontWeight: FontWeight.w500,
                                        color: Color.fromRGBO(57, 51, 51, 1),
                                        //fontFamily: "SF Pro Text",
                                      ),
                                    ),
                                  ],
                                ),
                        ),
                        novaNoticiaStore.images.isNotEmpty
                            ? Padding(
                                padding: const EdgeInsets.all(22),
                                child: Align(
                                  alignment: Alignment.topLeft,
                                  child: InkWell(
                                    onTap: novaNoticiaStore.images.clear,
                                    child: SvgPicture.asset(
                                      "icons/remove.svg",
                                    ),
                                  ),
                                ),
                              )
                            : Container(),
                      ],
                    ),
                  ),
                ),
              ),
              const SizedBox(
                height: 50,
              ),
              SizedBox(
                width: 1340,
                child: Row(
                  mainAxisAlignment: MainAxisAlignment.center,
                  crossAxisAlignment: CrossAxisAlignment.start,
                  children: [
                    Column(
                      children: [
                        Observer(
                          builder: (context) => InkWell(
                            onTap: getImage,
                            //if (Platform.isWindows) {}
                            hoverColor: const Color.fromRGBO(217, 217, 217, 20),
                            child: SizedBox(
                              height: 594,
                              width: 655,
                              child: Stack(
                                fit: StackFit.expand,
                                children: [
                                  Card(
                                    margin: EdgeInsets.zero,
                                    color:
                                        const Color.fromRGBO(217, 217, 217, 1),
                                    elevation: 0,
                                    child: novaNoticiaStore.images.isNotEmpty
                                        ? Image.memory(
                                            novaNoticiaStore.images.first,
                                            fit: BoxFit.contain,
                                          )
                                        : Column(
                                            mainAxisAlignment:
                                                MainAxisAlignment.center,
                                            children: [
                                              const Text(
                                                'Adicionar',
                                                style: TextStyle(
                                                  fontSize: 40,
                                                  fontWeight: FontWeight.w500,
                                                  color: Color.fromRGBO(
                                                      57, 51, 51, 1),
                                                  //fontFamily: "SF Pro Text",
                                                ),
                                              ),
                                              SvgPicture.asset('icons/add.svg'),
                                              const Text(
                                                'imagem',
                                                style: TextStyle(
                                                  fontSize: 40,
                                                  fontWeight: FontWeight.w500,
                                                  color: Color.fromRGBO(
                                                      57, 51, 51, 1),
                                                  //fontFamily: "SF Pro Text",
                                                ),
                                              ),
                                            ],
                                          ),
                                  ),
                                  novaNoticiaStore.images.isNotEmpty
                                      ? Padding(
                                          padding: const EdgeInsets.all(22),
                                          child: Align(
                                            alignment: Alignment.topLeft,
                                            child: InkWell(
                                              onTap:
                                                  novaNoticiaStore.images.clear,
                                              child: SvgPicture.asset(
                                                "icons/remove.svg",
                                              ),
                                            ),
                                          ),
                                        )
                                      : Container(),
                                ],
                              ),
                            ),
                          ),
                        ),
                        SizedBox(
                          height: 8,
                        ),
                        SizedBox(
                          width: 655,
                          child: Observer(
                            builder: (context) => TextFormField(
                              style: TextStyle(fontSize: 22),
                              maxLines: 1,
                              //onChanged: loginStore.setEmail,
                              //enabled: !loginStore.loading,
                              decoration: InputDecoration(
                                //errorText: loginStore.emailError,
                                filled: true,
                                fillColor: Color.fromRGBO(217, 217, 217, 1),
                                border: OutlineInputBorder(
                                  borderRadius: BorderRadius.circular(8),
                                  borderSide: BorderSide.none,
                                ),
                                hintText: "Leganda da imagem/Subtitulo",
                                hintStyle: TextStyle(
                                  fontSize: 22,
                                  color: Color.fromRGBO(52, 61, 67, 1),
                                  fontWeight: FontWeight.w600,
                                ),
                              ),
                              textInputAction: TextInputAction.next,
                            ),
                          ),
                        ),
                        SizedBox(
                          height: 41,
                        ),
                        SizedBox(
                          width: 655,
                          child: Observer(
                            builder: (context) => TextFormField(
                              style: TextStyle(fontSize: 20),
                              maxLines: 16,
                              //onChanged: loginStore.setEmail,
                              //enabled: !loginStore.loading,
                              decoration: InputDecoration(
                                //errorText: loginStore.emailError,
                                filled: true,
                                fillColor: Color.fromRGBO(217, 217, 217, 1),
                                border: OutlineInputBorder(
                                  borderRadius: BorderRadius.circular(8),
                                  borderSide: BorderSide.none,
                                ),
                                hintText: "Leganda da imagem/Subtitulo",
                                hintStyle: TextStyle(
                                  fontSize: 20,
                                  color: Color.fromRGBO(52, 61, 67, 1),
                                  fontWeight: FontWeight.w600,
                                ),
                              ),
                              textInputAction: TextInputAction.next,
                            ),
                          ),
                        )
                      ],
                    ),
                    const SizedBox(
                      width: 30,
                    ),
                    Column(
                      children: [
                        SizedBox(
                          width: 655,
                          child: Observer(
                            builder: (context) => TextFormField(
                              style: TextStyle(fontSize: 33),
                              maxLines: 1,
                              //onChanged: loginStore.setEmail,
                              //enabled: !loginStore.loading,
                              textAlign: TextAlign.center,
                              decoration: InputDecoration(
                                //errorText: loginStore.emailError,
                                filled: true,
                                fillColor: Color.fromRGBO(217, 217, 217, 1),
                                border: OutlineInputBorder(
                                  borderRadius: BorderRadius.circular(8),
                                  borderSide: BorderSide.none,
                                ),
                                hintText: "Titulo",
                                hintStyle: TextStyle(
                                  fontSize: 33,
                                  color: Color.fromRGBO(52, 61, 67, 1),
                                  fontWeight: FontWeight.w600,
                                ),
                              ),
                              textInputAction: TextInputAction.next,
                            ),
                          ),
                        ),
                        SizedBox(
                          height: 25,
                        ),
                        SizedBox(
                          width: 655,
                          child: Observer(
                            builder: (context) => TextFormField(
                              style: TextStyle(fontSize: 33),
                              maxLines: 25,
                              //onChanged: loginStore.setEmail,
                              //enabled: !loginStore.loading,
                              decoration: InputDecoration(
                                //errorText: loginStore.emailError,
                                filled: true,
                                fillColor: Color.fromRGBO(217, 217, 217, 1),
                                border: OutlineInputBorder(
                                  borderRadius: BorderRadius.circular(8),
                                  borderSide: BorderSide.none,
                                ),
                                hintText: "Conteúdo da noticia:",
                                hintStyle: TextStyle(
                                  fontSize: 33,
                                  color: Color.fromRGBO(52, 61, 67, 1),
                                  fontWeight: FontWeight.w600,
                                ),
                              ),
                              textInputAction: TextInputAction.next,
                            ),
                          ),
                        )
                      ],
                    ),
                  ],
                ),
              ),
              const SizedBox(
                height: 47,
              ),
              SizedBox(
                width: 1340,
                child: Row(
                  mainAxisAlignment: MainAxisAlignment.end,
                  children: [
                    Observer(
                      builder: (context) => SizedBox(
                        width: 437,
                        height: 60,
                        child: ElevatedButton(
                          onPressed: () {},
                          style: ElevatedButton.styleFrom(
                            backgroundColor: Color.fromRGBO(72, 125, 59, 1),
                            shape: RoundedRectangleBorder(
                              borderRadius: BorderRadius.circular(8),
                            ),
                            textStyle: const TextStyle(
                              fontSize: 38,
                              fontWeight: FontWeight.w600,
                              color: Color.fromRGBO(246, 245, 244, 1),
                            ),
                          ),
                          child: Text("Publicar"),
                        ),
                      ),
                    )
                  ],
                ),
              ),
              const SizedBox(
                height: 64,
              ),
            ],
          ),
          const BottonPanel(),
        ],
      ),
    );
  }

  Future<void> getImage() async {
    final image = await ImagePickerWeb.getImageAsBytes();
    if (image != null) {
      novaNoticiaStore.images.clear();
      novaNoticiaStore.images.add(image);
    }
  }
}
