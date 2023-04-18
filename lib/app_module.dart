import 'package:crud_pessoas/controller/pessoa_controller.dart';
import 'package:crud_pessoas/modules/crudmodule.dart';
import 'package:crud_pessoas/pages/cadastrar_page.dart';
import 'package:crud_pessoas/pages/home_page.dart';
import 'package:crud_pessoas/pages/listar_page.dart';
import 'package:flutter/cupertino.dart';
import 'package:flutter/material.dart';
import 'package:flutter/services.dart';
import 'package:flutter_modular/flutter_modular.dart';

import 'modules/meumodulo.dart';

class AppModule extends Module {
  @override
  List<Bind> get binds => [];

  @override
  List<ModularRoute> get routes => [
        ModuleRoute('/', module: CrudModule()),
        ModuleRoute(
          '/crud/',
          module: MeuModulo(),
        )
      ];
}

class AppWidget extends StatelessWidget {
  Widget build(BuildContext context) {
    SystemChrome.setSystemUIOverlayStyle(SystemUiOverlayStyle(
      systemNavigationBarColor: Colors.grey[300], // navigation bar color
      statusBarColor: Colors.transparent, // status bar color
    ));
    return MaterialApp.router(
      title: 'My Smart App',
      theme: ThemeData(
          primarySwatch: Colors.lightBlue,
          appBarTheme: const AppBarTheme(foregroundColor: Colors.white)),
      routeInformationParser: Modular.routeInformationParser,
      routerDelegate: Modular.routerDelegate,
    ); //added by extension
  }
}
