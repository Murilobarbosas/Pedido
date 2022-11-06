import 'dart:convert';

// ignore_for_file: public_member_api_docs, sort_constructors_first

class Pedido {
  int id;
  String nomeProduto;
  double valorProduto;
  String descricao;
  Pedido({
    required this.id,
    required this.nomeProduto,
    required this.valorProduto,
    required this.descricao,
  });

  Pedido copyWith({
    int? id,
    String? nomeProduto,
    double? valorProduto,
    String? descricao,
  }) {
    return Pedido(
      id: id ?? this.id,
      nomeProduto: nomeProduto ?? this.nomeProduto,
      valorProduto: valorProduto ?? this.valorProduto,
      descricao: descricao ?? this.descricao,
    );
  }

  Map<String, dynamic> toMap() {
    return <String, dynamic>{
      'id': id,
      'nomeProduto': nomeProduto,
      'valorProduto': valorProduto,
      'descricao': descricao,
    };
  }

  factory Pedido.fromMap(Map<String, dynamic> map) {
    return Pedido(
      id: map['id'] as int,
      nomeProduto: map['nomeProduto'] as String,
      valorProduto: map['valorProduto'] as double,
      descricao: map['descricao'] as String,
    );
  }

  String toJson() => json.encode(toMap());

  factory Pedido.fromJson(String source) =>
      Pedido.fromMap(json.decode(source) as Map<String, dynamic>);

  @override
  String toString() {
    return 'Pedido(id: $id, nomeProduto: $nomeProduto, valorProduto: $valorProduto, descricao: $descricao)';
  }

  @override
  bool operator ==(covariant Pedido other) {
    if (identical(this, other)) return true;

    return other.id == id &&
        other.nomeProduto == nomeProduto &&
        other.valorProduto == valorProduto &&
        other.descricao == descricao;
  }

  @override
  int get hashCode {
    return id.hashCode ^
        nomeProduto.hashCode ^
        valorProduto.hashCode ^
        descricao.hashCode;
  }
}
