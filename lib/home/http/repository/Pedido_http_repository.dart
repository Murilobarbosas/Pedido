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
  Future<Pedido> save(String nome, double valor, String descricao) async {
    try {
      var uri = Uri.parse('http://localhost:8080/android');
      final response = await http.post(uri,
          headers: <String, String>{"Content-Type": "application/json"},
          body: jsonEncode(<String, String>{
            "nome_produto": nome,
            "valor_produto": valor.toString(),
            "descricao": descricao
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
