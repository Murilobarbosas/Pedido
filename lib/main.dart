import 'package:flutter/material.dart';
import 'package:get/get.dart';
import 'package:lista_produtos/home/http/adicionar.dart';
import 'package:lista_produtos/home/http/home_page.dart';
import 'package:lista_produtos/home/http/pedidoBindings.dart';

void main() {
  runApp(MyApp());
}

class MyApp extends StatelessWidget {
  // This widget is the root of your application.
  @override
  Widget build(BuildContext context) {
    return GetMaterialApp(
      debugShowCheckedModeBanner: false,
      getPages: [
        GetPage(
          name: '/',
          page: () => HomePage(),
          binding: PedidoBindings(),
          children: [
            GetPage(
              name: '/home',
              page: () => HomePage(),
              binding: PedidoBindings(),
            ),
            GetPage(name: '/adicionar', page: () => Adicionar())
          ],
        )
      ],
    );
  }
}
