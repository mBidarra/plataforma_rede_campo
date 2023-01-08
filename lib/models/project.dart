import 'package:parse_server_sdk_flutter/parse_server_sdk.dart';
import 'package:plataforma_rede_campo/models/user.dart';
import 'package:plataforma_rede_campo/repositories/table_keys.dart';
import 'package:plataforma_rede_campo/repositories/user_repository.dart';

class Project {
  Project({
    this.id,
    this.title,
    this.content,
    this.image,
    this.createdAt,
    this.updatedAt,
    this.autor,
  });

  String? id;
  String? title;
  String? content;
  dynamic image;
  /*Autor autor;
  Coautores coautor;
  Tipo_de_trabalho tipo_de_trabalho;*/
  DateTime? createdAt;
  DateTime? updatedAt;
  User? autor;

  Project.fromParse(ParseObject parseObject) {
    id = parseObject.objectId;
    title = parseObject.get<String>(keyProjectTitle)!;
    content = parseObject.get<String>(keyProjectDescription)!;
    image = parseObject.get(keyProjectImage)..url;
    createdAt = parseObject.createdAt;
    updatedAt = parseObject.updatedAt;
    autor = UserRepository().mapParseToUser(parseObject.get<ParseUser>(keyProjectOwner)!);
  }

  @override
  String toString() {
    return 'Project{id: $id, title: $title, content: $content, image: $image, createdAt: $createdAt, updatedAt: $updatedAt, autor: $autor}';
  }
}
