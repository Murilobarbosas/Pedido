import 'package:lista_produtos/home/http/HttpController.dart';
import 'package:lista_produtos/home/http/adicionar.dart';
import 'package:lista_produtos/model/pedido.dart';
import 'package:flutter/material.dart';
import 'package:get/get.dart';

class HomePage extends GetView<HttpController> {
  const HomePage({Key? key}) : super(key: key);

  @override
  Widget build(BuildContext context) {
    return Scaffold(
        appBar: AppBar(
          title: const Text('Pedidos'),
        ),
        body: controller.obx((state) {
          return Center(
              child: Column(children: [
            FloatingActionButton(
                backgroundColor: Colors.blueAccent,
                child: const Icon(
                  Icons.add_circle_sharp,
                  color: Colors.white,
                ),
                onPressed: () {
                  Get.toNamed("/adicionar");
                }),
            ListView.builder(
              itemCount: state.length,
              itemBuilder: ((context, index) {
                final Pedido item = state[index];
                return ListTile(
                  title: Text(item.nomeProduto),
                  subtitle: Text(
                      item.valorProduto.toString() + "\n" + item.descricao),
                );
              }),
            )
          ]));
        }, onError: (error) {
          return SizedBox(
              width: double.infinity,
              child: Column(
                  mainAxisAlignment: MainAxisAlignment.center,
                  children: [
                    Text(error.toString()),
                    TextButton(
                        onPressed: () => controller.findPedido(),
                        child: const Text('Tentar Novamente'))
                  ]));
        }));
  }
}
