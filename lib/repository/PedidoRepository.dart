// ignore_for_file: file_names

import '../model/pedido.dart';

abstract class IPedidoRepository {
  Future<List<Pedido>> findAllPedido();
}
