// ignore_for_file: prefer_const_constructors

import 'package:flutter/material.dart';
import 'package:flutter/src/widgets/container.dart';
import 'package:flutter/src/widgets/framework.dart';
import 'package:flutter_modular/flutter_modular.dart';
import 'package:flutter_mobx/flutter_mobx.dart';

import '../controller/pessoa_controller.dart';

class ListarPessoasPage extends StatefulWidget {
  const ListarPessoasPage({super.key});

  @override
  State<ListarPessoasPage> createState() => _ListarPessoasPageState();
}

class _ListarPessoasPageState extends State<ListarPessoasPage> {
  var controller = Modular.get<Controller>();
  @override
  void initState() {
    getPessoas();
    super.initState();
  }

  getPessoas() async {
    await controller.readAllPessoas();
  }

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(
        title: Text('Listagem de pessoas'),
      ),
      body: (controller.listPessoas.isEmpty)
          ? Center(
              child: Text('Nenhuma pessoa cadastrada'),
            )
          : Observer(builder: (context) {
              return ListView.builder(
                itemCount: controller.listPessoas.length,
                itemBuilder: (context, index) => ListTile(
                    title: Text(
                      controller.listPessoas[index].nome,
                    ),
                    subtitle: Text(controller.listPessoas[index].email),
                    leading:
                        Text(controller.listPessoas[index].idade.toString()),
                    trailing: IconButton(
                        onPressed: () => showDialog(
                              context: context,
                              builder: (context) => Container(
                                  height: 500,
                                  child: AlertDialog(
                                    title: Text(
                                        'Deseja realemnte exclui esse registro?'),
                                    actions: [
                                      TextButton(
                                          onPressed: () => Modular.to.pop(),
                                          child: Text('Cancelar')),
                                      TextButton(
                                          onPressed: () async {
                                            Modular.to.pop();
                                            await controller.deletePessoa(
                                                controller
                                                    .listPessoas[index].id!);
                                            setState(() {});
                                          },
                                          child: Text('Confirmar')),
                                    ],
                                  )),
                            ),
                        icon: Icon(
                          Icons.close,
                          color: Colors.red,
                        ))),
              );
            }),
    );
  }
}
