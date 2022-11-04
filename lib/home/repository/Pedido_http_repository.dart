import 'dart:convert';

import 'package:flutter/widgets.dart';
import 'package:lista_produtos/repository/PedidoRepository.dart';
import 'package:lista_produtos/model/pedido.dart';
import 'package:http/http.dart' as http;

class PedidoHttpRepository implements IPedidoRepository {
  @override
  Future<List<Pedido>> findAllPedido() async {
    var uri = Uri.parse('http://localhost:8080/home');
    final response = await http.get(uri);
    try {
      final List<dynamic> responseMap = jsonDecode(response.body);
      return responseMap.map<Pedido>((resp) => Pedido.fromMap(resp)).toList();
    } catch (e) {
      return;
    }
  }
}
