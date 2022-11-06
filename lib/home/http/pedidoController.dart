import 'package:lista_produtos/repository/PedidoRepository.dart';
import 'package:get/get.dart';

class PedidoController extends GetxController with StateMixin {
  final IPedidoRepository pedidoRepository;

  PedidoController(this.pedidoRepository);

  @override
  void onInit() {
    super.onInit();
    findAll();
  }

  Future<void> findAll() async {
    change([], status: RxStatus.loading());
    try {
      final dados = await pedidoRepository.findAll();
      change(dados, status: RxStatus.success());
    } catch (e) {
      print(e);
      change([], status: RxStatus.error('Erro ao buscar usuários'));
    }
  }
}
