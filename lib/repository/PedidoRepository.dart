// ignore_for_file: file_names, non_constant_identifier_names

import 'package:lista_produtos/model/pedido.dart';

abstract class IPedidoRepository {
  Future<List<Pedido>> findAll();
  Future<String> save(
      String descricao, String nome_produto, String valor_produto);
}
