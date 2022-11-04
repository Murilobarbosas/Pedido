import 'package:get/get.dart';
import 'package:lista_produtos/home/http/HttpController.dart';
import 'package:lista_produtos/home/repository/Pedido_http_repository.dart';
import 'package:lista_produtos/home/repository/Pedido_http_repository.dart';
import 'package:lista_produtos/repository/PedidoRepository.dart';

class HttpBindings implements Bindings {
  @override
  void dependencies() {
    Get.put<IPedidoRepository>(PedidoHttpRepository());
    Get.put(HttpController(Get.find()));
  }
}
