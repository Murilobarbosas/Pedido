// ignore_for_file: public_member_api_docs, sort_constructors_first
import 'package:get/get.dart';
import 'package:lista_produtos/repository/PedidoRepository.dart';

class HttpController extends GetxController with StateMixin {
  final IPedidoRepository _httpRepository;

  HttpController(
    this._httpRepository,
  );

  @override
  void onInit() {
    super.onInit();
    findPedido();
  }

  Future<void> findPedido() async {
    change([], status: RxStatus.loading());
    try {
      final dados = await _httpRepository.findAllPedido();
      change(dados, status: RxStatus.success());
    } catch (e) {
      print(e);
      change([], status: RxStatus.error('Erro ao buscar Pedidos'));
    }
  }
}
