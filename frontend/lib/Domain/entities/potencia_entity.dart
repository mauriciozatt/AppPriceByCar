class PotenciaEntity {
  int? id;
  String? descricao;
  double? valor;
  int? cavalaria;

  PotenciaEntity(this.id, this.descricao, this.valor, this.cavalaria);

  factory PotenciaEntity.fromMap(Map<String, dynamic> map) => 
    PotenciaEntity(
      map['id'], 
      map['descricao'], 
      map['valor'], 
      map['cavalaria']
    );
}
