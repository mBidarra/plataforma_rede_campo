import 'package:flutter/material.dart';
import 'package:flutter_mobx/flutter_mobx.dart';
import 'package:flutter_svg/svg.dart';
import 'package:plataforma_rede_campo/components/error_box.dart';
import 'package:plataforma_rede_campo/components/home_button.dart';
import 'package:plataforma_rede_campo/stores/nova_noticia_store.dart';
import '../../components/bottom panel/botton panel.dart';
import '../../components/navigation_bar/navigation_barra.dart';
import '../../components/remove_button.dart';
import '../../models/news.dart';
import 'package:file_picker/file_picker.dart';

class CreateNewsScreen extends StatefulWidget {
  CreateNewsScreen({Key? key, this.news}) : super(key: key);

  final News? news;

  @override
  State<CreateNewsScreen> createState() => _CreateNewsScreenState(news);
}

class _CreateNewsScreenState extends State<CreateNewsScreen> {
  _CreateNewsScreenState(News? news)
      : editando = news != null,
        novaNoticiaStore = NovaNoticiaStore(news ?? News());

  bool editando;

  NovaNoticiaStore novaNoticiaStore;

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
                      "Adicionar nova noticia",
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
                            onTap: getImage1,
                            hoverColor: const Color.fromRGBO(217, 217, 217, 20),
                            child: SizedBox(
                              height: 590,
                              width: 1340,
                              child: Stack(
                                fit: StackFit.expand,
                                children: [
                                  Card(
                                    color: novaNoticiaStore.image1.isEmpty ? const Color.fromRGBO(217, 217, 217, 1) : Colors.transparent,
                                    shape: RoundedRectangleBorder(
                                      side: BorderSide(
                                        color: novaNoticiaStore.image1Error != null
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
                                    child: novaNoticiaStore.image1.isNotEmpty
                                        ? Image.memory(
                                            novaNoticiaStore.image1.first.files.first.bytes,
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
                                  novaNoticiaStore.image1.isNotEmpty
                                      ? Padding(
                                          padding: const EdgeInsets.all(22),
                                          child: Align(
                                            alignment: Alignment.topLeft,
                                            child: RemoveButton(
                                              message: 'Remover imagem',
                                              onTap: novaNoticiaStore.image1.clear,
                                            ),
                                          ),
                                        )
                                      : Container(),
                                ],
                              ),
                            ),
                          ),
                          if (novaNoticiaStore.image1Error != null)
                            Container(
                              padding: const EdgeInsets.fromLTRB(14, 7, 0, 0),
                              alignment: Alignment.centerLeft,
                              child: Text(
                                novaNoticiaStore.image1Error!,
                                style: TextStyle(
                                  color: Colors.red.shade700,
                                ),
                              ),
                            ),
                        ],
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
                        Observer(
                          builder: (context) => SizedBox(
                            width: 655,
                            child: Column(
                              children: [
                                Observer(
                                  builder: (context) => InkWell(
                                    onTap: getImage2,
                                    hoverColor: const Color.fromRGBO(217, 217, 217, 20),
                                    child: SizedBox(
                                      height: 594,
                                      width: 655,
                                      child: Stack(
                                        fit: StackFit.expand,
                                        children: [
                                          Card(
                                            margin: EdgeInsets.zero,
                                            color: novaNoticiaStore.image2 == null
                                                ? const Color.fromRGBO(217, 217, 217, 1)
                                                : Colors.transparent,
                                            shape: RoundedRectangleBorder(
                                              side: BorderSide(
                                                color: novaNoticiaStore.image2Error != null
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
                                            child: novaNoticiaStore.image2 != null
                                                ? Image.memory(
                                                    novaNoticiaStore.image2.files.first.bytes,
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
                                          novaNoticiaStore.image2 != null
                                              ? Padding(
                                                  padding: const EdgeInsets.all(22),
                                                  child: Align(
                                                    alignment: Alignment.topLeft,
                                                    child: RemoveButton(
                                                      message: 'Remover imagem',
                                                      onTap: () {
                                                        novaNoticiaStore.setImage2(null);
                                                      },
                                                    ),
                                                  ),
                                                )
                                              : Container(),
                                        ],
                                      ),
                                    ),
                                  ),
                                ),
                                if (novaNoticiaStore.image2Error != null)
                                  Container(
                                    padding: const EdgeInsets.fromLTRB(14, 7, 0, 0),
                                    alignment: Alignment.centerLeft,
                                    child: Text(
                                      novaNoticiaStore.image2Error!,
                                      textAlign: TextAlign.left,
                                      style: TextStyle(
                                        color: Colors.red.shade700,
                                      ),
                                    ),
                                  ),
                                const SizedBox(
                                  height: 8,
                                ),
                                SizedBox(
                                  width: 655,
                                  child: Observer(
                                    builder: (context) => TextFormField(
                                      style: const TextStyle(fontSize: 22),
                                      maxLines: 1,
                                      onChanged: novaNoticiaStore.setTitleImage2,
                                      enabled: !novaNoticiaStore.loading,
                                      decoration: InputDecoration(
                                        errorText: novaNoticiaStore.titleImage2Error,
                                        filled: true,
                                        fillColor: const Color.fromRGBO(217, 217, 217, 1),
                                        border: novaNoticiaStore.titleImage2Error == null
                                            ? OutlineInputBorder(
                                                borderSide: BorderSide.none,
                                                borderRadius: BorderRadius.circular(8),
                                              )
                                            : OutlineInputBorder(
                                                borderSide: BorderSide(
                                                  width: 1,
                                                  color: Colors.redAccent,
                                                ),
                                                borderRadius: BorderRadius.circular(8),
                                              ),
                                        errorBorder: OutlineInputBorder(
                                          borderSide: BorderSide(
                                            width: 1,
                                            color: Colors.redAccent,
                                          ),
                                          borderRadius: BorderRadius.circular(8),
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
                                      onChanged: novaNoticiaStore.setOptionalContent,
                                      enabled: !novaNoticiaStore.loading,
                                      decoration: InputDecoration(
                                        errorText: novaNoticiaStore.optionalContentError,
                                        filled: true,
                                        fillColor: const Color.fromRGBO(217, 217, 217, 1),
                                        border: novaNoticiaStore.optionalContentError == null
                                            ? OutlineInputBorder(
                                                borderSide: BorderSide.none,
                                              )
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
                                        hintText: "Conteúdo da noticia",
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
                          ),
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
                                  onChanged: novaNoticiaStore.setTitle,
                                  enabled: !novaNoticiaStore.loading,
                                  textAlign: TextAlign.center,
                                  decoration: InputDecoration(
                                    errorText: novaNoticiaStore.titleError,
                                    filled: true,
                                    fillColor: const Color.fromRGBO(217, 217, 217, 1),
                                    border: novaNoticiaStore.titleError == null
                                        ? OutlineInputBorder(
                                            borderSide: BorderSide.none,
                                            borderRadius: BorderRadius.circular(8),
                                          )
                                        : OutlineInputBorder(
                                            borderSide: BorderSide(
                                              width: 1,
                                              color: Colors.redAccent,
                                            ),
                                            borderRadius: BorderRadius.circular(8),
                                          ),
                                    errorBorder: OutlineInputBorder(
                                      borderSide: BorderSide(
                                        width: 1,
                                        color: Colors.redAccent,
                                      ),
                                      borderRadius: BorderRadius.circular(8),
                                    ),
                                    hintText: "Título",
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
                                  onChanged: novaNoticiaStore.setContent,
                                  enabled: !novaNoticiaStore.loading,
                                  decoration: InputDecoration(
                                    errorText: novaNoticiaStore.ContentError,
                                    filled: true,
                                    fillColor: const Color.fromRGBO(217, 217, 217, 1),
                                    border: novaNoticiaStore.ContentError == null
                                        ? OutlineInputBorder(
                                            borderSide: BorderSide.none,
                                          )
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
                                    hintText: "Conteúdo da noticia",
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
                  Observer(
                    builder: (context) => Container(
                      margin: novaNoticiaStore.error != null ? const EdgeInsets.only(top: 47, bottom: 40) : EdgeInsets.only(top: 47),
                      width: 1340,
                      child: ErrorBox(
                        message: novaNoticiaStore.error,
                      ),
                    ),
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
                            child: GestureDetector(
                              onTap: novaNoticiaStore.invalidSendPressed,
                              child: ElevatedButton(
                                onPressed: novaNoticiaStore.publicarPressed,
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
                                child: novaNoticiaStore.loading
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
                    height: 51,
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

  Future<void> getImage1() async {
    FilePickerResult? image = await FilePicker.platform.pickFiles(type: FileType.image);
    if (image != null) {
      novaNoticiaStore.image1.clear();
      novaNoticiaStore.image1.add(image);
    }
  }

  Future<void> getImage2() async {
    final image = await FilePicker.platform.pickFiles(type: FileType.image);
    if (image != null) {
      novaNoticiaStore.setImage2(null);
      novaNoticiaStore.setImage2(image);
    }
  }
}
