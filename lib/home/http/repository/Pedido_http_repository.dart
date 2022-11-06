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
}
