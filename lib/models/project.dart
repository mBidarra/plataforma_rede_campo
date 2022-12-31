import 'package:parse_server_sdk_flutter/parse_server_sdk.dart';
import 'package:plataforma_rede_campo/models/user.dart';
import 'package:plataforma_rede_campo/repositories/table_keys.dart';
import 'package:plataforma_rede_campo/repositories/user_repository.dart';

class Project {
  Project();

  String? id;
  late String title;
  late String description;
  List? images = [];
  /*Autor autor;
  Coautores coautor;
  Tipo_de_trabalho tipo_de_trabalho;*/
  DateTime? createdAt;
  DateTime? updatedAt;
  User? autor;

  Project.fromParse(ParseObject parseObject) {
    id = parseObject.objectId;
    title = parseObject.get<String>(keyProjectTitle)!;
    description = parseObject.get<String>(keyProjectDescription)!;
    images = parseObject.get<List>(keyProjectImage)!.map((e) => e.url).toList();
    createdAt = parseObject.createdAt;
    updatedAt = parseObject.updatedAt;
    autor = UserRepository().mapParseToUser(parseObject.get<ParseUser>(keyProjectOwner)!);
  }

  @override
  String toString() {
    return 'Project{id: $id, title: $title, description: $description, images: $images, createdAt: $createdAt, updatedAt: $updatedAt, autor: $autor}';
  }
}
