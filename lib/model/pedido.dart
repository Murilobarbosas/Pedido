import 'dart:convert';

// ignore_for_file: public_member_api_docs, sort_constructors_first

class Pedido {
  int id;
  String descricao;
  String nome_pedido;
  String valor_pedido;
  
  Pedido({
    required this.id,
    required this.descricao,
    required this.nome_pedido,
    required this.valor_pedido,
  });

  Pedido copyWith({
    int? id,
    String? descricao,
    String? nome_pedido,
    String? valor_pedido,
  }) {
    return Pedido(
      id: id ?? this.id,
      descricao: descricao ?? this.descricao,
      nome_pedido: nome_pedido ?? this.nome_pedido,
      valor_pedido: valor_pedido ?? this.valor_pedido,
    );
  }

  Map<String, dynamic> toMap() {
    return <String, dynamic>{
      'id': id,
      'descricao': descricao,
      'nome_pedido': nome_pedido,
      'valor_pedido': valor_pedido,
    };
  }

  factory Pedido.fromMap(Map<String, dynamic> map) {
    return Pedido(
      id: map['id'] as int,
      descricao: map['descricao'] as String,
      nome_pedido: map['nome_pedido'] as String,
      valor_pedido: map['valor_pedido'] as String,
    );
  }

  String toJson() => json.encode(toMap());

  factory Pedido.fromJson(String source) =>
      Pedido.fromMap(json.decode(source) as Map<String, dynamic>);

  @override
  String toString() {
    return 'Pedido(id: $id, descricao: $descricao, nome_pedido: $nome_pedido, valor_pedido: $valor_pedido)';
  }

  @override
  bool operator ==(covariant Pedido other) {
    if (identical(this, other)) return true;

    return other.id == id &&
        other.descricao == descricao &&
        other.nome_pedido == nome_pedido &&
        other.valor_pedido == valor_pedido;
  }

  @override
  int get hashCode {
    return id.hashCode ^
        descricao.hashCode ^
        nome_pedido.hashCode ^
        valor_pedido.hashCode;
  }
}
