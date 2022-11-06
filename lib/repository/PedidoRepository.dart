// ignore_for_file: file_names

import 'package:lista_produtos/model/pedido.dart';

abstract class IPedidoRepository {
  Future<List<Pedido>> findAll();
  Future<Pedido> save(String nome, double valor, String descricao);
}
