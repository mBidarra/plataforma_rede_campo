import 'package:flutter/material.dart';
import 'package:get_it/get_it.dart';
import 'package:parse_server_sdk_flutter/parse_server_sdk.dart';
import 'package:plataforma_rede_campo/views/cadastro_screen/cadastro_screen.dart';
import 'package:plataforma_rede_campo/views/home_screen/home_screen.dart';
import 'package:plataforma_rede_campo/views/home_screen_pesquisador/home_screen_pesquisador.dart';
import 'package:plataforma_rede_campo/views/login_screen/login_screen.dart';
import 'package:plataforma_rede_campo/views/nova_noticia_screen/nova_noticia_screen.dart';
import 'package:plataforma_rede_campo/views/novo_projeto_screen/novo_projeto_screen.dart';

void setupLocators() {}

Future<void> main() async {
  WidgetsFlutterBinding.ensureInitialized();
  //inicializando o ParseServer
  await inicializeParse();
  //chamar a funcao setupLocators() para que os objetos contidos nela possam ser acessados de qualquer local do app
  setupLocators();
  runApp(const MyApp());
}

Future<void> inicializeParse() async {
  const appId = 'qcqRQberoTPqvNNhXucLuV9lXnjr99hKSFQYCyBN';
  const serverURL = 'https://parseapi.back4app.com/';
  const clientKey = 'cS0ljFgSDhurM8oGaZyO6NoQW4kEUcaa9Y1guGe8';

  await Parse().initialize(
    appId,
    serverURL,
    clientKey: clientKey,
    autoSendSessionId: true,
    debug: true,
  );

  /*final categoria = ParseObject('cat')..set('tit', 'roupa');

  final response = await categoria.save();

  print(response.success);*/
}

class MyApp extends StatelessWidget {
  const MyApp({Key? key}) : super(key: key);

  @override
  Widget build(BuildContext context) {
    return MaterialApp(
      title: "Plataforma Rede Campo",
      debugShowCheckedModeBanner: false,
      home: LoginScreen(),
    );
  }
}
