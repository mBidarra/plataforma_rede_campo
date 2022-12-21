import 'package:mobx/mobx.dart';
import 'package:plataforma_rede_campo/helpers/extensions.dart';

/*Comando queprecisa executar no terminal:
flutter packages pub run build_runner watch
flutter pub run build_runner watch --delete-conflicting-outputs
*/

part 'login_store.g.dart';

enum TypeLogin { PESQUISADOR, ADMINISTRADOR }

class LoginStore = _LoginStore with _$LoginStore;

abstract class _LoginStore with Store {
  @observable
  TypeLogin typeLogin = TypeLogin.PESQUISADOR;

  @action
  void setTypeLogin(int? value) => typeLogin = TypeLogin.values[value!];

  @observable
  String? email = '';

  @action
  void setEmail(String value) => email = value;

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
  String? password = '';

  @action
  void setPassword(String value) => password = value;

  @computed
  bool get passwordValid => password != null && password!.length >= 6;

  String? get passwordError {
    if (!exibirErros || passwordValid) {
      return null;
    } else {
      return 'Senha deve ter 6 digitos';
    }
  }

  @observable
  bool passwordVisible = false;

  @action
  void setObscurePassword() => this.passwordVisible = !passwordVisible;

  @observable
  bool manterConectado = true;

  @action
  void setManterConectado() => this.manterConectado = !manterConectado;

  //para exibir os erros ou nao
  @observable
  bool exibirErros = false;

  @action
  void setExibirErros(bool value) => exibirErros = value;

  @observable
  bool loading = false;

  @action
  void setLoading(bool value) => loading = value;

  //usado para recebe a mensagem do erro que ouve erro no login
  @observable
  String? error;

  @action
  void setError(String? value) => error = value;

  //para quando clicar no botao sem os dados estarem validos exibir os erros
  @action
  void invalidSendPressed() => exibirErros = true;

  @computed
  bool get isFormValid => (emailValid && passwordValid);

  @computed
  //se os dados de login e senha sao validos e nao esta carregando ativa o botao e quando clicado chama a funcao _login
  dynamic get loginPressed => (isFormValid && !loading) ? _login : null;

  Future<void> _login() async {}
}
