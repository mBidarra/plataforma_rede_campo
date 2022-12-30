enum UserType { ADMINISTRADOR, PESQUISADOR }

class User {
  User(this.id, this.nome, this.email, this.senha, this.telefone, this.userType);

  String? id;
  String? nome;
  String? email;
  String? senha;
  String? telefone;
  UserType? userType;

  @override
  String toString() {
    return 'User{id: $id, nome: $nome, email: $email, senha: $senha, telefone: $telefone, userType: $userType}';
  }
}
