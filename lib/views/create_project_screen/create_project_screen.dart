import 'dart:html';

import 'package:file_picker/file_picker.dart';
import 'package:flutter/material.dart';
import 'package:flutter_mobx/flutter_mobx.dart';
import 'package:flutter_svg/flutter_svg.dart';
import 'package:plataforma_rede_campo/components/bottom%20panel/botton%20panel.dart';
import 'package:plataforma_rede_campo/components/remove_button.dart';
import 'package:plataforma_rede_campo/stores/novo_projeto_store.dart';
import '../../components/error_box.dart';
import '../../components/home_button.dart';
import '../../components/navigation_bar/navigation_barra.dart';

class CreateProjectScreen extends StatelessWidget {
  CreateProjectScreen({Key? key}) : super(key: key);

  NovoProjetoStore novoProjetoStore = NovoProjetoStore();

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
          Stack(
            fit: StackFit.passthrough,
            children: [
              Column(
                children: [
                  const Padding(
                    padding: EdgeInsets.only(top: 103, bottom: 56),
                    child: Text(
                      "Adicionar projeto",
                      style: TextStyle(
                        fontSize: 56,
                        fontWeight: FontWeight.w600,
                      ),
                    ),
                  ),
                  Observer(
                    builder: (context) => SizedBox(
                      width: 1340,
                      child: Column(
                        children: [
                          InkWell(
                            onTap: getImage,
                            hoverColor: const Color.fromRGBO(217, 217, 217, 20),
                            child: SizedBox(
                              height: 590,
                              width: 1340,
                              child: Stack(
                                fit: StackFit.expand,
                                children: [
                                  Card(
                                    color: novoProjetoStore.image == null ? const Color.fromRGBO(217, 217, 217, 1) : Colors.transparent,
                                    shape: RoundedRectangleBorder(
                                      side: BorderSide(
                                        color: novoProjetoStore.imageError != null
                                            ? Colors.red.shade700
                                            : const Color.fromRGBO(
                                                217,
                                                217,
                                                217,
                                                1,
                                              ),
                                        width: 1,
                                      ),
                                    ),
                                    elevation: 0,
                                    child: novoProjetoStore.image != null
                                        ? Image.memory(
                                            novoProjetoStore.image.files.first.bytes,
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
                                  novoProjetoStore.image != null
                                      ? Padding(
                                          padding: const EdgeInsets.all(22),
                                          child: Align(
                                            alignment: Alignment.topLeft,
                                            child: RemoveButton(
                                              message: 'Remover imagem',
                                              onTap: () {
                                                novoProjetoStore.setImage(null);
                                              },
                                            ),
                                          ),
                                        )
                                      : Container(),
                                ],
                              ),
                            ),
                          ),
                          if (novoProjetoStore.imageError != null)
                            Container(
                              padding: const EdgeInsets.fromLTRB(14, 7, 0, 0),
                              alignment: Alignment.centerLeft,
                              child: Text(
                                novoProjetoStore.imageError!,
                                style: TextStyle(
                                  color: Colors.red.shade700,
                                ),
                              ),
                            ),
                        ],
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
                            onChanged: novoProjetoStore.setTitle,
                            enabled: !novoProjetoStore.loading,
                            decoration: InputDecoration(
                              errorText: novoProjetoStore.titleError,
                              filled: true,
                              fillColor: const Color.fromRGBO(217, 217, 217, 1),
                              border: novoProjetoStore.titleError == null
                                  ? InputBorder.none
                                  : OutlineInputBorder(
                                      borderSide: BorderSide(
                                        width: 1,
                                        color: Colors.redAccent,
                                      ),
                                    ),
                              errorBorder: OutlineInputBorder(
                                borderSide: BorderSide(
                                  width: 1,
                                  color: Colors.redAccent,
                                ),
                              ),
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
                            onChanged: novoProjetoStore.setContent,
                            enabled: !novoProjetoStore.loading,
                            decoration: InputDecoration(
                              errorText: novoProjetoStore.contentError,
                              filled: true,
                              fillColor: const Color.fromRGBO(217, 217, 217, 1),
                              border: novoProjetoStore.contentError == null
                                  ? InputBorder.none
                                  : OutlineInputBorder(
                                      borderSide: BorderSide(
                                        width: 1,
                                        color: Colors.redAccent,
                                      ),
                                    ),
                              errorBorder: OutlineInputBorder(
                                borderSide: BorderSide(
                                  width: 1,
                                  color: Colors.redAccent,
                                ),
                              ),
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
                                    fillColor: const Color.fromRGBO(217, 217, 217, 1),
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
                                    fillColor: const Color.fromRGBO(217, 217, 217, 1),
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
                  /*const SizedBox(
                    height: 118,
                  ),*/
                  Observer(
                    builder: (context) => Container(
                      margin: novoProjetoStore.error != null ? const EdgeInsets.only(top: 118, bottom: 40) : EdgeInsets.only(top: 118),
                      width: 1530,
                      child: ErrorBox(
                        message: novoProjetoStore.error,
                      ),
                    ),
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
                            child: GestureDetector(
                              onTap: novoProjetoStore.invalidSendPressed,
                              child: ElevatedButton(
                                onPressed: novoProjetoStore.publicarPressed,
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
                                child: novoProjetoStore.loading
                                    ? CircularProgressIndicator(
                                        color: Color.fromRGBO(246, 245, 244, 1),
                                      )
                                    : Text("Publicar"),
                              ),
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
              Align(
                alignment: Alignment.topLeft,
                child: Padding(
                  padding: const EdgeInsets.only(
                    top: 88,
                    left: 55,
                  ),
                  child: HomeButton(),
                ),
              ),
            ],
          ),
          const BottonPanel(),
        ],
      ),
    );
  }

  Future<void> getImage() async {
    final image = await FilePicker.platform.pickFiles(type: FileType.image);
    if (image != null) {
      novoProjetoStore.setImage(null);
      novoProjetoStore.setImage(image);
    }
  }
}
