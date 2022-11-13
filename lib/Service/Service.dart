import 'dart:convert';

import 'package:lista_produtos/model/pedido.dart';
import 'package:http/http.dart' as http;
import 'package:lista_produtos/repository/PedidoRepository.dart';

class Service implements IPedidoRepository {
  @override
  Future<List<Pedido>> findAll() async {
    try {
      var uri = Uri.parse('http://localhost:8080/android');
      final response = await http.get(uri);
      final List<dynamic> data = jsonDecode(response.body);
      return data.map<Pedido>((resp) => Pedido.fromMap(resp)).toList();
    } catch (e) {
      print(e);
      rethrow;
    }
  }

  @override
  Future<String> save(
      String descricao, String nome_pedido, String valor_pedido) async {
    try {
      var uri = Uri.parse('http://localhost:8080/android');
      var response = await http.post(uri, body: {
        "descricao": descricao,
        "nome_pedido": nome_pedido,
        "valor_pedido": valor_pedido
      });
      return response.body;
    } catch (e) {
      print(e);
      rethrow;
    }
  }
}
