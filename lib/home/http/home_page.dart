import 'package:get/get.dart';
import 'package:lista_produtos/home/http/pedidoController.dart';
import 'package:lista_produtos/model/pedido.dart';
import 'package:flutter/material.dart';

class HomePage extends GetView<PedidoController> {
  const HomePage({Key? key}) : super(key: key);

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(
        title: const Text('Http'),
      ),
      body: controller.obx((state) {
        return ListView.builder(
          itemCount: state.length,
          itemBuilder: (_, index) {
            final Pedido item = state[index];
            return ListTile(
              title: Text(item.nomeProduto),
              subtitle: Text(item.descricao),
            );
          },
        );
      }, onError: (error) {
        return SizedBox(
          width: double.infinity,
          child: Column(
            mainAxisAlignment: MainAxisAlignment.center,
            children: [
              Text(error.toString()),
              TextButton(
                onPressed: () => controller.findAll(),
                child: const Text('Tentar novamente'),
              )
            ],
          ),
        );
      }),
      floatingActionButton: FloatingActionButton(
          child: const Icon(Icons.add_circle),
          backgroundColor: Colors.blueAccent,
          onPressed: (() {
            Get.toNamed('/adicionar');
          })),
    );
  }
}
