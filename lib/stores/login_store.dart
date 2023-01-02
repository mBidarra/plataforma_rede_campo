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
  String? email2 = '';

  @action
  void setEmail2(String? value) => email2 = value;

  @computed
  bool get email2Valid => email2 != null && email == email2;
  String? get email2Error {
    if (!exibirErros || email2Valid) {
      return null;
    } else {
      return "E-mails não coincidem";
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

  @observable
  bool esqueceuSenha = false;

  @action
  void setEsqueceuSenha() => this.esqueceuSenha = !esqueceuSenha;

  //para quando clicar no botao sem os dados estarem validos exibir os erros
  @action
  void invalidSendPressed() => exibirErros = true;

  @computed
  bool get isFormValid => (emailValid && passwordValid);

  @computed
  dynamic get loginPressed => (isFormValid && !loading) ? _login : null;

  @computed
  dynamic get recoverPasswordPressed => (emailValid && email2Valid && !loading) ? _recoverPassword : null;

  Future<void> _login() async {
    setLoading(true);

    setError('asdasd');

    await Future.delayed(Duration(seconds: 4));

    setLoading(false);

    setError(null);
  }

  Future<void> _recoverPassword() async {
    setLoading(true);

    setError('asdasd');

    await Future.delayed(Duration(seconds: 4));

    setLoading(false);

    setError(null);
  }
}
