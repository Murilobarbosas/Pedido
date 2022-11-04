import 'package:flutter/material.dart';
import 'package:get/get.dart';
import 'package:lista_produtos/home/http/Http_bindings.dart';
import 'package:lista_produtos/home/http/adicionar.dart';

import 'home/http/home_page.dart';

void main() {
  runApp(const MyApp());
}

class MyApp extends StatelessWidget {
  const MyApp({Key? key}) : super(key: key);

  @override
  Widget build(BuildContext context) {
    return GetMaterialApp(
      debugShowCheckedModeBanner: false,
      getPages: [
        GetPage(
            name: '/',
            page: () => HomePage(),
            binding: HttpBindings(),
            children: [GetPage(name: "/adicionar", page: () => Adicionar())])
      ],
    );
  }
}
