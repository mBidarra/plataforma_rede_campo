import 'package:file_picker/file_picker.dart';
import 'package:flutter/foundation.dart';
import 'package:parse_server_sdk_flutter/parse_server_sdk.dart';
import 'package:plataforma_rede_campo/models/project.dart';
import 'package:plataforma_rede_campo/repositories/parse_errors.dart';
import 'package:plataforma_rede_campo/repositories/table_keys.dart';
import 'package:ansicolor/ansicolor.dart';
import 'package:path/path.dart' as path;

AnsiPen greenPen = AnsiPen()..green();

class ProjectRepository {
  Future<List<Project>> getAllProject() async {
    try {
      //especificando que a busca sera na tabela 'keyProjectTable'
      final queryBuilder = QueryBuilder<ParseObject>(ParseObject(keyProjectTable));

      queryBuilder.includeObject([keyProjectOwner]);

      //ordena pela data de criacao 'do mais novo para o mais velho'
      queryBuilder.orderByAscending(keyProjectCreatedAt);

      final response = await queryBuilder.query();

      if (response.success && response.results != null) {
        //response contem uma lista de ParseObject então precisamos converter essa lista em uma lista de Project
        //print(greenPen(response.results!));
        return response.results!.map((e) => Project.fromParse(e)).toList();
      } else if (response.success && response.results == null) {
        return [];
      } else {
        return Future.error(ParseErrors.getDescription(response.error!.code));
      }
    } catch (e) {
      return Future.error('Falha de conexão');
    }
  }

  Future<void> saveProject(Project project) async {
    try {
      //obtemos o usuario atual logado
      final parseUser = await ParseUser.currentUser() as ParseUser;

      final projectObject = ParseObject(keyProjectTable);

      //verifica se esta sendo editado uma news
      if (project.id != null) {
        projectObject.objectId = project.id;
      }

      final parseImage = await saveImage(project.image);

      //definir as permissões deste objeto(tabela)
      final parseAcl = ParseACL(owner: parseUser);
      parseAcl.setPublicReadAccess(allowed: true);
      parseAcl.setPublicWriteAccess(allowed: true);
      projectObject.setACL(parseAcl);

      projectObject.set<ParseWebFile>(keyProjectImage, parseImage);
      projectObject.set<String>(keyProjectTitle, project.title!);
      projectObject.set<String>(keyProjectDescription, project.content!);
      projectObject.set<ParseUser>(keyProjectOwner, parseUser);

      final response = await projectObject.save();

      if (!response.success) {
        return Future.error(ParseErrors.getDescription(response.error!.code));
      }
    } catch (e) {
      return Future.error('Falha ao salvar Project: ${e.toString()}');
    }
  }

  Future<ParseWebFile> saveImage(dynamic image) async {
    ParseWebFile parseImage;
    try {
      if (image is FilePickerResult) {
        if (kDebugMode) {
          print(greenPen('Imagem sem upload'));
        }
        final parseFile = ParseWebFile(image.files.first.bytes, name: 'image${DateTime.now().millisecondsSinceEpoch.toString()}.jpg');
        final response = await parseFile.save();
        parseImage = parseFile;
        if (!response.success) {
          return Future.error(ParseErrors.getDescription(response.error!.code));
        }
      } else {
        final parseFile = ParseWebFile(null, name: path.basename(image), url: image);
        parseImage = parseFile;
      }
      return parseImage;
    } catch (e) {
      return Future.error('Falha ao salvar imagens ${e.toString()}');
    }
  }

  Future<void> delete(Project project) async {
    final parseObject = ParseObject(keyProjectTable)..set(keyProjectId, project.id);

    //parseObject.set(keyAdStatus, AdStatus.DELETED.index);

    final response = await parseObject.save();
    if (!response.success) {
      return Future.error(ParseErrors.getDescription(response.error!.code));
    }
  }
}
