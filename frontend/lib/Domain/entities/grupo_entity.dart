class GrupoEntity {
  int? id;
  String? descricao;

  GrupoEntity(this.id, this.descricao);

  GrupoEntity.descricao(this.descricao);

//Fabrica retorna uma instância já criada
  factory GrupoEntity.fromMap(Map<String, dynamic> map) =>
      GrupoEntity(map['id'], map['descricao']);
}
