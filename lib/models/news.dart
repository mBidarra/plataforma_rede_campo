import 'package:parse_server_sdk_flutter/parse_server_sdk.dart';
import 'package:plataforma_rede_campo/models/field.dart';

import '../repositories/table_keys.dart';

class News {
  News({
    this.id,
    required this.title,
    this.titleImage2,
    required this.description,
    this.optionalDescription,
    required this.field,
    this.image,
    this.createdAt,
    this.updatedAt,
  });

  String? id;
  late String title;
  String? titleImage2;
  late String description;
  String? optionalDescription;
  late Field field;
  //Autor autor;
  dynamic image;
  DateTime? createdAt;
  DateTime? updatedAt;

  News.fromParse(ParseObject parseObject) {
    id = parseObject.objectId;
    title = parseObject.get<String>(keyNewsTitle)!;
    titleImage2 = parseObject.get<String>(keyNewsTitleImage2);
    description = parseObject.get<String>(keyNewsDescription)!;
    optionalDescription = parseObject.get<String>(keyNewsOptionalDescription);
    field = Field.fromParse(parseObject.get<ParseObject>(keyNewsField)!);
    createdAt = parseObject.createdAt;
    updatedAt = parseObject.updatedAt;
  }
}
