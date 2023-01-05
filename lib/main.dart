import 'dart:ui';

import 'package:flutter/material.dart';
import 'package:get_it/get_it.dart';
import 'package:parse_server_sdk_flutter/parse_server_sdk.dart';
import 'package:plataforma_rede_campo/models/field.dart';
import 'package:plataforma_rede_campo/models/news.dart';
import 'package:plataforma_rede_campo/models/user.dart';
import 'package:plataforma_rede_campo/repositories/news_repository.dart';
import 'package:plataforma_rede_campo/repositories/user_repository.dart';
import 'package:plataforma_rede_campo/stores/user_manager_store.dart';
import 'package:plataforma_rede_campo/views/cadastro_screen/cadastro_screen.dart';
import 'package:plataforma_rede_campo/views/home_screen/home_screen.dart';
import 'package:plataforma_rede_campo/views/login_screen/login_screen.dart';
import 'package:plataforma_rede_campo/views/novo_projeto_screen/novo_projeto_screen.dart';

void setupLocators() {
  GetIt.I.registerSingleton(UserManagerStore());
}

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

  /* final User user = User(
    name: 'sasdd',
    email: 'lucasevandro15@hotmail.com',
    password: '123456',
    phone: '45988224000',
    type: UserType.PESQUISADOR,
  );

  final User user2 = await UserRepository().signUp(user);*/

  //await UserRepository().loginWithEmail('lucasevandro11@hotmail.com', '123456');

  /*
  Project project = Project();
  project.title = 'titulo';
  project.description = 'descrição';

  ProjectRepository().saveProject(project);*/

  /*Field field = Field(id: 'SP3wDbxSav', areaCnpq: 'areaCnpq', description: 'description');
  News news = News(title: 'Noticia2', description: 'Teste2', field: field);

  await NewsRepository().saveNews(news);

  var allNews = NewsRepository().getAllNews();*/

  /*
  final user = User(id: 'O0x4Ydhmaz', name: 'name', email: 'email', phone: 'phone', type: UserType.PESQUISADOR);
  UserRepository().enableOrDisableUser(user: user, disable: true);
  */
}

class MyApp extends StatelessWidget {
  const MyApp({Key? key}) : super(key: key);

  @override
  Widget build(BuildContext context) {
    return MaterialApp(
      scrollBehavior: MaterialScrollBehavior().copyWith(
        dragDevices: {
          PointerDeviceKind.mouse,
          PointerDeviceKind.touch,
          PointerDeviceKind.stylus,
          PointerDeviceKind.unknown
        },
      ),
      title: "Plataforma Rede Campo",
      debugShowCheckedModeBanner: false,
      home: LoginScreen(),
    );
  }
}
