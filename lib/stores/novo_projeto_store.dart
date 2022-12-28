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

  @computed
  bool get formValid => imageValid;

  @computed
  dynamic get publicarPressed => formValid ? _publicar : null;

  @observable
  bool loading = false;

  @action
  void setLoading(bool value) => loading = value;

  @observable
  bool showErrors = true;

  @action
  void invalidSendPressed() => showErrors = true;

  @action
  Future<void> _publicar() async {
    setLoading(true);

    await Future.delayed(Duration(seconds: 4));

    setLoading(false);
  }
}
