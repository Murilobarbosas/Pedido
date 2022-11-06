import 'package:flutter/material.dart';
import 'package:get/get.dart';
import 'package:lista_produtos/home/http/adicionar.dart';
import 'package:lista_produtos/home/http/home_page.dart';
import 'package:lista_produtos/home/http/pedidoBindings.dart';

void main() {
  runApp(const MyApp());
}

class MyApp extends StatelessWidget {
  const MyApp({Key? key}) : super(key: key);

  // This widget is the root of your application.
  @override
  Widget build(BuildContext context) {
    return GetMaterialApp(
      debugShowCheckedModeBanner: false,
      getPages: [
        GetPage(
          name: '/',
          page: () => const HomePage(),
          binding: PedidoBindings(),
          children: [
            GetPage(
              name: '/home',
              page: () => const HomePage(),
              binding: PedidoBindings(),
            ),
            GetPage(name: '/adicionar', page: () => const Adicionar())
          ],
        )
      ],
    );
  }
}
