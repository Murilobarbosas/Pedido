import 'package:lista_produtos/home/repository/Pedido_http_repository.dart';
import 'package:lista_produtos/model/pedido.dart';
import 'package:flutter/material.dart';

class HomePage extends StatefulWidget {
  HomePage({Key? key}) : super(key: key);

  @override
  State<HomePage> createState() => _HomePageState();
}

class _HomePageState extends State<HomePage> {
  late Future<Pedido> futurePedido;

  @override
  void initState() {
    super.initState();
    PedidoHttpRepository p = PedidoHttpRepository();
    futurePedido = p.fetchPedido();
  }

  @override
  Widget build(BuildContext context) {
    return FutureBuilder<Pedido>(
      future: futurePedido,
      builder: (context, snapshot) {
        if (snapshot.hasData) {
          return Text(snapshot.data!.nomeProduto);
        } else if (snapshot.hasError) {
          return Text("${snapshot.error}");
        }
        return const CircularProgressIndicator();
      },
    );
  }
}
