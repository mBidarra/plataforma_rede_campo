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

  Map<String, dynamic> toJson() => {
        "name": name,
        "email": email,
        "password": password,
        "phone": phone,
        "type": type.index,
      };

  @override
  String toString() {
    return 'User{id: $id, nome: $name, email: $email, senha: $password, telefone: $phone, userType: $type}';
  }
}
