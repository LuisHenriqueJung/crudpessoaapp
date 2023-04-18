import 'package:crud_pessoas/controller/pessoa_controller.dart';
import 'package:flutter_modular/flutter_modular.dart';

import '../pages/cadastrar_page.dart';
import '../pages/home_page.dart';
import '../pages/listar_page.dart';

class CrudModule extends Module {
  @override
  List<Bind> get binds => [Bind((i) => Controller())];
  @override
  List<ModularRoute> get routes => [
        ChildRoute(
          '/',
          child: (context, args) => const HomePage(),
        ),
        ChildRoute(
          '/listagem',
          child: (context, args) => const ListarPessoasPage(),
        ),
        ChildRoute(
          '/cadastrar',
          child: (context, args) => const CadastrarPage(),
        )
      ];
}
