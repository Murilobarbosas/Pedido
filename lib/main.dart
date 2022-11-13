import 'package:flutter/material.dart';
import 'package:lista_produtos/View/adicionar.dart';
import 'package:lista_produtos/View/home_page.dart';
import 'package:provider/provider.dart';

import 'Providers/provider.dart';

void main() {
  runApp(const MyApp());
}

class MyApp extends StatelessWidget {
  const MyApp({Key? key}) : super(key: key);

  // This widget is the root of your application.
  @override
  Widget build(BuildContext context) {
    return MultiProvider(
        providers: [
          ChangeNotifierProvider(
            create: (context) => Providers(),
          ),
        ],
        child: MaterialApp(
          debugShowCheckedModeBanner: false,
          initialRoute: '/Home',
          routes: {
            '/Home': (context) => const HomePage(),
            '/Adicionar': (context) => const Adicionar()
          },
        ));
  }
}
