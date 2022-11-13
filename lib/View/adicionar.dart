// ignore_for_file: non_constant_identifier_names

import 'package:flutter/material.dart';
import 'package:lista_produtos/Providers/provider.dart';
import 'package:lista_produtos/Service/Service.dart';
import 'package:provider/provider.dart';

class Adicionar extends StatefulWidget {
  const Adicionar({Key? key}) : super(key: key);

  @override
  State<Adicionar> createState() => _AdicionarState();
}

class _AdicionarState extends State<Adicionar> {
  TextEditingController nome_pedido = TextEditingController();
  TextEditingController valor_pedido = TextEditingController();
  TextEditingController descricao = TextEditingController();

  @override
  Widget build(BuildContext context) {
    return Scaffold(
        appBar: AppBar(
          title: const Text("Pedido"),
        ),
        body: Form(
          child: Padding(
            padding: const EdgeInsets.all(8.0),
            child: Column(
              mainAxisAlignment: MainAxisAlignment.spaceEvenly,
              children: [
                TextFormField(
                    controller: nome_pedido,
                    decoration: const InputDecoration(
                      icon: Icon(Icons.text_snippet_rounded),
                      hintText: "Insira o Pedido",
                      labelText: 'Nome',
                    )),
                TextFormField(
                    controller: valor_pedido,
                    decoration: const InputDecoration(
                      icon: Icon(Icons.attach_money),
                      hintText: "Valor do Pedido",
                      labelText: 'Valor',
                    )),
                TextFormField(
                    controller: descricao,
                    decoration: const InputDecoration(
                      icon: Icon(Icons.format_list_bulleted),
                      hintText: "Descreva o Pedido",
                      labelText: 'Descreva',
                    )),
                ElevatedButton(
                    onPressed: (() {
                      String name = nome_pedido.text;
                      String price = valor_pedido.text;
                      String texto = descricao.text;
                      Service phr = Service();
                      phr.save(texto, name, price);
                      context.read<Providers>().onChanged();
                      Navigator.pop(context);
                      ScaffoldMessenger.of(context).showSnackBar(const SnackBar(
                        content: Text('Sucesso'),
                        duration: Duration(seconds: 3),
                      ));
                    }),
                    child: const Text("Cadastro de Pedido"))
              ],
            ),
          ),
        ));
  }
}
