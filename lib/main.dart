import 'package:flutter/material.dart';
import 'package:get_it/get_it.dart';
import 'package:plataforma_rede_campo/views/cadastro_screen/cadastro_screen.dart';
import 'package:plataforma_rede_campo/views/home_screen/home_screen.dart';
import 'package:plataforma_rede_campo/views/login_screen/login_screen.dart';

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
  /*const appId = '8MmuFHBcTejklfFhxsvS03gy0XIijosSQp6l5Da8';
  const serverURL = 'https://parseapi.back4app.com/';
  const clientKey = 'Jbohcr47krRtH2YnPuusp5xLHvXYH7GNMSmcuRnA';

  await Parse().initialize(
    appId,
    serverURL,
    clientKey: clientKey,
    autoSendSessionId: true,
    debug: true,
  );*/
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
