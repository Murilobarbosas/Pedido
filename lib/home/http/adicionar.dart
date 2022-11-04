import 'package:flutter/material.dart';
import 'package:flutter/src/foundation/key.dart';
import 'package:flutter/src/widgets/container.dart';
import 'package:flutter/src/widgets/framework.dart';

class Adicionar extends StatefulWidget {
  const Adicionar({Key? key}) : super(key: key);

  @override
  State<Adicionar> createState() => _AdicionarState();
}

class _AdicionarState extends State<Adicionar> {
  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(
        title: const Text("Pedido"),
      ),
      body: Center(
          child: Column(children: <Widget>[
        const Padding(
            padding: EdgeInsets.all(10.0),
            child: TextField(
                decoration: InputDecoration(
              border: UnderlineInputBorder(),
              labelText: 'Nome',
            ))),
        const Padding(
            padding: EdgeInsets.all(10.0),
            child: TextField(
                decoration: InputDecoration(
              border: UnderlineInputBorder(),
              labelText: 'Valor',
            ))),
        const Padding(
            padding: EdgeInsets.all(10.0),
            child: TextField(
                decoration: InputDecoration(
              border: UnderlineInputBorder(),
              labelText: 'Descricao',
            ))),
        const SizedBox(height: 10),
        ElevatedButton(
          onPressed: () {},
          child: const Text('Cadastrar Novo Produto',
              style: TextStyle(fontSize: 20)),
        )
      ])),
    );
  }
}
