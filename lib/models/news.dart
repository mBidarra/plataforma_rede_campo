class News {
  News(
      {this.id,
      required this.titulo,
      required this.descricao,
      required this.campo,
      this.image,
      this.createdAt,
      this.updatedAt});

  String? id;
  String titulo;
  String descricao;
  String campo;
  //Autor autor;
  dynamic image;
  DateTime? createdAt;
  DateTime? updatedAt;
}
