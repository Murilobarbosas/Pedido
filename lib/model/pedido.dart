// ignore_for_file: public_member_api_docs, sort_constructors_first
import 'dart:convert';

class Pedido {
  String id;
  String nomeProduto;
  double valorProduto;
  String descricao;

  Pedido({
    required this.id,
    required this.descricao,
    required this.nomeProduto,
    required this.valorProduto,
  });

  Map<String, dynamic> toMap() {
    return <String, dynamic>{
      'id': id,
      'descricao': descricao,
      'nomeProduto': nomeProduto,
      'valorProduto': valorProduto,
    };
  }

  factory Pedido.fromMap(Map<String, dynamic> map) {
    return Pedido(
      id: map['id'] as String,
      descricao: map['descricao'] as String,
      nomeProduto: map['nomeProduto'] as String,
      valorProduto: map['valorProduto'] as double,
    );
  }

  String toJson() => json.encode(toMap());

  factory Pedido.fromJson(String source) =>
      Pedido.fromMap(json.decode(source) as Map<String, dynamic>);
}
