// ignore_for_file: file_names

import 'dart:convert';

import 'package:lista_produtos/model/pedido.dart';
import 'package:http/http.dart' as http;
import 'package:lista_produtos/repository/PedidoRepository.dart';

class PedidoHttpRepository implements IPedidoRepository {
  @override
  Future<List<Pedido>> findAll() async {
    try {
      var uri = Uri.parse('http://localhost:8080/android');
      final response = await http.get(uri);
      final List<dynamic> responseMap = jsonDecode(response.body);
      return responseMap.map<Pedido>((resp) => Pedido.fromMap(resp)).toList();
    } catch (e) {
      print(e);
      rethrow;
    }
  }

  @override
  Future<Pedido> save(
      String descricao, String nome_produto, String valor_produto) async {
    try {
      var uri = Uri.parse('http://localhost:8080/android');
      final response = await http.post(uri,
          headers: <String, String>{"Content-Type": "application/json"},
          body: jsonEncode(<String, String>{
            "descricao": descricao,
            "nome_produto": nome_produto,
            "valor_produto": valor_produto
          }));
      String responseString = response.body;
      Pedido p = responseString as Pedido;
      return p;
    } catch (e) {
      print(e);
      rethrow;
    }
  }
}
