import 'package:lista_produtos/Providers/provider.dart';
import 'package:lista_produtos/Service/Service.dart';
import 'package:lista_produtos/View/adicionar.dart';
import 'package:lista_produtos/model/pedido.dart';
import 'package:flutter/material.dart';
import 'package:provider/provider.dart';

class HomePage extends StatefulWidget {
  const HomePage({Key? key}) : super(key: key);

  @override
  State<HomePage> createState() => _HomePageState();
}

class _HomePageState extends State<HomePage> {
  late List<Pedido> pedido = [];

  @override
  void initState() {
    super.initState();
    _getData();
  }

  void _getData() async {
    pedido = (await Service().findAll());
    Future.delayed(const Duration(seconds: 1)).then((value) => setState(() {}));
  }

  @override
  Widget build(BuildContext context) {
    return Consumer<Providers>(builder: (context, value, child) {
      _getData();
      return Scaffold(
        appBar: AppBar(
          title: const Text('Pedido'),
          actions: [
            IconButton(
                onPressed: () {
                  setState(() {
                    _getData();
                  });
                },
                icon: const Icon(Icons.refresh))
          ],
        ),
        body: Padding(
          padding: const EdgeInsets.all(16.0),
          child: ListView.builder(
            itemCount: pedido.length,
            itemBuilder: (context, index) {
              final Pedido item = pedido[index];
              return ListTile(
                title: Text(item.nome_pedido),
                subtitle: Text(item.descricao),
                trailing: Text('R\$ ' + item.valor_pedido),
              );
            },
          ),
        ),
        floatingActionButton: FloatingActionButton(
            child: const Icon(Icons.add_circle),
            backgroundColor: Colors.blueAccent,
            onPressed: () {
              Navigator.push(context,
                  MaterialPageRoute(builder: (context) => const Adicionar()));
            }),
      );
    });
  }
}
