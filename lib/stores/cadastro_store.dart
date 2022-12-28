import 'package:mobx/mobx.dart';
import 'package:plataforma_rede_campo/helpers/extensions.dart';

/*Comando queprecisa executar no terminal:
flutter packages pub run build_runner watch
flutter pub run build_runner watch --delete-conflicting-outputs
*/

part 'cadastro_store.g.dart';

class CadastroStore = _CadastroStore with _$CadastroStore;

abstract class _CadastroStore with Store {
  @observable
  String? nome = '';

  @action
  void setNome(String? value) => nome = value;

  @computed
  bool get nomeValid => nome != null && nome!.length >= 5;
  String? get nomeError {
    if (!exibirErros || nomeValid) {
      return null;
    } else if (nome!.isEmpty) {
      return 'Campo obrigatório';
    } else if (nome!.length < 5) {
      return "Nome muito curto";
    } else {
      return ('Nome invalido');
    }
  }

  @observable
  String? email = '';

  @action
  void setEmail(String? value) => email = value;

  @computed
  bool get emailValid => email != null && email!.isEmailValid();

  String? get emailError {
    if (!exibirErros || emailValid) {
      return null;
    } else {
      return 'E-mail invalido';
    }
  }

  @observable
  String? idadeText = '';

  @action
  void setIdadeText(String? value) => idadeText = value;

  @computed
  num? get idade {
    return num.tryParse(idadeText!);
  }

  bool get idadeValid => idade != null && idade! > 0 && idade! <= 100;
  String? get idadeError {
    if (!exibirErros || idadeValid) {
      return null;
    } else if (idadeText!.isEmpty) {
      return 'Campo obrigatório';
    } else {
      return 'Idade inválida';
    }
  }

  @observable
  String? telefone = '';

  @action
  void setTelefone(String? value) => telefone = value;

  @computed
  bool get telefoneValid => telefone != null && telefone!.length >= 14;

  String? get telefoneError {
    if (!exibirErros || telefoneValid) {
      return null;
    } else if (telefone!.isEmpty) {
      return 'Campo obrigatório';
    } else {
      return 'Telefone inválido';
    }
  }

  @computed
  bool get isFormValid =>
      nomeValid && emailValid && idadeValid && telefoneValid;

  @computed
  dynamic get cadastrarPressed => (isFormValid && !loading) ? _cadastrar : null;

  @observable
  bool exibirErros = false;

  @action
  void invalidSendPressed() => exibirErros = true;

  @observable
  bool loading = false;

  @action
  void setLoading(bool value) => loading = value;

  Future<void> _cadastrar() async {
    setLoading(true);

    await Future.delayed(const Duration(seconds: 4));

    setLoading(false);
  }
}
