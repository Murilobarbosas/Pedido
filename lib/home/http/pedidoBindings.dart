// ignore_for_file: file_names

import 'package:lista_produtos/home/http/pedidoController.dart';
import 'package:lista_produtos/home/http/repository/Pedido_http_repository.dart';
import 'package:lista_produtos/repository/PedidoRepository.dart';
import 'package:get/get.dart';

class PedidoBindings implements Bindings {
  @override
  void dependencies() {
    Get.put<IPedidoRepository>(PedidoHttpRepository());
    Get.put(PedidoController(Get.find()));
  }
}
