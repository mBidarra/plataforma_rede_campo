import 'package:mobx/mobx.dart';

/*Comando queprecisa executar no terminal:
flutter packages pub run build_runner watch
flutter pub run build_runner watch --delete-conflicting-outputs
*/

part 'novo_projeto_store.g.dart';

class NovoProjetoStore = _NovoProjetoStore with _$NovoProjetoStore;

abstract class _NovoProjetoStore with Store {
  ObservableList image = ObservableList();

  @computed
  bool get imageValid => image.isNotEmpty;
  String? get imageError {
    if (!showErrors || imageValid) {
      return null;
    } else {
      return 'Insira imagen';
    }
  }

  @observable
  String? titulo = '';

  @action
  void setTitulo(String? value) => titulo = value;

  @computed
  bool get tituloValid => titulo!.length >= 6;
  String? get tituloError {
    if (!showErrors || tituloValid) {
      return null;
    } else if (titulo!.isEmpty) {
      return 'Campo obrigatório';
    } else {
      return 'Título muito curto';
    }
  }

  @observable
  String? descricao = '';

  @action
  void setDescricao(String? value) => descricao = value;

  @computed
  bool get descricaoValid => descricao!.length >= 100;
  String? get descricaoError {
    if (!showErrors || descricaoValid) {
      return null;
    } else if (descricao!.isEmpty) {
      return 'Campo obrigatório';
    } else {
      return 'Descrição muito curta';
    }
  }

  @computed
  bool get formValid => imageValid && tituloValid && descricaoValid;

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

    setError('asdasd');

    await Future.delayed(Duration(seconds: 4));

    setLoading(false);

    setError(null);
  }
}
