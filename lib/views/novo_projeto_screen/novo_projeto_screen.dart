import 'dart:typed_data';
import 'package:flutter/material.dart';
import 'package:flutter_mobx/flutter_mobx.dart';
import 'package:flutter_svg/flutter_svg.dart';
import 'package:image_picker_web/image_picker_web.dart';
import 'package:plataforma_rede_campo/components/bottom%20panel/botton%20panel.dart';
import '../../components/navigation_bar/navigation_barra.dart';

class NovoProjetoScreen extends StatelessWidget {
  const NovoProjetoScreen({Key? key}) : super(key: key);

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
                padding: EdgeInsets.only(top: 132, bottom: 56),
                child: Text(
                  "Adicionar projeto",
                  style: TextStyle(
                    fontSize: 56,
                    fontWeight: FontWeight.w600,
                  ),
                ),
              ),
              InkWell(
                onTap: getImage,
                //if (Platform.isWindows) {}
                hoverColor: const Color.fromRGBO(217, 217, 217, 20),
                child: SizedBox(
                  height: 590,
                  width: 1360,
                  child: Card(
                    color: const Color.fromRGBO(217, 217, 217, 1),
                    elevation: 0,
                    child: Column(
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
                ),
              ),
              SizedBox(
                height: 53,
              ),
              SizedBox(
                width: 1360,
                child: Column(
                  crossAxisAlignment: CrossAxisAlignment.stretch,
                  children: [
                    Text(
                      "TITULO",
                      style: TextStyle(
                        fontSize: 36,
                        fontWeight: FontWeight.w600,
                        color: Color.fromRGBO(52, 61, 67, 1),
                      ),
                    ),
                    SizedBox(
                      height: 12,
                    ),
                    Observer(
                      builder: (context) => TextFormField(
                        style: const TextStyle(fontSize: 25),
                        maxLines: 1,
                        //onChanged: loginStore.setEmail,
                        //enabled: !loginStore.loading,
                        decoration: InputDecoration(
                          //errorText: loginStore.emailError,
                          filled: true,
                          fillColor: const Color.fromRGBO(217, 217, 217, 1),
                          border: InputBorder.none,
                        ),
                        textInputAction: TextInputAction.next,
                      ),
                    ),
                  ],
                ),
              ),
              SizedBox(
                height: 140,
              ),
              SizedBox(
                width: 1530,
                child: Column(
                  crossAxisAlignment: CrossAxisAlignment.stretch,
                  children: [
                    Text(
                      "Descrição",
                      style: TextStyle(
                        fontSize: 43,
                        fontWeight: FontWeight.w600,
                        color: Color.fromRGBO(52, 61, 67, 1),
                      ),
                    ),
                    SizedBox(
                      height: 12,
                    ),
                    Observer(
                      builder: (context) => TextFormField(
                        style: const TextStyle(fontSize: 25),
                        maxLines: 20,
                        //onChanged: loginStore.setEmail,
                        //enabled: !loginStore.loading,
                        decoration: InputDecoration(
                          //errorText: loginStore.emailError,
                          filled: true,
                          fillColor: const Color.fromRGBO(217, 217, 217, 1),
                          border: InputBorder.none,
                        ),
                        textInputAction: TextInputAction.next,
                      ),
                    ),
                  ],
                ),
              ),
              SizedBox(
                height: 61,
              ),
              Text(
                "Autor/Autores:",
                style: TextStyle(
                  fontSize: 43,
                  fontWeight: FontWeight.w600,
                  color: Color.fromRGBO(52, 61, 67, 1),
                ),
              ),
              SizedBox(
                height: 40,
              ),
              SizedBox(
                width: 620,
                child: Column(
                  crossAxisAlignment: CrossAxisAlignment.stretch,
                  children: [
                    Text(
                      "Principais",
                      style: TextStyle(
                        fontSize: 30,
                        fontWeight: FontWeight.w500,
                        color: Colors.black,
                      ),
                    ),
                    Row(
                      children: [
                        Expanded(
                          child: Observer(
                            builder: (context) => TextFormField(
                              style: const TextStyle(fontSize: 25),
                              maxLines: 1,
                              //onChanged: loginStore.setEmail,
                              //enabled: !loginStore.loading,
                              decoration: InputDecoration(
                                //errorText: loginStore.emailError,
                                filled: true,
                                fillColor:
                                    const Color.fromRGBO(217, 217, 217, 1),
                                border: InputBorder.none,
                              ),
                              textInputAction: TextInputAction.next,
                            ),
                          ),
                        ),
                        InkWell(
                          onTap: () {},
                          hoverColor: Colors.transparent,
                          borderRadius: BorderRadius.circular(4),
                          radius: 4,
                          child: SvgPicture.asset(
                            'icons/plus.svg',
                            height: 65,
                          ),
                        ),
                      ],
                    ),
                    const SizedBox(
                      height: 15,
                    ),
                    Row(
                      children: [
                        Expanded(
                          child: Observer(
                            builder: (context) => TextFormField(
                              style: const TextStyle(fontSize: 25),
                              maxLines: 1,
                              //onChanged: loginStore.setEmail,
                              //enabled: !loginStore.loading,
                              decoration: const InputDecoration(
                                //errorText: loginStore.emailError,
                                filled: true,
                                fillColor: Color.fromRGBO(217, 217, 217, 1),
                                border: InputBorder.none,
                              ),
                              textInputAction: TextInputAction.next,
                            ),
                          ),
                        ),
                        InkWell(
                          onTap: () {},
                          hoverColor: Colors.transparent,
                          borderRadius: BorderRadius.circular(4),
                          radius: 4,
                          child: SvgPicture.asset(
                            'icons/plus.svg',
                            height: 65,
                          ),
                        ),
                      ],
                    ),
                    const SizedBox(
                      height: 40,
                    ),
                    const Text(
                      "Colaboradores",
                      style: TextStyle(
                        fontSize: 30,
                        fontWeight: FontWeight.w500,
                        color: Colors.black,
                      ),
                    ),
                    Row(
                      children: [
                        Expanded(
                          child: Observer(
                            builder: (context) => TextFormField(
                              style: const TextStyle(fontSize: 25),
                              maxLines: 1,
                              //onChanged: loginStore.setEmail,
                              //enabled: !loginStore.loading,
                              decoration: InputDecoration(
                                //errorText: loginStore.emailError,
                                filled: true,
                                fillColor:
                                    const Color.fromRGBO(217, 217, 217, 1),
                                border: InputBorder.none,
                              ),
                              textInputAction: TextInputAction.next,
                            ),
                          ),
                        ),
                        InkWell(
                          onTap: () {},
                          hoverColor: Colors.transparent,
                          borderRadius: BorderRadius.circular(4),
                          radius: 4,
                          child: SvgPicture.asset(
                            'icons/plus.svg',
                            height: 65,
                          ),
                        ),
                      ],
                    ),
                  ],
                ),
              ),
              const SizedBox(
                height: 118,
              ),
              SizedBox(
                width: 1530,
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
                height: 67,
              ),
            ],
          ),
          BottonPanel(),
        ],
      ),
    );
  }

  Future<void> getImage() async {
    Uint8List? bytesFromPicker = await ImagePickerWeb.getImageAsBytes();
  }
}
