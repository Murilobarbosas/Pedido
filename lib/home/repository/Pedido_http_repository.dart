// ignore_for_file: file_names

import 'dart:convert';

import 'package:lista_produtos/model/pedido.dart';
import 'package:http/http.dart' as http;

class PedidoHttpRepository {
  @override
  Future<Pedido> fetchPedido() async {
    var uri = Uri.parse('http://localhost:8080/home');
    final response = await http.get(uri);
    if (response.statusCode == 200) {
      return jsonDecode(response.body) as Pedido;
    } else {
      throw Exception("Failed to load album");
    }
  }
}
