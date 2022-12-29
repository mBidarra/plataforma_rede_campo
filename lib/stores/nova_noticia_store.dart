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
    if (!showErrors || formularioOpcionalValid || image2Valid) {
      return null;
    } else {
      return 'Insira imagen';
    }
  }

  @observable
  String? tituloImage2 = '';

  @action
  void setTituloImage2(String? value) => tituloImage2 = value;

  @computed
  bool get tituloImage2Valid => tituloImage2!.length >= 6;
  String? get tituloImage2Error {
    if (!showErrors || formularioOpcionalValid || tituloImage2Valid) {
      return null;
    } else if (tituloImage2!.isEmpty) {
      return 'Campo obrigatório';
    } else {
      return 'Título muito curto';
    }
  }

  @observable
  String? conteudoNoticiaOpcional = '';

  @action
  void setConteudoNoticiaOpcional(String? value) =>
      conteudoNoticiaOpcional = value;

  @computed
  bool get conteudoNoticiaOpcionalValid => conteudoNoticiaOpcional!.length >= 6;
  String? get conteudoNoticiaOpcionalError {
    if (!showErrors ||
        formularioOpcionalValid ||
        conteudoNoticiaOpcionalValid) {
      return null;
    } else if (conteudoNoticiaOpcional!.isEmpty) {
      return 'Campo obrigatório';
    } else {
      return 'Conteúdo muito curto';
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
  String? conteudoNoticia = '';

  @action
  void setConteudoNoticia(String? value) => conteudoNoticia = value;

  @computed
  bool get conteudoNoticiaValid => conteudoNoticia!.length >= 6;
  String? get conteudoNoticiaError {
    if (!showErrors || conteudoNoticiaValid) {
      return null;
    } else if (conteudoNoticia!.isEmpty) {
      return 'Campo obrigatório';
    } else {
      return 'Conteúdo muito curto';
    }
  }

  @computed
  bool get formularioOpcionalValid =>
      (image2.isEmpty &&
          tituloImage2!.isEmpty &&
          conteudoNoticiaOpcional!.isEmpty) ||
      (image2Valid && tituloImage2Valid && conteudoNoticiaOpcionalValid);

  @computed
  bool get formValid =>
      image1Valid &&
      tituloValid &&
      conteudoNoticiaValid &&
      formularioOpcionalValid;

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

  @action
  Future<void> _publicar() async {
    setLoading(true);

    await Future.delayed(Duration(seconds: 4));

    setLoading(false);
  }
}
