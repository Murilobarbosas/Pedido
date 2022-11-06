import 'package:flutter/material.dart';
import 'package:lista_produtos/home/http/home_page.dart';

Future<void> main() async {
  runApp(MaterialApp(
    debugShowCheckedModeBanner: false,
    home: Scaffold(
      appBar: AppBar(
        title: const Text("Pedidos"),
      ),
    ),
    initialRoute: '/home_page',
    routes: {
      '/home_page': (context) => HomePage(),
    },
  ));
}
