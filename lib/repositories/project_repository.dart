import 'package:parse_server_sdk_flutter/parse_server_sdk.dart';
import 'package:plataforma_rede_campo/models/project.dart';
import 'package:plataforma_rede_campo/repositories/parse_errors.dart';
import 'package:plataforma_rede_campo/repositories/table_keys.dart';

class ProjectRepository {
  Future<List<Project>> getAllProject() async {
    return Future.error('error');
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

      //definir as permissões deste objeto(tabela)
      final parseAcl = ParseACL(owner: parseUser);
      parseAcl.setPublicReadAccess(allowed: true);
      parseAcl.setPublicWriteAccess(allowed: true);
      projectObject.setACL(parseAcl);

      projectObject.set<String>(keyProjectTitle, project.title);
      projectObject.set<String>(keyProjectDescription, project.description);
      projectObject.set<ParseUser>(keyProjectOwner, parseUser);

      final response = await projectObject.save();
      if (!response.success) {
        return Future.error(ParseErrors.getDescription(response.error!.code));
      }
    } catch (e) {
      return Future.error('Falha ao salvar Project: ${e.toString()}');
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
