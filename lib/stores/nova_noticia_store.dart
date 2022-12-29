import 'package:mobx/mobx.dart';

/*Comando queprecisa executar no terminal:
flutter packages pub run build_runner watch
flutter pub run build_runner watch --delete-conflicting-outputs
*/

part 'nova_noticia_store.g.dart';

class NovaNoticiaStore = _NovaNoticiaStore with _$NovaNoticiaStore;

abstract class _NovaNoticiaStore with Store {
  ObservableList image1 = ObservableList();

  @computed
  bool get image1Valid => image1.isNotEmpty;

  String? get image1Error {
    if (!showErrors || image1Valid) {
      return null;
    } else {
      return 'Insira imagen';
    }
  }

  ObservableList image2 = ObservableList();

  @computed
  bool get image2Valid => image2.isNotEmpty;

  String? get image2Error {
    if (!showErrors || image1Valid) {
      return null;
    } else {
      return 'Insira imagen';
    }
  }

  @computed
  bool get formValid => true;

  @computed
  dynamic get publicarPressed => (formValid && !loading) ? _publicar : null;

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
