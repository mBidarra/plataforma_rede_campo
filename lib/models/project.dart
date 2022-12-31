class Project {
  Project(
    this.id,
    this.title,
    this.description,
    this.images,
    this.createdAt,
    this.updatedAt,
  );

  String? id;
  String title;
  String description;
  List images = [];
  /*Autor autor;
  Coautores coautor;
  Tipo_de_trabalho tipo_de_trabalho;*/
  DateTime? createdAt;
  DateTime? updatedAt;
}
