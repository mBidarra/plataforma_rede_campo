enum UserType { ADMINISTRADOR, PESQUISADOR }

class User {
  User({
    this.id,
    required this.name,
    required this.email,
    this.password,
    required this.phone,
    required this.type,
    this.createdAt,
  });

  String? id;
  String name;
  String email;
  String? password;
  String phone;
  UserType type;
  DateTime? createdAt;

  @override
  String toString() {
    return 'User{id: $id, nome: $name, email: $email, senha: $password, telefone: $phone, userType: $type}';
  }
}
