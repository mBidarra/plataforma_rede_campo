import 'package:mobx/mobx.dart';
import 'package:parse_server_sdk_flutter/parse_server_sdk.dart';
import 'package:path/path.dart' as path;
import 'package:plataforma_rede_campo/models/project.dart';
import 'package:plataforma_rede_campo/repositories/project_repository.dart';

/*Comando queprecisa executar no terminal:
flutter packages pub run build_runner watch
flutter pub run build_runner watch --delete-conflicting-outputs
*/

part 'novo_projeto_store.g.dart';

class NovoProjetoStore = _NovoProjetoStore with _$NovoProjetoStore;

abstract class _NovoProjetoStore with Store {
  _NovoProjetoStore(this.project) {
    title = project.title;
    image = project.image;
    content = project.content;
  }

  final Project project;

  @observable
  dynamic image;

  @action
  void setImage(dynamic value) => image = value;

  @computed
  bool get imageValid => image != null;
  String? get imageError {
    if (!showErrors || imageValid) {
      return null;
    } else {
      return 'Insira imagen';
    }
  }

  @observable
  String? title = '';

  @action
  void setTitle(String? value) => title = value;

  @computed
  bool get titleValid => title!.length >= 6;
  String? get titleError {
    if (!showErrors || titleValid) {
      return null;
    } else if (title!.isEmpty) {
      return 'Campo obrigatório';
    } else {
      return 'Título muito curto';
    }
  }

  @observable
  String? content = '';

  @action
  void setContent(String? value) => content = value;

  @computed
  bool get contentValid => content!.length >= 100;
  String? get contentError {
    if (!showErrors || contentValid) {
      return null;
    } else if (content!.isEmpty) {
      return 'Campo obrigatório';
    } else {
      return 'Descrição muito curta';
    }
  }

  @computed
  bool get formValid => imageValid && titleValid && contentValid;

  @computed
  dynamic get publicarPressed => (formValid && !loading) ? _publicar : null;

  @observable
  bool loading = false;

  @action
  void setLoading(bool value) => loading = value;

  @observable
  bool showErrors = false;

  @action
  void invalidSendPressed() => showErrors = true;

  @observable
  String? error;

  @action
  void setError(String? value) => error = value;

  @action
  Future<void> _publicar() async {
    setLoading(true);
    setError(null);

    Project project = Project();
    project.image = image;
    project.title = title;
    project.content = content;

    try {
      await ProjectRepository().saveProject(project);
    } catch (e) {
      setError(e.toString());
    }

    setLoading(false);
  }
}
