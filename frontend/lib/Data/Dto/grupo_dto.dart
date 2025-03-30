class GrupoDto {
  String? descricao;

  GrupoDto(this.descricao);

  Map<String, dynamic> toMap() => {
    'descricao': descricao
  };
}
