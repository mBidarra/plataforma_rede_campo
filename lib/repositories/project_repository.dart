import 'package:parse_server_sdk_flutter/parse_server_sdk.dart';
import 'package:plataforma_rede_campo/models/project.dart';
import 'package:plataforma_rede_campo/repositories/table_keys.dart';

class ProjectRepository {
  Future<List<Project>> getAllNews() async {
    return Future.error('error');
  }

  Future<void> saveNews(Project project) async {
    final projectObject = ParseObject(keyProjectTable);

    //verifica se esta sendo editado uma news
    if (project.id != null) {
      projectObject.objectId = project.id;
    }
  }
}
