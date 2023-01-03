import 'package:parse_server_sdk_flutter/parse_server_sdk.dart';
import 'package:plataforma_rede_campo/models/field.dart';

import '../repositories/table_keys.dart';

class News {
  News({
    this.id,
    required this.title,
    required this.description,
    required this.field,
    this.image,
    this.createdAt,
    this.updatedAt,
  });

  String? id;
  late String title;
  late String description;
  late Field field;
  //Autor autor;
  dynamic image;
  DateTime? createdAt;
  DateTime? updatedAt;

  News.fromParse(ParseObject parseObject) {
    id = parseObject.objectId;
    title = parseObject.get<String>(keyNewsTitle)!;
    description = parseObject.get<String>(keyNewsDescription)!;
    field = Field.fromParse(parseObject.get<ParseObject>(keyNewsField)!);
    createdAt = parseObject.createdAt;
    updatedAt = parseObject.updatedAt;
  }
}
