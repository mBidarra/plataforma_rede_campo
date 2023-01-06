import 'package:parse_server_sdk_flutter/parse_server_sdk.dart';
import 'package:plataforma_rede_campo/models/field.dart';

import '../repositories/table_keys.dart';

class News {
  News({
    this.id,
    this.title,
    this.titleImage2,
    this.content,
    this.optionalContent,
    this.field,
    this.image,
    this.createdAt,
    this.updatedAt,
  });

  String? id;
  String? title;
  String? titleImage2;
  String? content;
  String? optionalContent;
  Field? field;
  //Autor autor;
  dynamic image;
  DateTime? createdAt;
  DateTime? updatedAt;

  News.fromParse(ParseObject parseObject) {
    id = parseObject.objectId;
    title = parseObject.get<String>(keyNewsTitle)!;
    titleImage2 = parseObject.get<String>(keyNewsTitleImage2);
    content = parseObject.get<String>(keyNewsContent)!;
    optionalContent = parseObject.get<String>(keyNewsOptionalContent);
    field = Field.fromParse(parseObject.get<ParseObject>(keyNewsField)!);
    createdAt = parseObject.createdAt;
    updatedAt = parseObject.updatedAt;
  }
}
